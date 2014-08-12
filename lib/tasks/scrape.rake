require_relative "../assets/piano_trio_quartet_scraper"

desc 'Scraping'
task :scrape_the_quartets => :environment do
  

	
	piano_trio_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_trio_repertoire', 'piano quartet')
	piano_trio_pieces.save_pieces

	piano_quartet_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_quartet', 'piano quartet')
	piano_quartet_pieces.save_quartet_pieces
  
end