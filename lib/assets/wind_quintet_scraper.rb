require 'open-uri'
require_relative "../../config/environment"

class WindQuintetScraper

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


  def get_quintet_hash
    composers = @doc.css('div.mw-content-ltr p')
    pieces = @doc.css('div.mw-content-ltr dl')
    c_names = composers.collect {|e|e.text.gsub("\n", "")}
    p_names = pieces.collect {|e|e.text}
    cp = c_names.zip(p_names)
    array_of_hashes = cp.collect {|array| {array[0] => array[1..-1]}}
    array_of_hashes
  end

  def save_pieces
    puts "i'm in save pieces "
    get_quintet_hash.collect do |composer_pieces|
      composer_pieces.collect do |composer, pieces|
        # binding.pry
        pieces[0].split("\n ").each do |piece|
          p = Piece.new
          p.composer = composer
          p.name = piece.gsub("\n", "").strip
          p.instrumentation_id = self.instrumentation.id
          p.save
          puts "just saved #{p.name} by #{p.composer}"
        end
      end
    end
  end

end

