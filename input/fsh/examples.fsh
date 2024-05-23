
Alias: $audit-event-type = http://terminology.hl7.org/CodeSystem/audit-event-type
Alias: $restful-interaction = http://hl7.org/fhir/restful-interaction
Alias: $security-source-type = http://terminology.hl7.org/CodeSystem/security-source-type
Alias: $object-role = http://terminology.hl7.org/CodeSystem/object-role


Instance: bsk-identifier-example
InstanceOf: AuditEvent
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2024-05-22T09:17:53.425+00:00"
* type = $audit-event-type#rest "RESTful Operation"
* subtype = $restful-interaction#create
* action = #C
* recorded = "2024-05-22T09:17:52.709+00:00"
* outcome = #0
* outcomeDesc = "AuditEvent"
* agent.role = $v3-RoleClass#PROV
* agent.who.reference.identifier.system = "http://rm.dk/bsk"
* agent.who.reference.identifier.value = "00FD345"
* agent.who.reference.identifier.value = "Practitioner"
* agent.who.reference.display = "Chris Christiansen"
* agent.altId = "a784da10-d1c9-4de6-bcae-9a189d97bc4a"
* agent.requestor = true
* source.observer.identifier.system = "urn:trifork:audit/source"
* source.observer.identifier.value = "eir-orchestrator"
* source.type = $security-source-type#4
* entity[0].what.identifier.system = "urn:trifork:audit:otel/trace"
* entity[=].what.identifier.value = "6860b86b78dc73af887ceb3146bc676c"
* entity[=].type = $security-source-type#2 "Data Interface"
* entity[=].role = $object-role#21 "Job Stream"
* entity[+].what.reference.system = "urn:oid:1.2.208.176.1.2"
* entity[=].what.reference.value = "0108589995"
* entity[=].what.reference.type = "Patient"
* entity[=].role = $object-role#1

Instance: cpr-identifier-example
InstanceOf: AuditEvent
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2024-05-22T09:17:53.425+00:00"
* type = $audit-event-type#rest "RESTful Operation"
* subtype = $restful-interaction#create
* action = #C
* recorded = "2024-05-22T09:17:52.709+00:00"
* outcome = #0
* outcomeDesc = "AuditEvent"
* agent.role = $v3-RoleClass#PROV
* agent.who.reference.identifier.system = "urn:oid:1.2.208.176.1.2"
* agent.who.reference.identifier.value = "0202820103"
* agent.who.reference.identifier.value = "Practitioner"
* agent.who.reference.display = "Chris Christiansen"
* agent.altId = "a784da10-d1c9-4de6-bcae-9a189d97bc4a"
* agent.requestor = true
* source.observer.identifier.system = "urn:trifork:audit/source"
* source.observer.identifier.value = "eir-orchestrator"
* source.type = $security-source-type#4
* entity[0].what.identifier.system = "urn:trifork:audit:otel/trace"
* entity[=].what.identifier.value = "6860b86b78dc73af887ceb3146bc676c"
* entity[=].type = $security-source-type#2 "Data Interface"
* entity[=].role = $object-role#21 "Job Stream"
* entity[+].what.reference.system = "urn:oid:1.2.208.176.1.2"
* entity[=].what.reference.value = "0108589995"
* entity[=].what.reference.type = "Patient"
* entity[=].role = $object-role#1

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
* sourceReference.identifier.value = "7b1bcb3d-6edc-4855-808d-7bf7f65c7703"
* sourceReference.identifier.use = #official
* sourceReference.identifier.system = "urn:oid:1.2.208.184"
* sourceReference.identifier.assigner.display = "MedCom"
