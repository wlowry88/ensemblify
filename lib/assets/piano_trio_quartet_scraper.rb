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

	def get_trio_hash
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

  def get_quartet_hash
    puts "i'm in get quartet divs "
    my_results = 
    self.doc.search("div#mw-content-text table ul>li").collect do |div|
      {div.children.first.text =>
      div.css("li").collect do |element|
        element.text
      end
      }
    end
    my_results.each do |hash|
      hash.delete_if do |key, value|
        value.empty?
      end
    end
    my_results.delete_if { |row| row.empty? }
    my_results
  end

	def save_pieces(hash)
		puts "i'm in save pieces "
    hash.collect do |composer_pieces|
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

end
