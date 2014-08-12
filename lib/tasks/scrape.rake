require_relative "../assets/piano_trio_quartet_scraper"

# namespace :db do
	desc 'Scraping'
	task :scrape_the_quartets => :environment do
		
		Piece.load_pieces
	  
	end
# end