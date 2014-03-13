require 'pry'

require 'pg'

require 'sinatra'
require 'sinatra/reloader'

require 'active_record'

# class Student
#   attr_accessor :first_name, :age, :gender
#   def initialize(first_name,age,gender)
#     @first_name = first_name
#     @age = age
#     @gender = gender
#   end
# end


#to handle database connections
before do
  puts "------------------------------------------------------------------"
  puts "- Connecting to Database..."
  puts "------------------------------------------------------------------"
  $db = PG.connect(:dbname => 'students', :host => 'localhost')
end

after do
  puts "------------------------------------------------------------------"
  puts "- Closing Database connection..."
  puts "------------------------------------------------------------------"
  $db.close if $db
end

get '/' do
  @courses = query_db('SELECT * FROM courses;')
  @students = query_db('SELECT * FROM students;')
  erb :home
end

#routes
get '/courses/:id' do
  @course = query_db("SELECT * FROM courses WHERE id=#{params[:id]}").first

  @students = query_db("SELECT students.*
                        FROM courses
                        JOIN courses_students ON courses_students.course_id = courses.id
                        JOIN students ON students.id = courses_students.student_id
                        WHERE courses.id = #{params[:id]};")

  erb :course
end

get '/students/:id' do
  @student = query_db("SELECT * FROM students WHERE id=#{params[:id]}").first

  @courses = query_db("SELECT courses.*
                        FROM students
                        JOIN courses_students ON courses_students.student_id = students.id
                        JOIN courses ON courses.id = courses_students.course_id
                        WHERE students.id = #{params[:id]};")
  erb :student
end

def query_db(sql)
  puts "------------------------------------------------------------------"
  puts "- Query Executed: #{sql}"
  puts "------------------------------------------------------------------"
  #run the sql statement
  results = $db.exec(sql)
end