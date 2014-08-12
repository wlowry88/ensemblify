require 'open-uri'
require_relative "../../config/environment"
require 'pry'

class PiecesScraper

	def initialize(url, instrumentation)
		puts "i'm initializing"
		@doc = Nokogiri::HTML(open(url))
		@instrumentation = Instrumentation.find_by(name: instrumentation)
		puts "#{@instrumentation}"
	end

	def doc
		@doc
	end

	def instrumentation
		@instrumentation
	end

	def value_missing
		"Value Not Provided"
	end

	def get_composer_divs
    my_results = 
    self.doc.search("div#mw-content-text >ul>li").collect do |div|
      {div.children.first.text =>
      div.css("li").collect do |element|
        element.text
      end
      }
    end
    my_results
	end

	def save_pieces
		puts "i'm in save pieces "
		my_results = get_composer_divs
    my_results.collect do |composer_pieces|
      composer_pieces.collect do |composer, pieces|
        pieces.each do |piece|
          p = Piece.new
          p.composer = composer
          p.name = piece
          p.instrumentation_id = self.instrumentation.id
          p.save
          puts "just saved #{p.name} by #{p.composer}"
        end
      end
    end
	end

	def save_quartet_pieces
		puts "i'm in save QUARTET pieces "

		rows = get_piece_rows
		puts "row: #{rows}"
		rows.collect do |row|
			composer = row[0]
			puts "composer: #{composer}"
			row[1..-1].first.split("\n").each do |piece_in_array|
				p = Piece.new
				p.composer = composer
				p.name = piece_in_array
				p.instrumentation = self.instrumentation
				p.save
				puts "saving #{p}"
			end
		end
	end

end
