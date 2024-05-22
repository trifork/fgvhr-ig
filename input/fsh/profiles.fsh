Profile: FGVHRAuditEvent
Parent: IHE.BasicAudit.PatientCreate
Description: "AuditEvents to be sent to MinLog"

Alias: $audit-event-type = http://terminology.hl7.org/CodeSystem/audit-event-type
Alias: $restful-interaction = http://hl7.org/fhir/restful-interaction
Alias: $security-source-type = http://terminology.hl7.org/CodeSystem/security-source-type
Alias: $object-role = http://terminology.hl7.org/CodeSystem/object-role

Instance: fut-audit-event
InstanceOf: AuditEvent
Usage: #example
* type = $audit-event-type#rest "RESTful Operation"
* subtype = $restful-interaction#create
* action = #C
* recorded = "2021-09-03T08:56:54.596+02:00"
* outcome = #0
* outcomeDesc = "Communication"
* agent[0].who.identifier.system = "http://ehealth.sundhed.dk"
* agent[=].who.identifier.value = "http://localhost:55326/fhir/Practitioner/9"
* agent[=].requestor = true
//* agent[+].purposeOfUse = agent1#system
* agent[=].purposeOfUse.text = "a1-c1-text"
* source.observer.identifier.system = "http://ehealth.sundhed.dk"
* source.observer.identifier.value = "http://localhost:8484/fhir/"
* source.type = $security-source-type#4
* entity[0].what.identifier.system = "http://ehealth.sundhed.dk"
* entity[=].what.identifier.value = "e24a5a3479bb433c978afd40ab7e2067"
* entity[=].type = $security-source-type#2 "Data Interface"
* entity[=].role = $object-role#21 "Job Stream"
* entity[+].what = Reference(http://localhost:8484/fhir/Patient/745)
* entity[=].role = $object-role#1
* entity[+].what = Reference(http://localhost:8484/fhir/Communication/746/_history/1)
* entity[=].role = $object-role#4

Profile: FGVHRConsent
Parent: Consent
Description: "Consents as they will be seen from Logis"

Alias: $consentscope = http://terminology.hl7.org/CodeSystem/consentscope
Alias: $consentcategorycodes = http://terminology.hl7.org/CodeSystem/consentcategorycodes

Instance: non-profiled-consent
InstanceOf: Consent
Usage: #example
* meta.lastUpdated = "2024-05-17T07:54:58.849+02:00"
* identifier.use = #official
* identifier.system = "urn:oid:1.2.208.184"
* identifier.value = "urn:uuid:dbd8639f-5eed-429c-8e20-3e8370ded233"
* identifier.assigner.display = "MedCom"
* status = #active
* scope = $consentscope#treatment "Treatment Consent"
* category = $consentcategorycodes#dnr "Do Not Resuscitate"
* patient.identifier.system = "urn:oid:1.2.208.176.1.2"
* patient.identifier.value = "0101521114"
* dateTime = "2023-10-20T12:42:43+02:00"
* sourceReference.type = "Consent"
* sourceReference.identifier.id = "7b1bcb3d-6edc-4855-808d-7bf7f65c7703"
* sourceReference.identifier.use = #official
* sourceReference.identifier.system = "urn:oid:1.2.208.184"
* sourceReference.identifier.assigner.display = "MedCom"


Instance: capabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
* name = "RestServer"
* status = #active
* date = "2024-05-22T15:07:56.858+02:00"
* publisher = "Not provided"
* kind = #instance
* software.name = "Trifork FHIR Server"
* software.version = "7.0.2"
* implementation.description = "Trifork FHIR"
* implementation.url = "http://localhost:8080/fhir"
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #xml
* format[+] = #application/fhir+json
* format[+] = #json
* format[+] = #html/json
* format[+] = #html/xml
* rest.mode = #server
* rest.resource[0].type = #AuditEvent
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/AuditEvent"
* rest.resource[=].interaction.code = #create
* rest.resource[=].conditionalCreate = false
* rest.resource[+].type = #Consent
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/Consent"
* rest.resource[=].interaction.code = #search-type
* rest.resource[=].searchInclude[0] = "*"
* rest.resource[=].searchInclude[+] = "Consent:patient"
* rest.resource[=].searchRevInclude = "Consent:patient"
* rest.resource[=].searchParam.name = "patient"
* rest.resource[=].searchParam.type = #reference
* rest.resource[=].searchParam.documentation = "Who the consent applies to"