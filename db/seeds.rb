# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

state_list = [
   ['Alabama', 'AL'],
   ['Alaska', 'AK'],
   ['Arizona', 'AZ'],
   ['Arkansas', 'AR'],
   ['California', 'CA'],
   ['Colorado', 'CO'],
   ['Connecticut', 'CT'],
   ['Delaware', 'DE'],
   ['District of Columbia', 'DC'],
   ['Florida', 'FL'],
   ['Georgia', 'GA'],
   ['Hawaii', 'HI'],
   ['Idaho', 'ID'],
   ['Illinois', 'IL'],
   ['Indiana', 'IN'],
   ['Iowa', 'IA'],
   ['Kansas', 'KS'],
   ['Kentucky', 'KY'],
   ['Louisiana', 'LA'],
   ['Maine', 'ME'],
   ['Maryland', 'MD'],
   ['Massachusetts', 'MA'],
   ['Michigan', 'MI'],
   ['Minnesota', 'MN'],
   ['Mississippi', 'MS'],
   ['Missouri', 'MO'],
   ['Montana', 'MT'],
   ['Nebraska', 'NE'],
   ['Nevada', 'NV'],
   ['New Hampshire', 'NH'],
   ['New Jersey', 'NJ'],
   ['New Mexico', 'NM'],
   ['New York', 'NY'],
   ['North Carolina', 'NC'],
   ['North Dakota', 'ND'],
   ['Ohio', 'OH'],
   ['Oklahoma', 'OK'],
   ['Oregon', 'OR'],
   ['Pennsylvania', 'PA'],
   ['Rhode Island', 'RI'],
   ['South Carolina', 'SC'],
   ['South Dakota', 'SD'],
   ['Tennessee', 'TN'],
   ['Texas', 'TX'],
   ['Utah', 'UT'],
   ['Vermont', 'VT'],
   ['Virginia', 'VA'],
   ['Washington', 'WA'],
   ['West Virginia', 'WV'],
   ['Wisconsin', 'WI'],
   ['Wyoming', 'WY']
 ]
 
 state_list.each do |name, abbr|
   s = State.find_or_initialize_by(abbreviation: abbr)
   s.name = name
   s.save!
 end
 
 puts State.count