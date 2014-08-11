require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative "../../config/environment"

class StringQuartetPiecesScraper

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
    binding.pry
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


string_quartet_pieces = StringQuartetPiecesScraper.new('http://www.clarinetinstitute.com/44329%20String%20Quartet%20Archives.htm', 'string quartet')
string_quartet_pieces.save_quartet_pieces