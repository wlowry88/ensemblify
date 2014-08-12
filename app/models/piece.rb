require "#{Rails.root}/lib/assets/piano_trio_quartet_scraper.rb"

class Piece < ActiveRecord::Base
  belongs_to :type
  has_many :group_pieces
  has_many :groups, through: :group_pieces
  belongs_to :instrumentation

  def self.load_pieces
  	piano_trio_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_trio_repertoire', 'piano quartet')
		piano_trio_pieces.save_pieces
		
		piano_quartet_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_quartet', 'piano quartet')
		piano_quartet_pieces.save_quartet_pieces
  end
  
end
