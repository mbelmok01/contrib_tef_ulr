<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	
	This transformation "de-simplifies" simplifide TEF documents so that they are valid
	
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tef="http://www.abes.fr/abes/documents/tef"
	xmlns:mets="http://www.loc.gov/METS/" xmlns:metsRights="http://cosimo.stanford.edu/sdr/metsrights/" xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:dcterms="http://purl.org/dc/terms/" xmlns:mads="http://www.loc.gov/mads/" xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="//mets:metsHdr">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="ID"><xsl:value-of select="substring-after(@ID, 'uid/')"/></xsl:attribute>
			<xsl:apply-templates select="*" />
		</xsl:copy>
	</xsl:template>
	
</xsl:stylesheet>

