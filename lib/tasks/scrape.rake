require_relative "../assets/piano_trio_quartet_scraper"

# namespace :db do
	desc 'Scraping'
	task :scrape_the_quartets => :environment do
		
		piano_trio_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_trio_repertoire', 'piano trio')
		piano_trio_pieces.save_pieces(piano_trio_pieces.get_trio_hash)
		
		piano_quartet_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_quartet', 'piano quartet')
		piano_quartet_pieces.save_pieces(piano_quartet_pieces.get_quartet_hash)
	  
	end
# end