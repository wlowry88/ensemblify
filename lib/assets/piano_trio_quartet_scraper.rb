
require_relative "../../config/environment"

class PiecesScraper

	def initialize(url, instrumentation)
		@doc = Nokogiri::HTML(open(url))
		@instrumentation = Instrumentation.find_by(name: instrumentation)
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

		rows = get_piece_rows
		binding.pry
		rows.collect do |row|
			composer = row[0]
			row[1..-1].each do |element_in_row|
				element_in_row.split("\n").each do |piece_in_array|
					p = Piece.new
					p.composer = composer
					p.name = piece_in_array
					p.instrumentation = self.instrumentation
					p.save
				end
			end
		end
	end

	def save_quartet_pieces
		rows = get_piece_rows
		binding.pry
		rows.collect do |row|
			composer = row[0]
			row[1..-1].first.split("\n").each do |piece_in_array|
				p = Piece.new
				p.composer = composer
				p.name = piece_in_array
				p.instrumentation = self.instrumentation
				p.save
			end
		end
	end

end

piano_trio_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_trio_repertoire', 'piano quartet')
piano_trio_pieces.save_pieces

piano_quartet_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_quartet', 'piano quartet')
piano_quartet_pieces.save_quartet_pieces