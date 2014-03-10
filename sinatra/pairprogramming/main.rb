require 'pry'
require 'sinatra'
require 'sinatra/reloader'

class Question
  attr_accessor :code, :text, :responses

  def initialize(code, text, responses)
    @code = code
    @text = text
    @responses = responses
  end
end

get '/' do

  redirect to('/Q1')

end

get '/:question' do

@questions = {
  "Q1" => Question.new("Q1","Do you have a test for that?",{"Yes" => "Q3","No" => "Q2"}),
  "Q2" => Question.new("Q2","Write a test",{"Done" => "Q3"}),
  "Q3" => Question.new("Q3","Does the test pass?",{"Yes" => "Q5","No" => "Q4"}),
  "Q4" => Question.new("Q4","Write just enough code for the test to pass",{"Done" => "Q3"}),
  "Q5" => Question.new("Q5","Need to refactor?",{"Yes" => "Q6","No" => "Q7"}),
  "Q6" => Question.new("Q6","Refactor the code",{"Done" => "Q3"}),
  "Q7" => Question.new("Q7","Select a new feature to implement",{"Continue" => "Q1"})
  }

  @current_question = @questions[params[:question]]

  erb :home

end