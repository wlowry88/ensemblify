require_relative "../assets/piano_trio_quartet_scraper"
require_relative "../assets/wind_quintet_scraper"

# namespace :db do
	desc 'Scraping'
	task :scrape_the_quartets => :environment do
		
		piano_trio_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_trio_repertoire', 'piano trio')
		piano_trio_pieces.save_pieces(piano_trio_pieces.get_trio_hash)
		
		piano_quartet_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_quartet', 'piano quartet')
		piano_quartet_pieces.save_pieces(piano_quartet_pieces.get_quartet_hash)

		wind_quintet_pieces = WindQuintetScraper.new('http://imslp.org/wiki/List_of_Compositions_for_Woodwind_Quintet', 'wind quintet')
		wind_quintet_pieces.save_pieces
	  
	end
# end