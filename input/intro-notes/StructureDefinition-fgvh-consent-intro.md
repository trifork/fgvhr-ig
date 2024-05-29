### Consent search

When searching for `Consent` from a `Patient`, the following query can be utilized:

`GET [base]/fhir/Consent/_search`

It allows the search for both CPR-, [X-eCPR-, and D-eCPR numbers](https://hl7.dk/fhir/core/StructureDefinition-dk-core-x-ecpr-identifier.html).

Pay close attention to header, and to the data submitted.
The `value` in the url-encoded data consist of the identifiers that is being searched for (first CPR, then eCPR), followed by a pipeline (`|`), and then the CPR number in question.

**Header:**

{:class="grid"}
| Key            | Value                                            |
| -------------- | ------------------------------------------------ |
| Accept         | application/fhir+json                            |
| Accept-Charset | utf-8                                            |
| Content-Type   | application/x-www-form-urlencoded; charset=UTF-8 |

**Url-encoded data:**

{:class="grid"}
| Key                | Value                               |
| ------------------ | ----------------------------------- |
| patient.identifier | urn:oid:1.2.208.176.1.1,urn:oid:1.2.208.176.1.6.1.2\|0108589995 |

**Response:**

```json
{
  "resourceType": "Bundle",
  "id": "769a607f-6695-47ba-aaf3-d50af4b11ab5",
  "type": "batch-response",
  "link": [
    {
      "relation": "self",
      "url": "[base]/fhir/Consent/"
    }
  ],
  "entry": [
    {
      "fullUrl": "8a11e767-d271-41e9-8455-ccf7811ec6c2",
      "resource": {
        "resourceType": "Consent",
        "id": "8a11e767-d271-41e9-8455-ccf7811ec6c2",
        "meta": {
          "lastUpdated": "2024-05-17T07:54:58.849+02:00"
        },
        "text": {
          "status": "generated",
          "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Do Not Resuscitate</div>"
        },
        "identifier": [
          {
            "use": "official",
            "system": "urn:oid:1.2.208.184",
            "value": "urn:uuid:dbd8639f-5eed-429c-8e20-3e8370ded233",
            "assigner": {
              "display": "MedCom"
            }
          }
        ],
        "status": "active",
        "scope": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/consentscope",
              "code": "treatment",
              "display": "Treatment Consent"
            }
          ]
        },
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/consentcategorycodes",
                "code": "dnr",
                "display": "Do Not Resuscitate"
              }
            ]
          }
        ],
        "patient": {
          "identifier": {
            "system": "https://hl7.dk/fhir/core/StructureDefinition-dk-core-cpr-identifier",
            "value": "Patient/0101521114"
          },
          "display": "Patient/0101521114"
        },
        "dateTime": "2023-10-20T12:42:43+02:00",
        "sourceReference": {
          "type": "Consent",
          "identifier": {
            "id": "7b1bcb3d-6edc-4855-808d-7bf7f65c7703",
            "use": "official",
            "system": "urn:oid:1.2.208.184",
            "assigner": {
              "display": "MedCom"
            }
          },
          "display": "Personal Data Card for Patient/0101521114"
        }
      },
      "response": {
        "status": "200 OK",
        "location": "/Consent?cpr=0101521114&status=active",
        "etag": "W/1"
      }
    }
  ]
}
```
