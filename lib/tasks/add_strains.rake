require 'open-uri'
require 'net/http'
require 'json'
namespace :strains do
  desc "add strains from leafly"
  task :add => :environment do
    @response = HTTParty.get('http://www.leafly.com/api/strains')
    @response.each do |item|
      @product = Strain.create(name: item['Name'], abstract: item['Abstract'], category: item['Category'], rating: item['Rating'])
    end
  end

  desc "also adds strains from leafly"
  task :add2 => :environment do
    uri = URI('http://www.leafly.com/api/strains')
    page = Net::HTTP.get(uri)
    if page
      puts "got page"
    else
      puts "something went wrong getting the page"
    end
    json = JSON.parse(page)
    if json
      puts "got json"
    else
      puts "something went wrong getting the json"
    end
    json.each do |strain|
      strain = Strain.new(name: strain['Name'], abstract: strain['Abstract'], category: strain['Category'], rating: strain['Rating'])
      if strain.save
        print "."
      else
        print "F"
      end
    end
    puts "done"
  end
end
