ocd-division/country:us/state:XX/
                       /state/county
                       /state/county/district
                       /state/county/precinct (aka reporting unit)
                       /state/county/city
                       /state/city
                       /state/congressional-district
                       /state/[state-house/state-senate/state-uppper/lower etc]
                       
OCD object: [canonical]
    ID:
    Name: Travis County School District ABC
    Parent Object ID: [7 - e.g. travis county]
    Type: district   # or county or precinct or state or city or place etc.
    District Type: School District # Applies only to districts?
Potentially not necessary?
    canonical_id: school-abc #Or possibly store the entire OCD-ID
string here for better lookup/indexing

This model would then have a method OCDObject.ocd_id, that would
return ocd-division/country:us/state:tx/county:travis/district:school-abc

Shapes: [canoncical - though may not be necessary]
    ID: number
    ocd_object_id: [7 - foreign key to OCDObject.id]
    shape_data: blob of KML or ? [may not be necessary?]

ShapeSource: Indicates some source file or official office or
reporting organization
    ID:
    Name:
    Contact Info: (so we know who to talk to about this data source)
    Source Files: (points to original file data? or just an annotation?)

ImportedShapes: [holds the imported content and must be related to a
particular ShapeSource]
    ID:
    shape_source_id: [required]
    internal_id:
    ocd_object_id: #maps to OCDObject.id
    shape_data: blob or KML or ?


Jurisdiction: AKA "Authority" - Indicates some official reporting
organization - so this is "just one" potential source for data
    ID:
    Name:
    contact_info:
    Source Data: (maybe multiple fields or files or pointer or raw data?)

District: [comes from "background" data]
    ID:
    Jurisdiction_id: [points to a particular jurisdictional data source]
    Internal_id:
    OCD_ID:
    Name:
    District Type:

Precinct or ReportingUnit: [comes from "background" data]
    ID
    Jursidiction_id
    Internal_id:
    OCD_ID:
    Name:

Precinct_District: [join table
    District_ID
    Precinct_ID

Need to specify how the *import* file will indicate how to do the join

Maybe this structure just mirrors the VSSC format?
    Contest: (tied to district)
      Contest Response Choices:
        Conteset Reposonse Results (maps contest to response-choice to
ReportingUnit)
        ...etc....

