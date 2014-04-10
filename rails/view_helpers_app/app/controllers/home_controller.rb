class HomeController < ApplicationController
  def index
  end

  def number
    @number = 1254
    @big_number = 12913192391
    @phone_number = 411757997
  end

  def text
    @animal1 = 1
    @animal2 = 2
    @shortstory = "I am listening to Mathilda talking about view helpers"
    @numbers = (1..20).to_a
  end

  def assets
  end

  def url
  end
end
