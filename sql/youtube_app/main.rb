require 'pry'

require 'sinatra'
require 'sinatra/reloader'

require 'sqlite3'

require 'uri'
require 'cgi'

get '/' do
  erb :home
end

get '/videos' do
  sql = 'SELECT * FROM videos;'

  @videos = query_db(sql)

  # binding.pry

  erb :videos
end

get '/videos/new' do
  erb :new_video
end

post '/videos/create' do

  safe_params = sql_safe(params)

  sql = "INSERT INTO videos (title, description, url, genre) 
  VALUES ('#{safe_params["title"]}','#{safe_params["description"]}','#{safe_params["url"]}','#{safe_params["genre"]}');"

  query_db(sql)

  binding.pry

  #find the ID of the newly created movie
  id = query_db('SELECT MAX(ID) FROM videos;').first['MAX(ID)']

  redirect to("/videos/#{id}")
end

post '/videos/:id/update' do

  safe_params = sql_safe(params)

  sql = "UPDATE videos
          SET title = '#{ safe_params['title'] }',
              description = '#{ safe_params['description'] }',
              url = '#{ safe_params['url'] }',
              genre = '#{ safe_params['genre'] }'
          WHERE id=#{ safe_params['id'] };"
  
  query_db(sql)

  redirect to("/videos/#{safe_params['id']}")

end

get '/videos/:id/edit' do
  sql = "SELECT * FROM videos WHERE id=#{params[:id]};"
  
  @video = query_db(sql).first

  erb :edit_video
end

get '/videos/:id/delete' do
  sql = "DELETE FROM videos WHERE id=#{params[:id]};"

  query_db(sql)

  redirect to('/videos')
end

get '/videos/:id' do
  sql = "SELECT * FROM videos WHERE id=#{params[:id]};"

  @video = query_db(sql).first

  url_params = CGI.parse(URI.parse(@video['url']).query)
  @video['code'] = url_params['v'].first # => 'yunSRfnsVck'

  erb :video
end

#code to connect to the database
def query_db(sql)
  #specifies the path of our database file
  db = SQLite3::Database.open('videos.db')

  #forces results returned to be hash format
  db.results_as_hash = true

  #puts a message showing the SQL statement to be executed
  puts "----------------------------------------------------------------"
  puts "Executing SQL: #{ sql }"
  puts "----------------------------------------------------------------"

  #execute the query and return the result
  db.execute(sql)
end

def sql_safe(values)
  safe_values = {}
  
  values.each do |k,v|
    safe_values[k] = v.gsub("'","''") if v.class == String
  end

  safe_values
end