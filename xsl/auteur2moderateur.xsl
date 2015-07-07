<?xml version="1.0" encoding="UTF-8"?>
<!-- 

This transformation "de-simplifies" simplifide TEF documents so that they are valid

-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tef="http://www.abes.fr/abes/documents/tef"
    xmlns:mets="http://www.loc.gov/METS/" xmlns:metsRights="http://cosimo.stanford.edu/sdr/metsrights/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/" xmlns:mads="http://www.loc.gov/mads/" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">

    <xsl:variable name="rtf">
        <rtf/>
    </xsl:variable>
    
    <xsl:variable name="namespaces" select="$rtf/*/namespace::*"/>
    
    <!-- Generic templates -->
    
    <xsl:template match="*" mode="justCopied"/>
    <xsl:template match="*" mode="afterElement"/>
    <xsl:template match="*" mode="beforeElement"/>
    <xsl:template match="*" mode="attributeCopied"/>
    <xsl:template match="*" mode="afterNodes"/>
    
    <xsl:template match="*[contains(name(), ':')]|@*[contains(name(), ':')]" mode="name">
        <xsl:value-of select="substring-before(name(), ':')"/>
        <xsl:text>:</xsl:text>
        <xsl:value-of select="substring-after(name(), ':')"/>
    </xsl:template>
    
    <xsl:template match="*|@*" mode="name">
        <xsl:value-of select="name()"/>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:apply-templates select="." mode="beforeElement"/>
        <xsl:variable name="name">
            <xsl:apply-templates select="." mode="name"/>
        </xsl:variable>
        <xsl:element name="{$name}">
            <xsl:copy-of select="$namespaces"/>
            <xsl:apply-templates select="." mode="justCopied"/>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="." mode="attributeCopied"/>
            <xsl:apply-templates select="node()"/>
            <xsl:apply-templates select="." mode="afterNodes"/>
        </xsl:element>
        <xsl:apply-templates select="." mode="afterElement"/>
    </xsl:template>
    
    <xsl:template match="@*">
        <xsl:variable name="name">
            <xsl:apply-templates select="." mode="name"/>
        </xsl:variable>
        <xsl:attribute name="{$name}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <!--<xsl:template match="@xsi.type">
        <xsl:attribute name="{translate(name(), '.', ':')}">
            <xsl:value-of select="translate(., '.', ':')"/>
        </xsl:attribute>
    </xsl:template>-->
    
    
    
    <!-- Templates specifc to desc-these -->
    
    <xsl:template match="dcterms:abstract[last()]" mode="afterElement">
        <dc:type xsi:type="dcterms:DCMIType"></dc:type>
    </xsl:template>
    
    <xsl:template match="mets:dmdSec" mode="afterElement">
        <mets:dmdSec ID="desc_edition">
            <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="tef_desc_edition">
                <mets:xmlData>
                    <tef:edition>
                    </tef:edition>
                </mets:xmlData>
            </mets:mdWrap>
        </mets:dmdSec>
    </xsl:template>
    
    <!-- Templates specifc to admin -->
    
    <xsl:template match="tef:auteur">
        <tef:auteur>
            <xsl:apply-templates select="tef:nom"/>
            <tef.nomDeNaissance/>
            <xsl:apply-templates select="tef:prenom"/>
            <tef.dateNaissance/>
            <tef.nationalite scheme="ISO-3166-1">FR</tef.nationalite>
            <tef.autoriteExterne autoriteSource="Sudoc"/>
        </tef:auteur>
        <xsl:apply-templates select="." mode="afterElement"/>
    </xsl:template>
    
    <xsl:template match="tef:auteur" mode="afterElement">
        <dc:identifier xsi:type="tef.NNT"/>
        <dc:identifier xsi:type="tef.nationalThesisPID"/>
    </xsl:template>
    
    <xsl:template match="tef:thesis.degree">
        <tef:thesis.degree>
            <xsl:for-each select="child::node()">
            <xsl:value-of select="name()"/>
            </xsl:for-each>
            <xsl:apply-templates select="tef:thesis.degree.discipline"/>
        </tef:thesis.degree>
        <xsl:apply-templates select="." mode="afterElement"/>
    </xsl:template>
    
    <xsl:template match="tef:thesis.degree.discipline">
        <xsl:apply-templates select="tef:thesis.degree.discipline" mode="afterElement"/>
    </xsl:template>
        
    <xsl:template match="tef:thesis.degree.discipline" mode="afterElement">
            <tef:thesis.degree.grantor>
                <tef:nom>Établissement de soutenance</tef:nom>
                <tef:autoriteInterne>idfixe</tef:autoriteInterne>
                <tef:autoriteExterne autoriteSource="Sudoc">123456789</tef:autoriteExterne>
            </tef:thesis.degree.grantor>
            <tef:thesis.degree.level>Doctorat</tef:thesis.degree.level>
    </xsl:template>
    
    <xsl:template match="tef:thesis.degree" mode="afterElement">
        <tef:theseSurTravaux>non</tef:theseSurTravaux>
        <tef:avisJury>oui</tef:avisJury>
        <tef:oaiSetSpec/>
        <tef:MADSAuthority authorityID="idfixe" type="corporate">
            <tef:personMADS>
                <mads:namePart>Établissement de soutenance</mads:namePart>
                <mads:description>Valeur fixe déterminée par le workflow</mads:description>
            </tef:personMADS>
        </tef:MADSAuthority>
    </xsl:template>
    
    <!-- Templates specifc to author rights  -->
    
    <xsl:template match="mets:rightsMD" mode="afterElement">
        <mets:rightsMD ID="dr_expr_univ">
            <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="tef_droits_etablissement_these">
                <mets:xmlData>
                    <metsRights:RightsDeclarationMD>
                        <metsRights:Context CONTEXTCLASS="GENERAL PUBLIC">
                            <metsRights:Permissions DISCOVER="true" COPY="true" DISPLAY="true" DUPLICATE="true" PRINT="true" MODIFY="false" DELETE="false"/>
                        </metsRights:Context>
                    </metsRights:RightsDeclarationMD>
                </mets:xmlData>
            </mets:mdWrap>
        </mets:rightsMD>
        
        <mets:rightsMD ID="dr_version">
            <mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="tef_droits_version">
                <mets:xmlData>
                    <metsRights:RightsDeclarationMD>
                        <metsRights:Context CONTEXTCLASS="GENERAL PUBLIC">
                            <metsRights:Permissions DISCOVER="true" COPY="true" DISPLAY="true" DUPLICATE="true" PRINT="true" MODIFY="false" DELETE="false"/>
                        </metsRights:Context>
                    </metsRights:RightsDeclarationMD>
                </mets:xmlData>
            </mets:mdWrap>
        </mets:rightsMD>
    </xsl:template>
   
    <!-- Templates specifc to file amdSec  -->
    
    <xsl:template match="mets:amdSec" mode="afterElement">
        <mets:fileSec>
            <mets:fileGrp USE="archive" ID="FGrID1"/>
        </mets:fileSec>	
    </xsl:template>
   
    
    <!-- Templates specifc to file structMap -->
    
    <xsl:template match="mets:structMap">
        <mets:structMap TYPE="logical">
            <mets:div TYPE="THESE" DMDID="desc_expr" ADMID="dr_expr_thesard dr_expr_univ admin_expr" CONTENTIDS="xxx789538/oeuvre">
                <mets:div TYPE="VERSION_COMPLETE" ADMID="dr_version" CONTENTIDS="xxx789538/version">
                    <mets:div TYPE="EDITION" DMDID="desc_edition" CONTENTIDS="xxx789538/edition">
                    </mets:div>
                </mets:div>
            </mets:div>
        </mets:structMap>
    </xsl:template>
   
</xsl:stylesheet>

