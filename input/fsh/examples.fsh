Alias: $audit-event-type = http://terminology.hl7.org/CodeSystem/audit-event-type
Alias: $restful-interaction = http://hl7.org/fhir/restful-interaction
Alias: $v3-RoleClass = http://terminology.hl7.org/CodeSystem/v3-RoleClass
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
* agent.who.identifier.system = "http://rm.dk/bsk"
* agent.who.identifier.value = "00FD345"
* agent.who.type = "Practitioner"
* agent.who.display = "Chris Christiansen"
* agent.altId = "a784da10-d1c9-4de6-bcae-9a189d97bc4a"
* agent.requestor = true
* source.observer.identifier.system = "urn:trifork:audit/source"
* source.observer.identifier.value = "eir-orchestrator"
* source.type = $security-source-type#4
* entity[0].what.identifier.system = "urn:trifork:audit:otel/trace"
* entity[=].what.identifier.value = "6860b86b78dc73af887ceb3146bc676c"
* entity[=].type = $security-source-type#2 "Data Interface"
* entity[=].role = $object-role#21 "Job Stream"
* entity[+].what.identifier.system = "urn:oid:1.2.208.176.1.2"
* entity[=].what.identifier.value = "0108589995"
* entity[=].what.type = "Patient"
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
* agent.who.identifier.system = "urn:oid:1.2.208.176.1.2"
* agent.who.identifier.value = "0202820103"
* agent.who.type = "Practitioner"
* agent.who.display = "Chris Christiansen"
* agent.altId = "a784da10-d1c9-4de6-bcae-9a189d97bc4a"
* agent.requestor = true
* source.observer.identifier.system = "urn:trifork:audit/source"
* source.observer.identifier.value = "eir-orchestrator"
* source.type = $security-source-type#4
* entity[0].what.identifier.system = "urn:trifork:audit:otel/trace"
* entity[=].what.identifier.value = "6860b86b78dc73af887ceb3146bc676c"
* entity[=].type = $security-source-type#2 "Data Interface"
* entity[=].role = $object-role#21 "Job Stream"
* entity[+].what.identifier.system = "urn:oid:1.2.208.176.1.2"
* entity[=].what.identifier.value = "0108589995"
* entity[=].what.type = "Patient"
* entity[=].role = $object-role#1

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
