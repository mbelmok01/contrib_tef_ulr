<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns prefix="mets" uri="http://www.loc.gov/METS/"/>
    <ns prefix="tef" uri="http://www.abes.fr/abes/documents/tef"/>
    <ns prefix="metsRights" uri="http://cosimo.stanford.edu/sdr/metsrights/"/>
    <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
    <ns prefix="dc" uri="http://purl.org/dc/elements/1.1/"/>
    <ns prefix="dcterms" uri="http://purl.org/dc/terms/"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    
    <!-- Métadonnées descriptives de thèse -->
    <pattern name="tef_desc_these" id="tef_desc_these">
        <rule
            context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_these']/mets:xmlData/tef:thesisRecord">
            <assert test="count(dc:title[. != ''])=1">Précisez le titre.</assert>
            <assert test="dc:subject[@xml:lang='fr']">Précisez au moins un sujet en Français.</assert>
            <assert test="count(dcterms:abstract[@xml:lang='fr' and . != ''])=1"> Précisez un résumé en Français.</assert>
            <assert test="count(dcterms:abstract[@xml:lang='en' and . != ''])=1">Précisez un résumé en Anglais.</assert>
        </rule>
    </pattern>
    
    <!-- Métadonnées administratives de thèse -->
    <pattern name="tef_admin_these" id="tef_admin_these">
        <rule
          context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">
          <assert test="count(dcterms:dateAccepted[@xsi:type='dcterms:W3CDTF'])=1"> Précisez la date de soutenance.</assert>
        </rule>
        <!--tef:thesis.degree
        <rule
            context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:thesis.degree">
            <assert test="count(tef:thesis.degree.discipline[@xml:lang])=1">Précisez la discipline.</assert>
        </rule>-->
    </pattern>
    
    <!-- Métadonnées des droits auteur de thèse -->
    <pattern name="tef_droits_auteur" id="tef_droits_auteur">
        <rule
            context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_auteur_these' ]/mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Constraints">
            <assert test="translate(substring(metsRights:ConstraintDescription, 13, 10), '-', '') &lt; translate(substring(metsRights:ConstraintDescription, 23, 10), '-', '')"> La date de début de délai de diffusion doit précéder la date de fin.</assert>
        </rule>
    </pattern>
    
</schema>