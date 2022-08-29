class VansController < ApplicationController

  def index
    @vans = Van.all
  end

  def new
    @van = Van.new
  end
end
