#!/bin/sh

# Download Major version 2.0.0
wget https://mutation-testing.org/downloads/major-2.0.0_jre8.zip

# Unzip Major
unzip major-2.0.0_jre8.zip

# Patch the pom.xml to use Major as the compiler
patch pom.xml pom.xml.patch

# Create source-code and byte-code mutants
mvn clean compile

echo Number of generated mutants: $(cat mutants.log | wc -l)
echo Source code mutants appear in the \"mutants\" directory
