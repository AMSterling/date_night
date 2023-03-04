class Node
  attr_reader :data, :score
  attr_accessor :left, :right, :depth

  def initialize(score, movie_title)
  	@data = Hash.new
  	@data[movie_title] = score
  	@left = nil
  	@right = nil
    @score = score
    @depth = nil
  end
end
