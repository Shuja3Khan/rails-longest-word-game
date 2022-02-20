require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @included = included?(@word, @letter)
    @english_word = english_word(@word)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word(word)
    response = "https://wagon-dictionary.herokuapp.com/#{word}"
    user_serialized = URI.open(url).read
    json = JSON.parse(user_serialized)
  end
end
