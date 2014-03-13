require 'pry'

# require 'pg'

require 'sinatra'
require 'sinatra/reloader'

require 'active_record'
require 'protected_attributes'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :port => 5432,
  :pool => 8,
  :username => 'Nizmox', #your postgres.app username
  :password => "",
  :database => "students"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Student < ActiveRecord::Base
  has_and_belongs_to_many :courses
end

class Course < ActiveRecord::Base
  has_and_belongs_to_many :students
end

get '/' do
  @courses = Course.all #query_db('SELECT * FROM courses;')
  @students = Student.all #query_db('SELECT * FROM students;')

  # binding.pry

  erb :home
end

#routes
get '/courses/:id' do
  # @course = query_db("SELECT * FROM courses WHERE id=#{params[:id]}").first
  @course = Course.find params[:id]

  @students = @course.students

  erb :course
end

get '/students/:id' do
  @student = Student.find params[:id]

  @courses = @student.courses

  erb :student
end