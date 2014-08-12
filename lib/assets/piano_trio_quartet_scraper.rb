require 'open-uri'
require_relative "../../config/environment"

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

	def get_piece_rows
		my_results = 
		self.doc.search("ul li a")[27..-1].collect do |list_item|
			list_item.parent.text.split("\n\n") if list_item.parent.text.include?("\n\n")
		end.compact
	end

	def save_pieces
		puts "i'm in save pieces "
		rows = get_piece_rows
		puts "row: #{rows}"
		rows.collect do |row|
			composer = row[0]
			puts "composer: #{composer}"
			row[1..-1].each do |element_in_row|
				element_in_row.split("\n").each do |piece_in_array|
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
