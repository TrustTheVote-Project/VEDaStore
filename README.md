
# Setup

Set up a rails app

    $ rails new my_app

Add this to your Gemfile

    gem "vedastore", "1.1.0", :git=>"https://github.com/TrustTheVote-Project/VEDaStore", require: 'vedastore', branch: 'extract-vedaspace'
  
  
Install the gems, install the db migrations and migrate

    $ bundle install
    $ rake vedastore:install:migrations
    $ rake db:migrate
  

# Use

The simplest way to see how it works is running the console. This will read a report file and save it to the database.

    $ rails console
    > report = Vedastore::ElectionReport.parse_nisterr_file("MyNISTERRFile.xml")
    > report.save!
  
To generate a NIST ERR file from a report you run

    > report = Vedastore::ElectionReport.last
    > noko_doc = report.to_xml_node.doc
    > File.open("MyWrittenOutFile.xml", "w+") {|f| f.write noko_doc.to_s }
  
ERR objects can also be created directly. For example

    > district = Vedastore::ReportingUnit.new
    > district.is_electoral_district = true
    > district.save!

    > authority = Vedastore::Person.new
    > authority.object_id = "AuthorityObjectIDRefOne"
    > authority.first_name = "Name One"
    > district.authorities << authority

    > district.save!
  

or 
  
    > authority2 = Vedastore::Person.new
    > authority2.object_id = "AuthorityObjectIDRefTwo"
    > authority2.first_name = "Name Two"
    > authority2.save!
    > district.gp_unit_authority_id_refs << Vedastore::GpUnitAuthorityIdRef.new(authority: authority2)
    > district.save!
    > puts district.to_xml_node.doc.to_s

    <?xml version="1.0"?>
    <ReportingUnit IsElectoralDistrict="true">
      <AuthorityId>AuthorityObjectIDRefOne</AuthorityId>
      <AuthorityId>AuthorityObjectIDRefTwo</AuthorityId>
    </ReportingUnit>
  
  
# Background

This rails engine uses the VEDaSpace gem (https://github.com/TrustTheVote-Project/VEDaSpace) to parse NIST ERR formatted election data. 
http://www.nist.gov/itl/vote/ieee-swg-p1622.cfm
