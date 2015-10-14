# Change Log

## Version 0.0.49

* removed tie between required elements/attributes and ActiveRecord validations

* Enum values changed to lowercase hyphenated
* Some enum values removed/added
* Vssc::Enum::CodeType became Vssc::Enum::IdentifierType
* Vssc::Enum::VoteVariationType became Vssc::Enum::VoteVariation
* Added AnnotatedString type
* BallotMeasureContesnt
** Added InfoUri
** Moved OtherType and Type from attributes to elements
* BallotMeasureSelection
** made "Selection" not required
* BallotSelection
** add SequenceOrder
** Change objectId casing
* BallotStyle
** Added external identifiers
** change Id to objectId
* Candidate
** changed code to external identifiers
** changed attributes to elements
** removed Id
** removed sequence_order
* Candidate Contest
** changed attributes to elements
* Candidate Selection
** changed attribute to element
* Coalition
** Set up join tables for contest ref
* ContactInformation
** Added Directions
** added label attribute
** TODO: Set up parsing for LatLng
* Contest
** Changed Code to ExternalIdentifiers
** Changed JurisdictionalScopeId to ElectoralDistrictId
** Changed attributes to elements
** Change VoteVariationtype(s) to VoteVariation(s)
** Changed objectId casing
* CountStatus
** changed attributes to elements
** removed required elements
* Counts
** changed attributes to elements
** added IsSuppressedForPrivacy
* Device
** changed attributes to elements
** add OtherType
* Election
** changed Date to StartDate
** changed Code to ExternalIdentifiers
* Added ElectionAdministration
* ElectionReport
** Changed code to external identifiers
** Changed attributes to elements
** Removed Message
** Change Sequence to SequenceStart
* GpUnit
** Changed code to external identifiers
** Changed name attribute to element
* Hours
** Changed attributes to elements
** Added label attribute
* InternationalizedText
** changed "Identifier" attribute to "label"
** changed LanguageString element to Text
* Office
** changed Code to ExternalIdentifiers
** changed attributes to elements
** changed objectId casing
* Term
** changed attributes to elements
** added label attribute
* OfficeGroup
** changed attributes to elements
** added label attribute
* Party
** changed attributes to elements
** changed Code to ExternalIdentifiers
* PartyRegistration
** changed attributes to elements
* Person
** changed attributes to elements
* Reporting Device
** changed attributes to elements
* Reporting Unit
** changed attributes to elements
** added ElectionAdministration
** change IsElectoralDistrict to IsDistricted
* Schedule
** changed attributes to elements
** added label attribute
* SpatialDimension
** changed map_uri attribute to MapUri element
* SpatialExtent
** changed attributes to elements
* SummaryCounts
** changed attributes to elements
* VoteCounts
** changed attributes to elements

