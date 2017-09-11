class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
  end

  def new
    @game = Game.new
  end
end
