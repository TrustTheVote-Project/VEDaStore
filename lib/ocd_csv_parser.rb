require 'csv'
class OcdCsvParser
  def self.get_types_from_id(id)
    types = []
    id.split('/').each do |division|
      types << division.split(':').first
    end
    return types
  end
  
  def self.go
    file = "/Users/alexmek/Dropbox (Personal)/VoteStreamShare/country-us.csv"
    types = []
    CSV.foreach(file, headers: true) do |row|
      types += get_types_from_id(row['id'])
    end
    puts types.flatten.uniq
    return types
  end
end