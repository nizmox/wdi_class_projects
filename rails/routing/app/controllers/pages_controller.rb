class PagesController < ApplicationController
  def start

  end

  def a
  end

  def b
  end

  def one

  end

  def two

  end

  def three

  end

  def door
    case params[:option].downcase
    when '1' then redirect_to('/1')
    when '2' then redirect_to('/2')
    when '3' then redirect_to('/3')
    when 'a' then redirect_to('/a')
    when 'b' then redirect_to('/b')
    end #end of case
  end
end