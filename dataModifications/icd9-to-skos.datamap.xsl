<!-- Copyright (c) 2010-2011 VIVO Harvester Team. For full list of contributors, 
	please see the AUTHORS file provided. All rights reserved. This program and 
	the accompanying materials are made available under the terms of the new 
	BSD license which accompanies this distribution, and is available at http://www.opensource.org/licenses/bsd-license.html -->
<!-- Header information for the Style Sheet The style sheet requires xmlns 
	for each prefix you use in constructing the new elements -->

<xsl:stylesheet version="2.0"
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform' 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#' 
	xmlns:rdfs='http://www.w3.org/2000/01/rdf-schema#'
	xmlns:core='http://vivoweb.org/ontology/core#' 
	xmlns:score='http://vivoweb.org/ontology/score#'
	xmlns:foaf='http://xmlns.com/foaf/0.1/' 
	xmlns:bibo='http://purl.org/ontology/bibo/'
	xmlns:ctsaip='http://vivo.ufl.edu/ontology/ctsaip/' 
	xmlns:vitroApp='http://vitro.mannlib.cornell.edu/ns/vitro/0.7#'
	xmlns:pvs='http://vivoweb.org/ontology/provenance-support#'
	xmlns:http="http://"
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#"
	xmlns:icd9="http://purl.obolibrary.org/obo/arg/icdcode/">
	<xsl:output method="xml" indent="yes" />
	<xsl:variable name="baseURI">http://vivoweb.org/harvest/icd9/</xsl:variable>

	<xsl:template match="rdf:RDF">
		<rdf:RDF xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#'
			xmlns:rdfs='http://www.w3.org/2000/01/rdf-schema#' 
			xmlns:core='http://vivoweb.org/ontology/core#'
			xmlns:vitroApp='http://vitro.mannlib.cornell.edu/ns/vitro/0.7#'
			xmlns:skos='http://www.w3.org/2004/02/skos/core#' 
			xmlns:icd9='http://purl.obolibrary.org/obo/arg/icdcode/'>
			<xsl:apply-templates select="owl:Class" />
		</rdf:RDF>
	</xsl:template>

	<xsl:template match="owl:Class">
	  <rdf:resource rdf:about="{@rdf:about}">
	  <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
	  <rdfs:label><xsl:value-of select="fn:substring-after(rdfs:label,'ICD9 code for ')" /></rdfs:label> <!-- Pretty Labels -->
	  <!--Regular Labels <rdfs:label><xsl:value-of select="rdfs:label" /></rdfs:label>--> <!-- Regular Lables -->
	  <icd9:code><xsl:value-of select="http:has_code" /></icd9:code>
	  <icd9:cui><xsl:value-of select="http:has_cui" /></icd9:cui>
	  <xsl:apply-templates select="rdfs:subClassOf" />
	  </rdf:resource>

	</xsl:template>

	<xsl:template match="rdfs:subClassOf" >
		<skos:narrow rdf:resource="{@rdf:resource}" />
	</xsl:template>

</xsl:stylesheet>

