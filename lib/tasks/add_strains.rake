require 'open-uri'
namespace :strains do
  desc "add strains from leafly"
  task :add => :environment do
    @response = HTTParty.get('http://www.leafly.com/api/strains')
    @response.each do |item| 
      @product = Strain.create(name: item['Name'], abstract: item['Abstract'], category: item['Category'], rating: item['Rating'])
    end
  end
end