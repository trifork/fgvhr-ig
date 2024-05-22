Profile: FGVHRAuditEvent
Parent: IHE.BasicAudit.PatientCreate
Description: "AuditEvents to be sent to MinLog"

Profile: FGVHRConsent
Parent: Consent
Description: "Consents as they will be seen from Logis"

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