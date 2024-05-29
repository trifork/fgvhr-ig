// Alias: $audit-event-type = http://terminology.hl7.org/CodeSystem/audit-event-type
// Alias: $restful-interaction = http://hl7.org/fhir/restful-interaction
// Alias: $v3-RoleClass = http://terminology.hl7.org/CodeSystem/v3-RoleClass
// Alias: $security-source-type = http://terminology.hl7.org/CodeSystem/security-source-type
// Alias: $object-role = http://terminology.hl7.org/CodeSystem/object-role

// Instance: cpr-identifier-example
// InstanceOf: AuditEvent
// Description: "An audit event for getting data on a Patient"
// Usage: #example
// * type = $audit-event-type#rest "RESTful Operation"
// * subtype = $restful-interaction#create
// * action = #C
// * recorded = "2024-05-22T09:17:52.709+00:00"
// * outcome = #0
// * outcomeDesc = "AuditEvent"

// //The individual who takes the call, and makes the request
// * agent[0].role = $v3-RoleClass#AGNT
// * agent[=].who.identifier.system = "urn:oid:1.2.208.176.1.2"
// * agent[=].who.identifier.value = "0202820103"
// * agent[=].who.type = "PractitionerRole"
// * agent[=].who.display = "Terry Telefonmand"
// * agent[=].name = "Dispatcher"
// * agent[=].requestor = true

// //The system handling the request for the Agent
// * agent[+].role = $v3-RoleClass#PROV
// * agent[=].who.identifier.system = "urn:oid:1.2.208.176.1.1"
// * agent[=].who.identifier.value = "615961000016003"
// * agent[=].who.type = "System"
// * agent[=].who.display = "SOR-kode for Logis Region Midt"
// * agent[=].type = $security-source-type#2 "Data Interface"
// * agent[=].name = "AMK Vagtcentral"
// * agent[=].requestor = false

// //Ambulance which receives the data
// * agent[+].role = $v3-RoleClass#PROV
// * agent[=].who.identifier.system = "urn:logis:audit:otel/trace"
// * agent[=].who.identifier.value = "6860b86b78dc73af887ceb3146bc676c"
// * agent[=].who.display = "Skærm, som viser information til ambulancefolk"
// * agent[=].type = $security-source-type#1 "User Device"
// * agent[=].name = "Ambulance"
// * agent[=].requestor = false

// //If CPR of Practitioner is known
// * agent[+].role = $v3-RoleClass#LIC
// * agent[=].who.identifier.system = "urn:oid:1.2.208.176.1.2"
// * agent[=].who.identifier.value = "0108589995"
// * agent[=].who.type = "Practitioner"
// * agent[=].who.display = "Personale 1, som rykkede ud"
// * agent[=].name = "Ambulance personale"
// * agent[=].requestor = false

// //If CPR of Practitioner is not known
// * agent[+].role = $v3-RoleClass#LIC
// * agent[=].who.identifier.system = "BSK-system"
// * agent[=].who.identifier.value = "BSK/123"
// * agent[=].who.type = "Practitioner"
// * agent[=].who.display = "Personale 2, som rykkede ud. Vedkommende er ikke kendt med CPR-nummer ved indmelding."
// * agent[=].name = "Ambulance personale"
// * agent[=].requestor = false

// //The calling system
// * source.observer.identifier.system = "urn:logis:audit/source"
// * source.observer.identifier.value = "Logis Region Midt"
// * source.type = $security-source-type#4 "Application Server"

// //Patient whom's data was accessed
// * entity[+].what.identifier.system = "urn:oid:1.2.208.176.1.2"
// * entity[=].what.identifier.value = "0108589995"
// * entity[=].what.type = "Consent"
// * entity[=].role = $object-role#4
// * entity[=].name = "A Patient's Consents"
// * entity[=].description = "Patient Consents from the search query"


// Instance: non-profiled-consent
// InstanceOf: Consent
// Description: "Response object when calling for Consents of a Patient"
// Usage: #example
// * meta.lastUpdated = "2024-05-17T07:54:58.849+02:00"
// * identifier.use = #official
// * identifier.system = "urn:oid:1.2.208.184"
// * identifier.value = "urn:uuid:dbd8639f-5eed-429c-8e20-3e8370ded233"
// * identifier.assigner.display = "MedCom"
// * status = #active
// * scope = $consentscope#treatment "Treatment Consent"
// * category = $consentcategorycodes#dnr "Do Not Resuscitate"
// * patient.identifier.system = "urn:oid:1.2.208.176.1.2"
// * patient.identifier.value = "0101521114"
// * dateTime = "2023-10-20T12:42:43+02:00"
// * sourceReference.type = "Consent"
// * sourceReference.identifier.value = "7b1bcb3d-6edc-4855-808d-7bf7f65c7703"
// * sourceReference.identifier.use = #official
// * sourceReference.identifier.system = "urn:oid:1.2.208.184"
// * sourceReference.identifier.assigner.display = "MedCom"
