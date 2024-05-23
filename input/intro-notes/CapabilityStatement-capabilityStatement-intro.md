Please note that all searches are to be conducted using `POST`-style searches, as GET has been requested to not be supported - e.g.:

```
curl --location 'http://localhost:8080/fhir/Consent/_search' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'patient.identifier=http://trifork.com/eir/idp|1ee184a7-5a90-4386-848c-146686e5b26a,urn:oid:1.2.208.176.1.2|0108589995'
```