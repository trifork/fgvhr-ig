### Registration of an Audit Event

[AuditEvent](https://hl7.org/fhir/r4/auditevent.html)s can be used to registered to [MinLog2](https://www.nspop.dk/display/public/web/MinLog2+-+Min+Log+Registrering+-+Guide+til+anvendere) with the following query:

`POST [base]/fhir/AuditEvent`

Along with the query, a [body](https://hl7.org/fhir/r4/auditevent.html#resource) is sent which can be interpreted as follow:

{:class="grid"}
| Property | Value | Explanation |
| -- | -- | -- |
| resourceType | "AuditEvent" | A string specifying this is an AuditEvent. Can't be changed |
| recorded | "YYYY-mm-DDTHH:MM:ssK" | Datetime format with time zone in |
| agent | [ ] | Array with all actors and systems involved in the event |
| agent.type | | [Participant role](https://hl7.org/fhir/r4/valueset-participation-role-type.html#definition) code, specifying the role the actor had. Normally `AGNT` or `PROV` |
| agent.name | "Human readable name" | This field is used to display the actor's title |
| agent.requestor | false/true | If this was the initial requestor. This might be the one taking the emergency call in the first place |
| agent.who | { } | Information object about the actor |
| agent.who.display | "Human readable description" | This field is used to display who acted (name of individual or system) |
| agent.who.identifier | "Emergency dispatcher" | Information object about the actor |
| agent.who.identifier.system | urn:oid:1.2.208.176.1.1 or urn:oid:1.2.208.176.1.2 | Public available identifier of the actor. For people, use [CPR](https://hl7.dk/fhir/core/StructureDefinition-dk-core-cpr-identifier.html), and for systems use [SOR](https://hl7.dk/fhir/core/StructureDefinition-dk-core-sor-identifier.html). |
| agent.who.identifier.value | 010101-0101 | The CPR number or the SOR code |
| source | { } | The calling system that makes this very request |
| source.type | | The [audit source type](https://hl7.org/fhir/r4/valueset-audit-source-type.html#expansion) |
| source.observer.identifier.system | urn:oid:1.2.208.176.1.1 | SOR code of the system calling |
| source.observer.identifier.value | 615961000016003 | SOR code for calling system. Can be found in the  [Sor Browser](https://sorbrowser.sundhedsdatastyrelsen.dk/) |
| entity | [ ] | Object of what was looked up and on who |
| entity.name | A patient's consents | Name of what is looked up |
| entity.description | Patient consents from the search query | A description of what was searched for |
| entity.what | { } | Object about what was searched for |
| entity.what.identifier.system | urn:oid:1.2.208.176.1.1 or urn:oid:1.2.208.176.1.2 | Public available identifier of the actor. For people, use [CPR](https://hl7.dk/fhir/core/StructureDefinition-dk-core-cpr-identifier.html), and for systems use [SOR](https://hl7.dk/fhir/core/StructureDefinition-dk-core-sor-identifier.html)|
| entity.what.identifier.value | 010101-0101 | The CPR number or the SOR code |

With the following format, a chain of `agents` can be listed, such as the dispatcher taking the call, the system making the look-up, the ambulances getting the data, and paramedics on site.
You can also include an `agent` with a `trace`.

The audit event is sent with a body as well, containing the `AuditEvent`s for MinLog2:

**Body:**

```json
{
  "resourceType": "AuditEvent",
  "recorded": "2024-05-22T09:17:52.709+00:00",
  "agent": [
    {
      "role": [
        {
          "coding": [
            {
              "code": "AGNT",
              "system": "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
            }
          ]
        }
      ],
      "who": {
        "identifier": {
          "system": "urn:oid:1.2.208.176.1.2",
          "value": "0202820103"
        },
        "type": "PractitionerRole",
        "display": "Terry Telefonmand"
      },
      "name": "Dispatcher",
      "requestor": true
    },
    {
      "role": [
        {
          "coding": [
            {
              "code": "PROV",
              "system": "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
            }
          ]
        }
      ],
      "who": {
        "identifier": {
          "system": "urn:oid:1.2.208.176.1.1",
          "value": "615961000016003"
        },
        "type": "System",
        "display": "SOR-kode for Logis Region Midt"
      },
      "type": {
        "coding": [
          {
            "code": "2",
            "system": "http://terminology.hl7.org/CodeSystem/security-source-type",
            "display": "Data Interface"
          }
        ]
      },
      "name": "AMK Vagtcentral",
      "requestor": false
    },
    {
      "role": [
        {
          "coding": [
            {
              "code": "PROV",
              "system": "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
            }
          ]
        }
      ],
      "who": {
        "identifier": {
          "system": "urn:logis:audit:otel/trace",
          "value": "6860b86b78dc73af887ceb3146bc676c"
        },
        "display": "Skærm, som viser information til ambulancefolk"
      },
      "type": {
        "coding": [
          {
            "code": "1",
            "system": "http://terminology.hl7.org/CodeSystem/security-source-type",
            "display": "User Device"
          }
        ]
      },
      "name": "Ambulance",
      "requestor": false
    },
    {
      "role": [
        {
          "coding": [
            {
              "code": "LIC",
              "system": "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
            }
          ]
        }
      ],
      "who": {
        "identifier": {
          "system": "urn:oid:1.2.208.176.1.2",
          "value": "0108589995"
        },
        "type": "Practitioner",
        "display": "Personale 1, som rykkede ud"
      },
      "name": "Ambulance personale",
      "requestor": false
    },
    {
      "role": [
        {
          "coding": [
            {
              "code": "LIC",
              "system": "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
            }
          ]
        }
      ],
      "who": {
        "identifier": {
          "system": "BSK-system",
          "value": "BSK/123"
        },
        "type": "Practitioner",
        "display": "Personale 2, som rykkede ud. Vedkommende er ikke kendt med CPR-nummer ved indmelding."
      },
      "name": "Ambulance personale",
      "requestor": false
    }
  ],
  "source": {
    "observer": {
      "identifier": {
        "system": "urn:logis:audit/source",
        "value": "Logis Region Midt"
      }
    },
    "type": [
      {
        "code": "4",
        "system": "http://terminology.hl7.org/CodeSystem/security-source-type",
        "display": "Application Server"
      }
    ]
  },
  "entity": [
    {
      "what": {
        "identifier": {
          "system": "urn:oid:1.2.208.176.1.2",
          "value": "0108589995"
        },
        "type": "Consent"
      },
      "role": {
        "code": "4",
        "system": "http://terminology.hl7.org/CodeSystem/object-role"
      },
      "name": "A Patient's Consents",
      "description": "Patient Consents from the search query"
    }
  ]
}
```

**Response:**

```json

```
