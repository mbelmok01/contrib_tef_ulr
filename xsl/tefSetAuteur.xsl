<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tef="http://www.abes.fr/abes/documents/tef"
	xmlns:mets="http://www.loc.gov/METS/"
	xmlns:oaidc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:vdex="http://www.imsglobal.org/xsd/imsvdex_v1p0"
	xmlns:orioai="http://www.ori-oai.org/static/xsd/orioaivocab"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">

	<xsl:output method="xml" indent="yes" encoding="utf-8" />

	<xsl:variable name="username"
		select="document('#{domainService.getCurrentUserName()}')" />

	<xsl:variable name="people_vcardsExpression">
		#{vocabularyService.getVocabulary("peopleLdapLocalProvider")}
	</xsl:variable>
	<xsl:variable name="people_vcards"
		select="document($people_vcardsExpression)" />

	<xsl:variable name="vcard" select="$people_vcards//vdex:term/vdex:metadata/orioai:value[contains(., concat('UID:', $username, '&#10;'))]" />

	<xsl:variable name="displayName" select="substring-before(substring-after($vcard, '&#x0a;N:'), '&#x0a;')"/>
	<xsl:variable name="displayUID" select="substring-before(substring-after($vcard, '&#x0a;UID:'), '&#x0a;')"/>	
	<xsl:variable name="displayPrenom" select="substring-before(substring-after($displayName, ';'), ';')"/>
	<xsl:variable name="displayNom" select="substring-before($displayName, ';')"/>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>


	<xsl:template
		match="//mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">

		<xsl:copy>
			<tef:auteur>
				<tef:nom><xsl:value-of select="$displayNom" /></tef:nom>
				<tef:prenom><xsl:value-of select="$displayPrenom" /></tef:prenom>
				<tef:autoriteExterne autoriteSource="LDAP"><xsl:value-of select="$displayUID" /></tef:autoriteExterne>
			</tef:auteur>
			
			<xsl:copy-of select="./*" />
			
		</xsl:copy>


	</xsl:template>

</xsl:stylesheet>
