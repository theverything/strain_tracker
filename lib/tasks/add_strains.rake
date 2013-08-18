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
    json = JSON.parse(page)
    json.each do |strain|
      Strain.create(name: strain['Name'], abstract: strain['Abstract'], category: strain['Category'], rating: strain['Rating'])
    end
  end
end
