class CalcController < ApplicationController

  def calculate
    @x = params[:x].to_f
    @y = params[:y].to_f

    @result = case params[:operator]
    when '+'
      @x + @y
    when '-'
      @x - @y
    end

  end

end