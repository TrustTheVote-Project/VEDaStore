
# Setup

Set up a rails app

    $ rails new my_app

Add this to your Gemfile

    gem "vssc_rails", "0.0.1", :git=>"https://github.com/trustthevote-project/vssc_rails"
  
  
Install the gems, install the db migrations and migrate

    $ bundle install
    $ rake vssc_rails:install:migrations
    $ rake db:migrate
  

# Use

The simplest way to see how it works is running the console. This will read a report file and save it to the database.

    $ rails console
    > report = Vssc::ElectionReport.parse_vssc_file("MyVSSCFile.xml")
    > report.save!
  
To generate a VSSC file from a report you run

    > report = Vssc::ElectionReport.last
    > noko_doc = report.to_xml_node.doc
    > File.open("MyWrittenOutFile.xml", "w+") {|f| f.write noko_doc.to_s }
  
VSSC objects can also be created directly. For example

    > district = Vssc::ReportingUnit.new
    > district.is_electoral_district = true
    > district.save!

    > authority = Vssc::Person.new
    > authority.object_id = "AuthorityObjectIDRefOne"
    > authority.first_name = "Name One"
    > district.authorities << authority

    > district.save!
  

or 
  
    > authority2 = Vssc::Person.new
    > authority2.object_id = "AuthorityObjectIDRefTwo"
    > authority2.first_name = "Name Two"
    > authority2.save!
    > district.gp_unit_authority_id_refs << Vssc::GpUnitAuthorityIdRef.new(authority: authority2)
    > district.save!
    > puts district.to_xml_node.doc.to_s

    <?xml version="1.0"?>
    <ReportingUnit IsElectoralDistrict="true">
      <AuthorityId>AuthorityObjectIDRefOne</AuthorityId>
      <AuthorityId>AuthorityObjectIDRefTwo</AuthorityId>
    </ReportingUnit>
  
