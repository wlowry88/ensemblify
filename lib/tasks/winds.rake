require_relative "../assets/wind_quintet_scraper"

desc 'Scraping'
task :scrape_the_winds => :environment do
  
  wind_quintet_pieces = WindQuintetScraper.new('http://imslp.org/wiki/List_of_Compositions_for_Woodwind_Quintet', 'wind quintet')
  wind_quintet_pieces.save_pieces
  
end