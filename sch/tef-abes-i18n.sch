<?xml version="1.0" encoding="UTF-8"?>
<!-- NCH 2010-11-16 : prise en compte des changements apportés dans le schematron de tef suivant :
	. modification pattern : attributs_langue 
	//tef:thesisRecord/dc:subject[not(@xsi:type)] au lieu de //tef:thesisRecord/dc:subject
	Le code langue n'est plus obligatoire si l'attribut xsi:type est spécifié pour le sujet ( mots matière )
	-> modif ligne 201
	. 'tef_droits_auteur' était fautif , a été remplacé par : 'tef_droits_auteur_these'
	dans context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_auteur'
	-> modif ligne 498
	. modification de l'erreur.
	context="mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap/mets:xmlData/metsRights:RightsDeclarationMD ...
	remplacé par 
	context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap/mets:xmlData/metsRights:RightsDeclarationMD ...
	( référence absolue et non plus relative ).   
	-> modif ligne 489 et 492
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:sch="http://www.ascc.net/xml/schematron">
  <ns prefix="mets" uri="http://www.loc.gov/METS/"/>
  <ns prefix="tef" uri="http://www.abes.fr/abes/documents/tef"/>
  <ns prefix="metsRights" uri="http://cosimo.stanford.edu/sdr/metsrights/"/>
  <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
  <ns prefix="dc" uri="http://purl.org/dc/elements/1.1/"/>
  <ns prefix="dcterms" uri="http://purl.org/dc/terms/"/>
  <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
  
  <phase id="CORE">
    <p>Cette phase Core rassemble toutes les contraintes minimales imposées à l'entrée de STAR.</p>
    <active pattern="mets_racine"/>
    <active pattern="mets_tef_desc_these"/>
    <active pattern="mets_tef_admin_these"/>
    <active pattern="mets_structMap"/>
    <active pattern="mets_ID"/>
   <!-- <active pattern="attributs_langue"/> -->
    <active pattern="tef_desc_these_racine"/>
    <active pattern="tef_desc_these_titre"/>
    <active pattern="tef_admin_these_racine"/>
    <active pattern="tef_admin_these_auteur"/>
    <active pattern="tef_admin_these_date"/>
    <active pattern="tef_admin_these_directeurThese"/>
    <active pattern="tef_admin_these_degree"/>
    <active pattern="mets_structMap_1"/>
    <active pattern="mets_structMap_CONTENTIDS"/>
    <active pattern="mets_structMap_meta_desc_These"/>
    <active pattern="mets_structMap_meta_admin_These"/>
  </phase>
  
  <phase id="DEPO">
    <p>Cette phase DEPO rassemble toutes les contraintes qui relèvent du rôle DEPO dans STAR.</p>
    <active pattern="attributs_langue"/>
    <active pattern="tef_desc_these_racine"/>
    <active pattern="tef_desc_these_titre"/>
    <active pattern="tef_desc_version"/>
    <active pattern="tef_desc_edition"/>
    <active pattern="tef_desc_edition_identifier"/>
    <active pattern="tef_desc_externe"/>
    <active pattern="tef_admin_these_auteur"/>
    <active pattern="tef_admin_these_auteur_suite"/>
    <active pattern="tef_admin_these_date"/>
    <active pattern="tef_admin_these_directeurThese"/>
    <active pattern="tef_admin_these_directeurThese_prenom"/>
    <active pattern="tef_admin_these_degree"/>
    <active pattern="tef_admin_these_racine"/>
    <active pattern="tef_admin_these"/>
    <active pattern="tef_admin_these_travaux"/>
    <active pattern="mets_fileSec"/>
    <active pattern="mets_structMap_1"/>
    <active pattern="mets_structMap_CONTENTIDS"/>
    <active pattern="mets_structMap_2"/>
    <active pattern="mets_structMap_ressources_externes"/>
  </phase>
  
  <phase id="META">
    <p>Cette phase META rassemble toutes les contraintes qui relèvent du rôle META dans STAR.</p>
    <active pattern="attributs_langue"/>
    <active pattern="tef_desc_these_racine"/>
    <active pattern="tef_desc_these_bib"/>
    <active pattern="tef_admin_these_NNT"/>
    <active pattern="tef_admin_these_oaiSetSpec"/>       
    <active pattern="mustHaveExternalAuthority"/>
    <active pattern="tef_admin_these_oai_liste"/>
    <active pattern="mets_structMap_1"/>
    <active pattern="mets_structMap_CONTENTIDS"/>
  </phase>
 
  <phase id="NEARLY_FULL">
      <p>Cette phase quasi-complète rassemble toutes les contraintes sauf les autorités.</p>
      <!-- partie DEPO -->
      <active pattern="attributs_langue"/>
      <active pattern="tef_desc_these_racine"></active>
      <active pattern="tef_desc_these_titre"></active>
      <active pattern="tef_desc_version"></active>
      <active pattern="tef_desc_edition"></active>
      <active pattern="tef_desc_edition_identifier"></active>
      <active pattern="tef_desc_externe"></active>
      <active pattern="tef_admin_these_auteur"></active>
      <active pattern="tef_admin_these_auteur_suite"/>
      <active pattern="tef_admin_these_date"/>
      <active pattern="tef_admin_these_directeurThese"/>
      <active pattern="tef_admin_these_directeurThese_prenom"/>
      <active pattern="tef_admin_these_degree"/>
      <active pattern="tef_admin_these_racine"></active>
      <active pattern="tef_admin_these"></active>
      <active pattern="tef_admin_these_travaux"></active>
      <active pattern="mets_fileSec"></active>
      <active pattern="mets_structMap_1"/>
      <active pattern="mets_structMap_CONTENTIDS"/>
      <active pattern="mets_structMap_2"></active>
      <active pattern="mets_structMap_ressources_externes"></active>
      <!-- partie META -->
      <active pattern="tef_desc_these_bib"/>
      <active pattern="tef_admin_these_NNT"/>
      <active pattern="tef_admin_these_oaiSetSpec"/>  
      <active pattern="hasAtLeastOneAuthority"/>  
      <active pattern="tef_admin_these_oai_liste"/>  
 </phase>
 
 <phase id="FULL">
      <p>Cette phase FULL rassemble toutes les contraintes.</p>
      <!-- partie DEPO -->
      <active pattern="attributs_langue"/>
      <active pattern="tef_desc_these_racine"></active>
      <active pattern="tef_desc_these_titre"></active>
      <active pattern="tef_desc_version"></active>
      <active pattern="tef_desc_edition"></active>
      <active pattern="tef_desc_edition_identifier"></active>
      <active pattern="tef_desc_externe"></active>
      <active pattern="tef_admin_these_auteur"/>
      <active pattern="tef_admin_these_auteur_suite"/>
      <active pattern="tef_admin_these_date"/>
      <active pattern="tef_admin_these_directeurThese"/>
      <active pattern="tef_admin_these_directeurThese_prenom"/>
      <active pattern="tef_admin_these_degree"/>
      <active pattern="tef_admin_these_racine"></active>
      <active pattern="tef_admin_these"></active>
      <active pattern="tef_admin_these_travaux"></active>
      <active pattern="mets_fileSec"></active>
      <active pattern="mets_structMap_1"/>
      <active pattern="mets_structMap_CONTENTIDS"/>
      <active pattern="mets_structMap_2"></active>
      <active pattern="mets_structMap_ressources_externes"></active>
      <!-- partie META -->
      <active pattern="tef_desc_these_bib"/>
      <active pattern="tef_admin_these_NNT"/>
      <active pattern="tef_admin_these_oaiSetSpec"/>  
      <active pattern="hasAtLeastOneAuthority"/>
      <active pattern="mustHaveExternalAuthority"/>
      <active pattern="tef_admin_these_oai_liste"/>  
 </phase>
 
 
  <!--
    ******************************
    *** PATTERNS *****************
    ******************************
  -->
  <!-- Les blocs de métadonnées sous la racine "mets:mets"-->
  <pattern name="mets_racine" id="mets_racine">
    <rule context="/">
      <assert test="mets:mets">tef_ulr.schematron.tef-abes.mets_mets.mets_racine.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_tef_desc_these" id="mets_tef_desc_these">
    <rule context="/">
      <assert test="count(mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_these'])=1">tef_ulr.schematron.tef-abes.mets_mets.mets_tef_desc_these.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_tef_desc_these" id="mets_tef_admin_these">
    <rule context="/">
      <assert test="count(mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these'])=1">tef_ulr.schematron.tef-abes.mets_mets.mets_tef_admin_these.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap" id="mets_structMap">
    <rule context="/">
      <assert test="mets:mets/mets:structMap">tef_ulr.schematron.tef-abes.mets_mets.mets_structMap.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets:mets -- Quels blocs de métadonnées ?">
    <rule context="/">
      <assert test="mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_edition']">tef_ulr.schematron.tef-abes.mets_mets.tef_desc_edition.check_rule</assert>
      <assert test="count(mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_etablissement_these'])=1">tef_ulr.schematron.tef-abes.mets_mets.tef_droits_etablissement_these.check_rule</assert>
      <assert test="count(mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_auteur_these'])=1">tef_ulr.schematron.tef-abes.mets_mets.tef_droits_auteur_these.check_rule</assert>
      <assert test="mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_version']">tef_ulr.schematron.tef-abes.mets_mets.tef_droits_version.check_rule</assert>
      <assert test="mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_tech_fichier']">tef_ulr.schematron.tef-abes.mets_mets.tef_tech_fichier.check_rule</assert>
      <assert test="mets:mets/mets:fileSec">tef_ulr.schematron.tef-abes.mets_mets.mets_fileSec.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_ID" id="mets_ID">
    <rule context="/mets:mets/mets:dmdSec | /mets:mets/mets:amdSec/mets:techMD | /mets:mets/mets:amdSec/mets:rightsMD">
      <assert test="@ID">tef_ulr.schematron.tef-abes.mets_mets.mets_ID.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets:mets -- autorités">
    <rule context="//tef:autoriteExterne">
      <assert test="@autoriteSource">tef_ulr.schematron.tef-abes.mets_mets.tef_autoriteExterne.autoriteSource.check_rule</assert>
    </rule>
    <rule context="//tef:autoriteInterne">
      <assert test=". = ancestor::mets:xmlData//tef:MADSAuthority/@authorityID">tef_ulr.schematron.tef-abes.mets_mets.tef_autoriteInterne.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="attributs_langue" id="attributs_langue">
  	<rule context="//tef:thesisRecord/dc:title | //tef:thesisRecord/dcterms:alternative | //tef:thesisRecord/dcterms:tableOfContents | //tef:thesisRecord/dcterms:abstract | //tef:thesisRecord/dc:subject[not(@xsi:type)] | //tef:thesis.degree.discipline" id="r_langues">
      <assert test="@xml:lang">tef_ulr.schematron.tef-abes.mets_mets.attributs_langue.check_rule</assert>
    </rule>
  </pattern>

  <!-- *** Métadonnées descriptives de thèse *** -->

  <pattern name="tef_desc_these_titre" id="tef_desc_these_titre">
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_these']/mets:xmlData/tef:thesisRecord">
      <assert test="count(dc:title)=1">tef_ulr.schematron.tef-abes.tef_desc_these.titre.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="tef_desc_these_racine" id="tef_desc_these_racine">
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_these']">
      <assert test="mets:xmlData/tef:thesisRecord">tef_ulr.schematron.tef-abes.tef_desc_these.racine.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="tef_desc_these_bib" id="tef_desc_these_bib">
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_these']/mets:xmlData/tef:thesisRecord">
      <assert test="dc:subject[@xml:lang='fr']">tef_ulr.schematron.tef-abes.tef_desc_these.bib.check_rule</assert>
      <assert test="count(tef:sujetRameau) &lt; 2">tef_ulr.schematron.tef-abes.tef_desc_these.bib.check_rule_2</assert>
      <assert test="count(dcterms:abstract[@xml:lang='fr'])=1">tef_ulr.schematron.tef-abes.tef_desc_these.bib.check_rule_3</assert>
      <assert test="count(dcterms:abstract[@xml:lang='en'])=1">tef_ulr.schematron.tef-abes.tef_desc_these.bib.check_rule_4</assert>
      <assert test="dc:type[@xsi:type = 'dcterms:DCMIType']">tef_ulr.schematron.tef-abes.tef_desc_these.bib.check_rule_5</assert>
      <assert test="count(dc:type[text() = 'Electronic Thesis or Dissertation'])=1">tef_ulr.schematron.tef-abes.tef_desc_these.bib.check_rule_6</assert>
      <assert test="dc:language[@xsi:type='dcterms:RFC3066']">tef_ulr.schematron.tef-abes.tef_desc_these.bib.check_rule_7</assert>
    </rule>
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_these']/mets:xmlData/tef:thesisRecord/dc:subject[@xsi:type = 'tef:oaiSetLang']">
      <assert test="text() = document('http://www.abes.fr/abes/documents/tef/recommandation/oaiSets.xml')/ListSets/set/setName | document('http://www.abes.fr/abes/documents/tef/recommandation/oaiSets.xml')/ListSets/set/setDescription/dc/dc:description">tef_ulr.schematron.tef-abes.tef_desc_these.bib.check_rule_8</assert>
    </rule>
  </pattern>
  
  
  <!-- Métadonnées descriptives de version -->
  <pattern name="tef_desc_version" id="tef_desc_version">
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_version']/mets:xmlData">
      <assert test="tef:version">tef_ulr.schematron.tef-abes.tef_desc_version.version.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:dmdSec[@ID= //mets:div[@TYPE='VERSION_INCOMPLETE']/@DMDID]/mets:mdWrap[@OTHERMDTYPE='tef_desc_version']/mets:xmlData/tef:version">
      <assert test="tef:manque">tef_ulr.schematron.tef-abes.tef_desc_version.manque.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:dmdSec[@ID= //mets:div[not(@TYPE='VERSION_INCOMPLETE')]/@DMDID]/mets:mdWrap[@OTHERMDTYPE='tef_desc_version']/mets:xmlData/tef:version">
      <assert test="count(tef:manque)&lt;1">tef_ulr.schematron.tef-abes.tef_desc_version.manque.check_rule_2</assert>
    </rule>
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_version']/mets:xmlData/tef:version/tef:manque">
      <assert test="count(tef:ressourceID)&lt;2 and count(tef:noteVersion)&lt;2 and count(tef:ressourceID | tef:noteVersion)&gt;0 and count(tef:ressourceID | tef:noteVersion)&lt;3">tef_ulr.schematron.tef-abes.tef_desc_version.manque.check_rule_3</assert>
    </rule>
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_version']/mets:xmlData/tef:version/tef:manque/tef:ressourceID">
      <assert test="text() = /mets:mets/mets:structMap//mets:div[@TYPE='RESSOURCE_TIERS' or @TYPE='TRAVAUX' or @TYPE='RESSOURCES_EXTERNES']/@ID">tef_ulr.schematron.tef-abes.tef_desc_version.ressourceID.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_version']/mets:xmlData/tef:version/dcterms:replaces">
      <assert test="@xsi:type = 'dcterms:URI'">tef_ulr.schematron.tef-abes.tef_desc_version.replaces.check_rule</assert>
    </rule>
  </pattern>
  <!-- Métadonnées descriptives d'édition -->
  <pattern name="tef_desc_edition" id="tef_desc_edition">
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_edition']">
      <assert test="mets:xmlData/tef:edition">tef_ulr.schematron.tef-abes.tef_desc_edition.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_edition']/mets:xmlData/tef:edition">
      <assert test="count(dcterms:medium[@xsi:type = 'dcterms:IMT' ])=1">tef_ulr.schematron.tef-abes.tef_desc_edition.edition.check_rule</assert>
      <assert test="count(dcterms:extent)=1">tef_ulr.schematron.tef-abes.tef_desc_edition.edition.check_rule_2</assert>
      <assert test="count(dcterms:issued)&lt;2">tef_ulr.schematron.tef-abes.tef_desc_edition.edition.check_rule_3</assert>
    </rule>
    <!--tef:editeur-->
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_edition']/mets:xmlData/tef:edition/tef:editeur">
      <assert test="count(tef:nom)=1">tef_ulr.schematron.tef-abes.tef_desc_edition.editeur.check_rule</assert>
      <assert test="tef:place">tef_ulr.schematron.tef-abes.tef_desc_edition.editeur.check_rule_2</assert>
    </rule>
  </pattern>
  <!-- URL d'édition -->
  <pattern name="tef_desc_edition_identifier" id="tef_desc_edition_identifier">
    <rule context="/mets:mets/mets:dmdSec[@ID= //mets:div[@TYPE='EDITION'][mets:fptr/@FILEID= //mets:fileGrp[not(@USE ='archive')]/@ID]/@DMDID]/mets:mdWrap[@OTHERMDTYPE='tef_desc_edition']/mets:xmlData/tef:edition">
      <assert test="count(dc:identifier)&gt;0">tef_ulr.schematron.tef-abes.tef_desc_edition.identifier.check_rule</assert>
    </rule>
  </pattern>
  <!-- Métadonnées descriptives de ressource externe -->
  <pattern name="tef_desc_externe" id="tef_desc_externe">
    <rule context="/mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_externe']">
      <assert test="mets:xmlData/tef:ressourceExterneDescription">tef_ulr.schematron.tef-abes.tef_desc_externe.check_rule</assert>
    </rule>
  </pattern>
  <!-- Métadonnées administratives de thèse -->
  <pattern name="tef_admin_these_auteur" id="tef_admin_these_auteur">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">
      <assert test="count(tef:auteur) = 1">tef_ulr.schematron.tef-abes.tef_admin_these_auteur.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:auteur">
      <assert test="count(tef:nom)=1">tef_ulr.schematron.tef-abes.tef_admin_these_auteur.check_rule_2</assert>
      <assert test="count(tef:prenom)=1">tef_ulr.schematron.tef-abes.tef_admin_these_auteur.check_rule_3</assert>
    </rule>
  </pattern>
  <pattern name="tef_admin_these_date" id="tef_admin_these_date">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">
      <assert test="count(dcterms:dateAccepted[@xsi:type='dcterms:W3CDTF'])=1">tef_ulr.schematron.tef-abes.tef_admin_these.date.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="tef_admin_these_directeurThese" id="tef_admin_these_directeurThese">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">
      <assert test="tef:directeurThese">tef_ulr.schematron.tef-abes.tef_admin_these.directeurThese.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:directeurThese">
      <assert test="count(tef:nom)=1">tef_ulr.schematron.tef-abes.tef_admin_these.directeurThese.check_rule_2</assert>
      <!--assert test="count(tef:prenom)=1">Parmi les métadonnées de description du directeur de thèse, il faut un et un seul élément "tef:prenom". <span>Précisez le prénom du directeur de la Thèse.</span></assert-->
    </rule>
  </pattern>
  <pattern name="tef_admin_these_directeurThese_prenom"  id="tef_admin_these_directeurThese_prenom">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:directeurThese">
      <assert test="count(tef:prenom)=1">tef_ulr.schematron.tef-abes.tef_admin_these.directeurThese_prenom.check_rule</assert>
    </rule>
  </pattern>
 
  <pattern name="tef_admin_these_degree" id="tef_admin_these_degree">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">
      <assert test="count(tef:thesis.degree) = 1">tef_ulr.schematron.tef-abes.tef_admin_these.degree.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:thesis.degree">
      <assert test="tef:thesis.degree.grantor">tef_ulr.schematron.tef-abes.tef_admin_these.degree.check_rule_2</assert>
      <!--ERM-->
      <assert test="count(tef:thesis.degree.level)=1">tef_ulr.schematron.tef-abes.tef_admin_these.degree.check_rule_3</assert>
      <!--ERM-->
      <assert test="count(tef:thesis.degree.name) &lt; 2">tef_ulr.schematron.tef-abes.tef_admin_these.degree.check_rule_4</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:thesis.degree/tef:thesis.degree.grantor">
      <assert test="tef:nom">tef_ulr.schematron.tef-abes.tef_admin_these.degree.check_rule_5</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:thesis.degree/tef:thesis.degree.level">
      <assert test="text()=&quot;Doctorat d&apos;Etat&quot; or text()=&quot;Doctorat&quot; or text()=&quot;Doctorat de troisième cycle&quot;">tef_ulr.schematron.tef-abes.tef_admin_these.degree.check_rule_6</assert>
    </rule>
  </pattern>
 
  <pattern name="tef_admin_these_racine" id="tef_admin_these_racine">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']">
      <assert test="mets:xmlData/tef:thesisAdmin">tef_ulr.schematron.tef-abes.tef_admin_these.racine.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="tef_admin_these_NNT" id="tef_admin_these_NNT">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">
      <assert test="count(dc:identifier[@xsi:type='tef:NNT'])=1">tef_ulr.schematron.tef-abes.tef_admin_these.NNT.check_rule</assert>
    </rule>
  </pattern>
 
  <pattern name="tef_admin_these_oaiSetSpec" id="tef_admin_these_oaiSetSpec">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">
      <assert test="tef:oaiSetSpec">tef_ulr.schematron.tef-abes.tef_admin_these.oaiSetSpec.check_rule</assert>
    </rule>
  </pattern>

  <pattern name="tef_admin_these_auteur_suite" id="tef_admin_these_auteur_suite">
   <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:auteur">
    <!--tef:auteur-->
    <assert test="count(tef:dateNaissance)=1">tef_ulr.schematron.tef-abes.tef_admin_these.auteur_suite.check_rule</assert>
    <assert test="count(tef:nationalite[@scheme='ISO-3166-1'])=1">tef_ulr.schematron.tef-abes.tef_admin_these.auteur_suite.check_rule_2</assert>
   </rule>       
  </pattern>

 <pattern name="hasAtLeastOneAuthority" id="hasAtLeastOneAuthority"> 
   <!--tef:auteur-->   
  <!--rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:auteur">
   <assert test="not(not(tef:autoriteInterne) and not(tef:autoriteExterne))">Parmi les métadonnées de description de l'auteur, le lien vers les données d'autorité est obligatoire. L'élément "tef:auteur" doit donc posséder soit "tef:autoriteExterne", soit "tef:autoriteInterne", soit les deux. <span>Précisez les données d'autorité associées à l'auteur.</span></assert>
  </rule--> 
  <!-- tef:thesis.degree.grantor -->
  <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:thesis.degree/tef:thesis.degree.grantor">
   <assert test="not(not(tef:autoriteInterne) and not(tef:autoriteExterne))">tef_ulr.schematron.tef-abes.tef_admin_these.degree_grantor.check_rule</assert>
  </rule>
  <!-- tef:directeurThese -->
  <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:directeurThese">
   <assert test="not(not(tef:autoriteInterne) and not(tef:autoriteExterne))">tef_ulr.schematron.tef-abes.tef_admin_these.directeurThese.check_rule2</assert>
  </rule>
  <!-- tef:MADSAuthority -->
  <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:MADSAuthority">
   <assert test="count(tef:personMADS)=1">tef_ulr.schematron.tef-abes.tef_admin_these.MADSAuthority.check_rule</assert>
   <assert test="@authorityID = /mets:mets/mets:dmdSec/mets:mdWrap[@OTHERMDTYPE='tef_desc_edition']/mets:xmlData/tef:edition/tef:editeur/tef:autoriteInterne | /mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin//tef:autoriteInterne">tef_ulr.schematron.tef-abes.tef_admin_these.MADSAuthority.check_rule_2</assert>
  </rule>
 </pattern>
 
 <pattern name="mustHaveExternalAuthority" id="mustHaveExternalAuthority"> 
  <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">
   <!-- tef:auteur --> 
   <assert test="tef:auteur/tef:autoriteExterne[@autoriteSource='Sudoc']">tef_ulr.schematron.tef-abes.tef_admin_these.auteur.check_rule</assert>
   <!--tef:directeurThese-->
   <assert test="tef:directeurThese/tef:autoriteExterne[@autoriteSource='Sudoc']">tef_ulr.schematron.tef-abes.tef_admin_these.auteur.check_rule</assert>
   <!--tef:thesis.degree.grantor-->
   <assert test="tef:thesis.degree/tef:thesis.degree.grantor/tef:autoriteExterne[@autoriteSource='Sudoc']">tef_ulr.schematron.tef-abes.tef_admin_these.degree_grantor.check_rule_2</assert>
  </rule>      
 </pattern>

  <pattern name="tef_admin_these" id="tef_admin_these">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin">
      <assert test="count(tef:theseSurTravaux)=1">tef_ulr.schematron.tef-abes.tef_admin_these.surTravaux.check_rule_2</assert>
      <assert test="count(tef:avisJury)=1">tef_ulr.schematron.tef-abes.tef_admin_these.avisJury.check_rule_2</assert>
      <!--ERM-->
      <assert test="count(tef:presidentJury) &lt; 2">tef_ulr.schematron.tef-abes.tef_admin_these.presidentJury.check_rule_3</assert>
    </rule>
    <!--tef:thesis.degree-->
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:thesis.degree">
      <assert test="count(tef:thesis.degree.discipline[@xml:lang])=1">tef_ulr.schematron.tef-abes.tef_admin_these.degree.check_rule_7</assert>
    </rule>
    <!--tef:theseSurTravaux-->
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:theseSurTravaux">
      <assert test="text()='oui' or text()='non'">tef_ulr.schematron.tef-abes.tef_admin_these.surTravaux.check_rule</assert>
    </rule>
    <!--tef:avisJury-->
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:avisJury">
      <assert test="text()='oui' or text()='non'">tef_ulr.schematron.tef-abes.tef_admin_these.avisJury.check_rule</assert>
    </rule>
    <!--tef:presidentJury-->
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:presidentJury">
      <assert test="count(tef:nom)=1">tef_ulr.schematron.tef-abes.tef_admin_these.presidentJury.check_rule</assert>
      <assert test="count(tef:prenom)=1">tef_ulr.schematron.tef-abes.tef_admin_these.presidentJury.check_rule_2</assert>
    </rule>
    <!--tef:membreJury-->
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:membreJury">
      <assert test="count(tef:nom)=1">tef_ulr.schematron.tef-abes.tef_admin_these.membreJury.check_rule</assert>
      <assert test="count(tef:prenom)=1">tef_ulr.schematron.tef-abes.tef_admin_these.membreJury.check_rule_2</assert>
    </rule>
    <!--tef:rapporteur-->
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:rapporteur">
      <assert test="count(tef:nom)=1">tef_ulr.schematron.tef-abes.tef_admin_these.rapporteur.check_rule</assert>
      <assert test="count(tef:prenom)=1">tef_ulr.schematron.tef-abes.tef_admin_these.rapporteur.check_rule_2</assert>
    </rule>
    <!--tef:ecoleDoctorale-->
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:ecoleDoctorale">
      <assert test="count(tef:nom)">tef_ulr.schematron.tef-abes.tef_admin_these.ecoleDoctorale.check_rule</assert>
    </rule>
    <!--partenaireRecherche-->
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:partenaireRecherche">
      <assert test="not(@type='autreType' and not(@autreType))">tef_ulr.schematron.tef-abes.tef_admin_these.partenaireRecherche.check_rule</assert>
      <assert test="@type">tef_ulr.schematron.tef-abes.tef_admin_these.partenaireRecherche.check_rule_2</assert>
      <assert test="@type='equipeRecherche' or @type='laboratoire' or @type='universite' or @type='entreprise' or @type='fondation' or @type='autreType'">tef_ulr.schematron.tef-abes.tef_admin_these.partenaireRecherche.check_rule_3</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:partenaireRecherche[@type='autreType']">
      <assert test="@autreType">tef_ulr.schematron.tef-abes.tef_admin_these.partenaireRecherche.check_rule_4</assert>
    </rule>
  </pattern>
  <pattern name="tef_admin_these_oai_liste" id="tef_admin_these_oai_liste">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap/mets:xmlData/tef:thesisAdmin/tef:oaiSetSpec">
      <assert test="text() = document('http://www.abes.fr/abes/documents/tef/recommandation/oaiSets.xml')//setSpec">tef_ulr.schematron.tef-abes.tef_admin_these.oai_liste.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="tef_admin_these_travaux" id="tef_admin_these_travaux">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap/mets:xmlData/tef:thesisAdmin[tef:theseSurTravaux='oui']">
      <assert test="/mets:mets/mets:structMap/mets:div//mets:div[@TYPE='TRAVAUX']">tef_ulr.schematron.tef-abes.tef_admin_these.travaux.check_rule</assert>
    </rule>
  </pattern>
  <!-- Métadonnées de conservation de fichier :  -->
  <pattern name="tef_tech_fichier : règles générales">
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_tech_fichier']">
      <assert test="mets:xmlData/tef:meta_fichier">tef_ulr.schematron.tef-abes.tef_admin_these.tech_fichier.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_tech_fichier']/mets:xmlData/tef:meta_fichier">
      <assert test="count(tef:encodage)&lt;2">tef_ulr.schematron.tef-abes.tef_admin_these.tech_fichier.check_rule_2</assert>
      <assert test="count(tef:formatFichier)=1">tef_ulr.schematron.tef-abes.tef_admin_these.tech_fichier.check_rule_3</assert>
      <assert test="count(tef:noteFichier)&lt;2">tef_ulr.schematron.tef-abes.tef_admin_these.tech_fichier.check_rule_4</assert>
      <assert test="count(tef:structureFichier)&lt;2">tef_ulr.schematron.tef-abes.tef_admin_these.tech_fichier.check_rule_5</assert>
      <assert test="count(tef:taille)=1">tef_ulr.schematron.tef-abes.tef_admin_these.tech_fichier.check_rule_6</assert>
      <assert test="count(tef:autreFormatFichier)&lt;2">tef_ulr.schematron.tef-abes.tef_admin_these.tech_fichier.check_rule_7</assert>
    </rule>
    <rule context="tef:formatFichier[text() = 'autreFormat']">
      <assert test="following-sibling::tef:autreFormatFichier">tef_ulr.schematron.tef-abes.tef_admin_these.autreFormat.check_rule</assert>
    </rule>
    <rule context="tef:autreFormatFichier">
      <assert test="preceding-sibling::tef:formatFichier[text() = 'autreFormat']">tef_ulr.schematron.tef-abes.tef_admin_these.autreFormatFichier.check_rule</assert>
    </rule>
    <rule context="tef:formatFichier">
      <assert test="text()='OpenDocument' or text()='PDF' or text()='PDF/A' or text()='HTML' or text()='RTF' or text()='TXT' or text()='XML' or text()='JPEG' or text()='GIF' or text()='PNG' or text()='TIFF' or text()='MP3' or text()='MPEG' or text()='QuickTime' or text()='autreFormat'">tef_ulr.schematron.tef-abes.tef_admin_these.formatFichier.check_rule</assert>
    </rule>
    <rule context="tef:encodage">
      <assert test="text()='ASCII' or text()='Latin 1' or text()='Unicode'">tef_ulr.schematron.tef-abes.tef_admin_these.encodage.check_rule</assert>
    </rule>
  </pattern>
  
  
  <!-- ***************************************** metsRights ***************************************** -->
  <!-- Métadonnées de droits -->
  <pattern name="tef_droits">
    <rule context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_etablissement_these']">
      <assert test="mets:xmlData/metsRights:RightsDeclarationMD">tef_ulr.schematron.tef-abes.metsRights.tef_droits_etablissement_these.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_auteur_these']">
      <assert test="mets:xmlData/metsRights:RightsDeclarationMD">tef_ulr.schematron.tef-abes.metsRights.tef_droits_auteur_these.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_externe']">
      <assert test="mets:xmlData/metsRights:RightsDeclarationMD">tef_ulr.schematron.tef-abes.metsRights.tef_droits_externe.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_version']">
      <assert test="mets:xmlData/metsRights:RightsDeclarationMD">tef_ulr.schematron.tef-abes.metsRights.tef_droits_version.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap/mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context[@CONTEXTCLASS=&quot;GENERALPUBLIC&quot;]">
      <assert test="metsRights:Permissions/@DISPLAY">tef_ulr.schematron.tef-abes.metsRights.RightsDeclarationMD_Context.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap/mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context[@CONTEXTCLASS=&quot;GENERALPUBLIC&quot;]">
      <assert test="metsRights:Permissions/@DUPLICATE">tef_ulr.schematron.tef-abes.metsRights.RightsDeclarationMD_Context.check_rule_2</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_etablissement_these']/mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Constraints[@CONSTRAINTTYPE='TIME']">
      <assert test="starts-with(metsRights:ConstraintDescription, 'confidentialité')">tef_ulr.schematron.tef-abes.metsRights.tef_droits_etablissement_these.check_rule_time</assert>
    </rule>
    <rule context="/mets:mets/mets:amdSec/mets:rightsMD/mets:mdWrap[@OTHERMDTYPE='tef_droits_auteur_these' or @OTHERMDTYPE='tef_droits_externe' or @OTHERMDTYPE='tef_droits_version']/mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Constraints[@CONSTRAINTTYPE='TIME']">
      <assert test="starts-with(metsRights:ConstraintDescription, 'restriction')">tef_ulr.schematron.tef-abes.metsRights.tef_droits_auteur_externe.check_rule</assert>
    </rule>
    <!-- manque la validation des dates : pas facile sans XPATH 2.0 -->
  </pattern>
  <!-- *** mets:fileSec ******************************************   -->
  <pattern name="mets_fileSec" id="mets_fileSec">
    <rule context="/mets:mets/mets:fileSec">
      <assert test="count(./mets:fileGrp[@USE='archive' or @USE='archive_et_diffusion'])=1">tef_ulr.schematron.tef-abes.mets_fileSec.archive_et_diffusion.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:fileSec/mets:fileGrp[@USE='archive' or @USE='archive_et_diffusion']">
      <assert test="mets:file">tef_ulr.schematron.tef-abes.mets_fileSec.archive_et_diffusion.check_rule_2</assert>
    </rule>
    <rule context="/mets:mets/mets:fileSec/mets:fileGrp[@USE='archive' or @USE='archive_et_diffusion']/mets:file">
      <assert test="@ADMID = /mets:mets/mets:amdSec/mets:techMD[mets:mdWrap[@OTHERMDTYPE='tef_tech_fichier']]/@ID">tef_ulr.schematron.tef-abes.mets_fileSec.archive_et_diffusion.check_rule_3</assert>
    </rule>
    <rule context="/mets:mets/mets:fileSec/mets:fileGrp[@USE='archive' or @USE='archive_et_diffusion']/mets:file/mets:FLocat">
      <assert test="@xlink:href">tef_ulr.schematron.tef-abes.mets_fileSec.archive_et_diffusion.check_rule_4</assert>
    </rule>
    <rule context="/mets:mets/mets:fileSec/mets:fileGrp">
      <assert test="@ID = /mets:mets/mets:structMap/mets:div[@TYPE='THESE']/mets:div[@TYPE='VERSION_COMPLETE' or @TYPE='VERSION_INCOMPLETE']/mets:div[@TYPE='EDITION']/mets:fptr/@FILEID">tef_ulr.schematron.tef-abes.mets_fileSec.fileGrp.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:fileSec/mets:fileGrp/mets:file">
      <assert test="count(mets:FLocat)=1">tef_ulr.schematron.tef-abes.mets_fileSec.fileGrp.check_rule_2</assert>
    </rule>
  </pattern>
  <!-- ****************************Arborescence Structural Map *****************************
    pb : !! besoin de xpath 2.0 pour tokenize !   Sinon, risque de conflit sur identifiants.
    -->
  <pattern name="mets_structMap_1" id="mets_structMap_1">
    <rule context="/mets:mets/mets:structMap">
      <assert test="@TYPE = 'logical'">tef_ulr.schematron.tef-abes.structMap.check_rule</assert>
      <assert test="count(mets:div)=1">tef_ulr.schematron.tef-abes.structMap.check_rule_2</assert>
      <assert test="mets:div[@TYPE='THESE']">tef_ulr.schematron.tef-abes.structMap.check_rule_3</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_CONTENTIDS" id="mets_structMap_CONTENTIDS">
    <rule context="/mets:mets/mets:structMap//mets:div[@TYPE='THESE' or @TYPE='VERSION_COMPLETE' or @TYPE='VERSION_INCOMPLETE' or @TYPE='EDITION' ]">
      <assert test="@CONTENTIDS">tef_ulr.schematron.tef-abes.structMap.CONTENTIDS.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_2" id="mets_structMap_2">
    <!-- Sur les enfants du mets:div de type "THESE" -->
    <rule context="/mets:mets/mets:structMap/mets:div">
      <assert test="count(mets:div[@TYPE='VERSION_COMPLETE'])=1">tef_ulr.schematron.tef-abes.structMap.mets_div.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:structMap/mets:div/mets:div">
      <assert test="@TYPE='VERSION_COMPLETE' or @TYPE='VERSION_INCOMPLETE' or @TYPE='RESSOURCES_EXTERNES' or @TYPE='RESSOURCE_TIERS' or @TYPE='TRAVAUX'">tef_ulr.schematron.tef-abes.structMap.mets_div.check_rule_2</assert>
    </rule>
    <!-- Sur les mets:div de type "VERSION_COMPLETE" ou "VERSION_INCOMPLETE" -->
    <rule context="/mets:mets/mets:structMap/mets:div/mets:div[@TYPE='VERSION_COMPLETE' or @TYPE='VERSION_INCOMPLETE']/mets:div">
      <assert test="@TYPE='EDITION' ">tef_ulr.schematron.tef-abes.structMap.mets_div.check_rule_3</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_ressources_externes" id="mets_structMap_ressources_externes">
    <rule context="/mets:mets/mets:structMap/mets:div/mets:div[@TYPE='RESSOURCES_EXTERNES']/mets:div">
      <assert test="@TYPE='RESSOURCE_TIERS' or @TYPE='TRAVAUX' or @TYPE='RESSOURCES_EXTERNES'">tef_ulr.schematron.tef-abes.structMap.ressources_externes.check_rule</assert>
    </rule>
    <rule context="/mets:mets/mets:structMap/mets:div/mets:div[@TYPE='RESSOURCES_EXTERNES']">
      <assert test=".//mets:div[@TYPE='RESSOURCE_TIERS'] or .//mets:div[@TYPE='TRAVAUX']">tef_ulr.schematron.tef-abes.structMap.ressources_externes.check_rule_2</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_lien_ressourceExterne_fichier" id="mets_structMap_lien_ressourceExterne_fichier">
    <rule context="/mets:mets/mets:structMap/mets:div/mets:div[@TYPE='RESSOURCE_TIERS' or @TYPE='TRAVAUX']/mets:fptr">
      <assert test="@FILEID = /mets:mets/mets:fileSec/mets:fileGrp//mets:file/@ID">tef_ulr.schematron.tef-abes.structMap.ressourceExterne_fichier.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_meta_desc_These" id="mets_structMap_meta_desc_These">
    <rule context="/mets:mets/mets:structMap/mets:div[@TYPE='THESE']">
      <assert test="contains(@DMDID, /mets:mets/mets:dmdSec[mets:mdWrap[@OTHERMDTYPE='tef_desc_these']]/@ID)">tef_ulr.schematron.tef-abes.structMap.meta_desc_These.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_meta_admin_These" id="mets_structMap_meta_admin_These">
    <rule context="/mets:mets/mets:structMap/mets:div[@TYPE='THESE']">
      <assert test="contains(@ADMID, /mets:mets/mets:amdSec/mets:techMD[mets:mdWrap[@OTHERMDTYPE='tef_admin_these']]/@ID)">tef_ulr.schematron.tef-abes.structMap.meta_admin_These.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_meta_droits_etab_These" id="mets_structMap_meta_droits_etab_These">
    <rule context="/mets:mets/mets:structMap/mets:div[@TYPE='THESE']">
      <assert test="contains(@ADMID, /mets:mets/mets:amdSec/mets:rightsMD[mets:mdWrap[@OTHERMDTYPE='tef_droits_etablissement_these']]/@ID)">tef_ulr.schematron.tef-abes.structMap.meta_droits_etab_These.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_meta_droits_auteur_These" id="mets_structMap_meta_droits_auteur_These">
    <rule context="/mets:mets/mets:structMap/mets:div[@TYPE='THESE']">
      <assert test="contains(@ADMID, /mets:mets/mets:amdSec/mets:rightsMD[mets:mdWrap[@OTHERMDTYPE='tef_droits_auteur_these']]/@ID)">tef_ulr.schematron.tef-abes.structMap.meta_droits_auteur_These.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_meta_desc_Version_incomplete" id="mets_structMap_meta_desc_Version_incomplete">
    <rule context="/mets:mets/mets:structMap/mets:div/mets:div[@TYPE='VERSION_INCOMPLETE']">
      <assert test="@DMDID = /mets:mets/mets:dmdSec[mets:mdWrap/@OTHERMDTYPE='tef_desc_version']/@ID">tef_ulr.schematron.tef-abes.structMap.meta_desc_Version_incomplete.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_meta_droits_Version" id="mets_structMap_meta_droits_Version">
    <rule context="/mets:mets/mets:structMap/mets:div/mets:div[@TYPE='VERSION_COMPLETE' or @TYPE='VERSION_INCOMPLETE']">
      <assert test="@ADMID = /mets:mets/mets:amdSec/mets:rightsMD[mets:mdWrap/@OTHERMDTYPE='tef_droits_version']/@ID">tef_ulr.schematron.tef-abes.structMap.meta_droits_Version.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_meta_Edition" id="mets_structMap_meta_Edition">
    <rule context="/mets:mets/mets:structMap/mets:div/mets:div/mets:div[@TYPE='EDITION']">
      <assert test="@DMDID = /mets:mets/mets:dmdSec[mets:mdWrap[@OTHERMDTYPE='tef_desc_edition']]/@ID">tef_ulr.schematron.tef-abes.structMap.meta_Edition.check_rule</assert>
    </rule>
  </pattern>
  <pattern name="mets_structMap_meta_ressources_externes" id="mets_structMap_meta_ressources_externes">
    <rule context="/mets:mets/mets:structMap/mets:div//mets:div[@TYPE='RESSOURCE_TIERS' or @TYPE='TRAVAUX']">
      <assert test="@ADMID or ancestor::mets:div[@TYPE='RESSOURCES_EXTERNES']/@ADMID = /mets:mets/mets:amdSec/mets:rightsMD[mets:mdWrap/@OTHERMDTYPE='tef_droits_externe']/@ID">tef_ulr.schematron.tef-abes.structMap.meta_ressources_externes.check_rule</assert>
      <assert test="@DMDID or ancestor::mets:div[@TYPE='RESSOURCES_EXTERNES']/@ADMID = /mets:mets/mets:dmdSec[mets:mdWrap/@OTHERMDTYPE='tef_desc_externe']/@ID">tef_ulr.schematron.tef-abes.structMap.meta_ressources_externes.check_rule_2</assert>
      <assert test="not(@ADMID and ancestor::mets:div[@TYPE='RESSOURCES_EXTERNES']/@ADMID)">tef_ulr.schematron.tef-abes.structMap.meta_ressources_externes.check_rule_3</assert>
      <assert test="not(@DMDID and ancestor::mets:div[@TYPE='RESSOURCES_EXTERNES']/@DMDID)">tef_ulr.schematron.tef-abes.structMap.meta_ressources_externes.check_rule_4</assert>
    </rule>
  </pattern>
  <diagnostics>
    <diagnostic id="r_langues">Précisez la langue.</diagnostic>
  </diagnostics>
</schema>

