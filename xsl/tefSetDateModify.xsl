<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tef="http://www.abes.fr/abes/documents/tef"
	xmlns:mets="http://www.loc.gov/METS/"
	xmlns:oaidc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:vdex="http://www.imsglobal.org/xsd/imsvdex_v1p0"
	xmlns:orioai="http://www.ori-oai.org/static/xsd/orioaivocab"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:date="http://exslt.org/dates-and-times" 
	version="1.0">
	
	<xsl:output method="xml" indent="yes" encoding="utf-8" />

	<xsl:variable name="dateTimeCourante">
		<xsl:value-of select="substring(date:date-time(),0,20)"/>
	</xsl:variable>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>


	<xsl:template match="//mets:metsHdr">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="LASTMODDATE"><xsl:value-of select="$dateTimeCourante"/></xsl:attribute>
			<xsl:apply-templates select="*" />
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
