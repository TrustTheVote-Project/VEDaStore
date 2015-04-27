class Jurisdiction < ActiveRecord::Base
  
  has_many :districts
  
  
  CSV_HEADERs = [
    "ELECTIONID", #ignored
    "ID",         #internal
    "DISTRICTNAME",	
    "SEQUENCE",	
    "DISTRICTTYPE",	
    "GROUPID",	
    "VISIBLE",	
    "STANDARD_DISTRICT_TYPE",	
    "STANDARD_UID",	
    "OCD_ID"]
    
  def load_from_csv(filename)
    CSV.foreach(filename, headers: true) do |row|
      
    end
  end
  
end
