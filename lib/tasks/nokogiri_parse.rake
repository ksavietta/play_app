desc "Parse Movie Titles"
task :parse_play => :environment do

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  require 'pry'

  # url = "http://www.rottentomatoes.com/"
  # doc = Nokogiri::HTML(open(url))
  # puts "Top Box Office: " + doc.at_css(".sidebarInTheaterTopBoxOffice:nth-child(1) a").text

  # doc.css(".sidebarInTheaterTopBoxOffice a").each do |title|
  #   puts title.text
  # end

  f = File.open(Rails.root.join('lib', 'assets', 'julius_caesar.xml').to_s)
  @doc = Nokogiri::XML(f)
  f.close

end
