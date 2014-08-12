require_relative "../assets/piano_trio_quartet_scraper"

# namespace :db do
	desc 'Scraping'
	task :scrape_the_quartets => :environment do
		
		piano_trio_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_trio_repertoire', 'piano quartet')
		piano_trio_pieces.save_pieces

		puts "reached line 10"

		if Rails.env.production?
			puts RAILS_ENV
		end

		piano_quartet_pieces = PiecesScraper.new('http://en.wikipedia.org/wiki/Piano_quartet', 'piano quartet')
		piano_quartet_pieces.save_quartet_pieces
	  
	end
# end