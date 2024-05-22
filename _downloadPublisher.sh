#!/bin/bash
publisher_jar=publisher.jar
publisher=./input-cache/${publisher_jar}
version=1.6.9

# If publisher.jar is not found in cache folder, download it
if [ ! -f "$publisher" ]; then
	echo "Downloading ${publisher_jar} version ${version}..."
	curl -L https://github.com/HL7/fhir-ig-publisher/releases/download/${version}/publisher.jar -o $publisher --create-dirs
else
	echo "Found cached ${publisher_jar}."
fi
 