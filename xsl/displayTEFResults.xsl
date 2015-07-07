<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:fo="http://www.w3.org/1999/XSL/Format" 
  xmlns:dc="http://purl.org/dc/elements/1.1/" 
  xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
  xmlns:tef="http://www.abes.fr/abes/documents/tef"
  xmlns:mets="http://www.loc.gov/METS/"
  xmlns:metsRights="http://cosimo.stanford.edu/sdr/metsrights/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:mads="http://www.loc.gov/mads/"
  xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="html"/>
    
    
	<xsl:template match="mets:mets | mets">
	<style type="text/css">
		.table-tef{
			border:1px solid #CCCCCC;
			border-collapse:collapse;
			width:90%;
			margin-top:10px;
			margin-bottom:10px;
		}
		
		.table-tef th{
			background-color:#BDC0C0;
			font-weight:bold;
			text-align:right;
			font-size:110%;
			color:#9F6917;
		}
		
		.table-tef td.libelle{
			text-align:left;
			width:30%;
		} 
		
		.table-tef td.librow{
			text-align:left;
			width:15%;
		}
	
		.table-tef td.valeur{
			text-align:left;
			font-weight:bold;
		}
		
		.normal{
			font-weight:normal;
		} 
		
		.titreThese{
			color:#834E83;
			font-size:125%;
			font-weight:bold;
		}
	</style>

	<div align="center" style="margin-top:20px;">
		        		
        		<table border="1" class="table-tef" >
		        	<xsl:apply-templates select="mets:dmdSec/mets:mdWrap/mets:xmlData/tef:thesisRecord" mode="headTitre"/>
		        	<xsl:apply-templates select="mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:auteur" mode="headAuteur"/>
        			<xsl:apply-templates select="mets:metsHdr" mode="headInfosNotice" />
		        </table>
		        
        		<table  border="1" class="table-tef">
		          <tr><th colspan="2">Description de la these</th></tr>
		          <xsl:apply-templates select="mets:dmdSec/mets:mdWrap/mets:xmlData/tef:thesisRecord" mode="InfosGen"/>
		        </table>
		          
        		<table  border="1" class="table-tef">
		          <tr><th colspan="3">M&#233;tadonn&#233;es Administratives</th></tr>
		          <xsl:apply-templates select="mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin" mode="BlocAdmin"/>
		        </table>
		          
				<table  border="1" class="table-tef">
		          <tr><th colspan="2">VERSION</th></tr>
		          <xsl:apply-templates select="mets:amdSec/mets:rightsMD[@ID='dr_version']/mets:mdWrap[@OTHERMDTYPE='tef_droits_version']" mode="BlocVersion"/>
		        </table>
		          
        		<table  border="1" class="table-tef">
				  <tr><th colspan="2">DROITS</th></tr>
				  <tr><th colspan="2">Autorisation de l'établissement de soutenance</th></tr>
		          <xsl:apply-templates select="mets:amdSec/mets:rightsMD[@ID='dr_expr_univ']/mets:mdWrap[@OTHERMDTYPE='tef_droits_etablissement_these']" mode="BlocDroitsEtablissement"/>
				  <tr><th colspan="2">Autorisation de l'auteur</th></tr>
		          <xsl:apply-templates select="mets:amdSec/mets:rightsMD[@ID='dr_expr_thesard']/mets:mdWrap[@OTHERMDTYPE='tef_droits_auteur_these']" mode="BlocDroitsAuteur"/>
				</table>
				  
				<table  border="1" class="table-tef">
		          <tr><th colspan="2">Fichiers</th></tr>
				  <xsl:apply-templates select="mets:fileSec" mode="BlocFichiers"/>
				</table>

        
        </div>
    </xsl:template>
    
    
	<!--______________________ HEADER _____________________________-->
    
		<!-- Informations Titre -->
    	<xsl:template match="mets:dmdSec/mets:mdWrap/mets:xmlData/tef:thesisRecord" mode="headTitre">
		<tr>
			<th colspan="2">
	          <span class="titreThese"><xsl:value-of select="dc:title"/>&#32;(<xsl:value-of select="dc:title/@xml:lang"/>)</span>
	        </th>
		</tr>
		</xsl:template>
		
		<!-- Informations Auteur -->
    	<xsl:template match="mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin/tef:auteur" mode="headAuteur">
		<tr>
			<td colspan="3" class="valeur">
	          <span class="normal">Auteur de la Thèse : </span><xsl:value-of select="concat(tef:prenom,' ',tef:nom)"/>
	        </td>
		</tr>
		</xsl:template>
    
    	<!-- Informations Notice -->
		<xsl:template match="mets:metsHdr" mode="headInfosNotice">
		<tr>
			<td colspan="2" class="valeur">
				<span class="normal">Identifiant : </span><xsl:value-of select="@ID"/>
			</td>
		</tr>
		<tr>
			<td class="valeur">
				<span class="normal">Etablissement Createur : </span>
				<xsl:value-of select="mets:agent[@ROLE='CREATOR']/mets:name"/>
			</td>
	        <td class="valeur">
	        	<span class="normal">Création de la notice : </span><xsl:value-of select="@CREATEDATE"/><br/>
	        	<span class="normal">Dernière modification : </span><xsl:value-of select="@LASTMODDATE"/>
	        </td>
		</tr>
		</xsl:template>
		    

		

		


    
	<!--______________________ BLOC TEF_DESC_THESE _____________________________-->
	<xsl:template match="mets:dmdSec/mets:mdWrap/mets:xmlData/tef:thesisRecord" mode="InfosGen">

		<!-- dcterms:title-->
		<tr>
			<td class="libelle">
				dcterms:title (<xsl:value-of select="dcterms:alternative/@xml:lang"/>)
			</td>
			<td class="valeur">
	        	<xsl:value-of select="dc:title"/>
	        </td>
		</tr>

		<!-- dcterms:alternative -->
		<xsl:if test="normalize-space(dcterms:alternative) != ''">
		<tr>
			<td class="libelle">
				dcterms:alternative ( (<xsl:value-of select="dcterms:alternative/@xml:lang"/>)
			</td>
	        <td class="valeur">
				<xsl:value-of select="dcterms:alternative"/>
			</td>
		</tr>
		</xsl:if>
		
		<!-- dcterms:abstract -->    
		<xsl:for-each select="dcterms:abstract">
			<xsl:if test=". != ''">
			<tr>
				<td class="libelle">
					dcterms:abstract (<xsl:value-of select="@xml:lang"/>)
				</td>
		        <td class="valeur">
		          <xsl:value-of select="."/>
		        </td>
			</tr>
		</xsl:if>
		</xsl:for-each>
		
		<!-- dc:subject -->
	    <xsl:for-each select="dc:subject">
	    <xsl:if test=". != ''">		
		<tr>
			<td class="libelle">
				dc:subject (<xsl:value-of select="@xml:lang"/>)
			</td>
	        <td class="valeur">
	          		<xsl:value-of select="."/>
	        </td>
		</tr>
		</xsl:if>
	    </xsl:for-each>
	    
		<!-- 
		<tr>
			<td class="libelle">
				Mots-Clés pour les Sets OAI
			</td>
	        <td class="valeur">
	        	<ul>
	        		<xsl:for-each select="dc:subject">
	        			<xsl:if test="@xsi:type == 'tef:oaiSetLang'">
							<li><xsl:value-of select="." /></li>
	        			</xsl:if>
	         		</xsl:for-each>
	         	</ul>
	        </td>
		</tr>
		 -->
		 
	
		<!-- dc:type (dcterms:DCMIType) -->
		<xsl:for-each select="dc:type">
		<tr>
			<td class="libelle" nowrap="true">
				dc:type (<xsl:value-of select="@*" />)
			</td>
	        <td class="valeur">
       			<xsl:value-of select="." />
	        </td>
		</tr>
		</xsl:for-each>
		 
		<!-- dcterms:spatial -->
		<tr>
			<td class="libelle">
				dcterms:spatial
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="dcterms:spatial" />
	        </td>
		</tr>
		
		<!-- dc:language -->
		<tr>
			<td class="libelle">
				dc:language (dcterms:RFC3066)
			</td>
	        <td class="valeur">
         		<xsl:value-of select="dc:language" />
	        </td>
		</tr>

	</xsl:template>
	
	
	<!--___________________________ BLOC TEF_ADMIN_THESE ________________________________-->
	<xsl:template match="mets:amdSec/mets:techMD/mets:mdWrap[@OTHERMDTYPE='tef_admin_these']/mets:xmlData/tef:thesisAdmin" mode="BlocAdmin">	
		<!-- Type -->
		<tr>
			<td class="librow" rowspan="6">
				tef:auteur
			</td>
			<td class="librow" nowrap="true">
				tef:nom :
			</td>
	        <td class="valeur">
	        	<xsl:value-of select="tef:auteur/tef:nom"/>
	        </td>
	    </tr>
	    <tr>
	    	<td class="librow" nowrap="true">tef:prenom :</td>
	    	<td class="valeur">
	    		<xsl:value-of select="tef:auteur/tef:prenom"/>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="librow" nowrap="true">tef:dateNaissance :</td>
	    	<td class="valeur">
	    		<xsl:value-of select="tef:auteur/tef:dateNaissance"/>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="librow" nowrap="true">tef:nationalite :</td>
	    	<td class="valeur">
	    		<xsl:value-of select="tef:auteur/tef:nationalite"/>
	    	</td>
	    </tr>	    
	    <tr>
	    	<td class="librow" nowrap="true">tef:autoriteExterne (Sudoc) : </td>
	    	<td class="valeur">
	          	<xsl:value-of select="tef:auteur/tef:autoriteExterne[@autoriteSource='Sudoc']" />
	        </td>
		</tr>
	    <tr>
	    	<td class="librow" nowrap="true">tef:autoriteExterne (LDAP) : </td>
	    	<td class="valeur">
	          	<xsl:value-of select="tef:auteur/tef:autoriteExterne[@autoriteSource='LDAP']" />
	        </td>
		</tr>
		
		
		<xsl:for-each select="dc:identifier">
		<tr>
			<td class="libelle" colspan="2">
				dc:identifier (<xsl:value-of select="@*"/>)
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="." />
	        </td>
		</tr>
		</xsl:for-each>
	
		<tr>
			<td class="libelle" colspan="2">
				dcterms:dateAccepted (dcterms:W3CDTF)
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="dcterms:dateAccepted" />
	        </td>
		</tr>
		
		<tr>
			<td class="libelle" rowspan="2">
				tef:thesis.degree
			</td>
			<td class="librow">
				tef:thesis.degree.discpline (<xsl:value-of select="tef:thesis.degree/tef:thesis.degree.discipline/@xml:lang"/>)
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="tef:thesis.degree/tef:thesis.degree.discipline[@xml:lang='fr']" />
	        </td>
		</tr>
		<tr>
			<td class="librow">
				tef:thesis.degree.level
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="tef:thesis.degree/tef:thesis.degree.level" />
	        </td>
		</tr>
		<xsl:for-each select="tef:thesis.degree/tef:thesis.degree.grantor">
		<tr>
	        <td class="libelle">
	        	tef:thesis.degree.grantor
	        </td>
	        <td class="valeur" colspan="2">
	         		<span class="normal">tef:nom: </span><xsl:value-of select="tef:nom" /><br/>
	         		<span class="normal">tef:autoriteInterne : </span><xsl:value-of select="tef:autoriteInterne" /><br/>
	         		<span class="normal">tef:autoriteExterne : </span><xsl:value-of select="tef:autoriteExterne" />
	        </td>
		</tr>
		</xsl:for-each>
		<tr>
			<td class="libelle" colspan="2">
				tef:theseSurTravaux
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="tef:theseSurTravaux" />
	        </td>
		</tr>
		
		<tr>
			<td class="libelle" colspan="2">
				tef:avisJury
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="tef:avisJury" />
	        </td>
		</tr>
		
		<!-- Directeur de Thèse -->
		<xsl:for-each select="tef:directeurThese">
			<xsl:if test="normalize-space(.) != ''">
			<xsl:variable name="rowspan" select="count(node())" />
			<tr>
				<td class="librow" rowspan="{$rowspan}">
					<xsl:value-of select="name()"/>
				</td>
				<td class="librow" nowrap="true">
					tef:nom :
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="tef:nom" />
				</td>
			</tr>
			<tr>
				<td class="librow" nowrap="true">
					tef:prenom :
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="tef:prenom" />
				</td>
			</tr>
			<tr>
				<td class="librow" nowrap="true">
					tef:autoriteInterne : 
				</td>
		        <td class="valeur">
	         		<xsl:value-of select="tef:autoriteInterne" />
		        </td>
			</tr>
			<xsl:for-each select="tef:autoriteExterne">
			<tr>
				<td class="librow" nowrap="true">
					tef:autoriteExterne (<xsl:value-of select="./@autoriteSource" />) : 
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="." />
				</td>
			</tr>
			</xsl:for-each>
			</xsl:if>
		</xsl:for-each>
		
		<!-- PresidentJury -->
		<xsl:for-each select="tef:presidentJury">
			<xsl:if test="normalize-space(.) != ''">
			<xsl:variable name="rowspan" select="count(node())" />
			<tr>
				<td class="librow" rowspan="{$rowspan}">
					<xsl:value-of select="name()"/>
				</td>
				<td class="librow" nowrap="true">
					tef:nom :
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="tef:nom" />
				</td>
			</tr>
			<tr>
				<td class="librow" nowrap="true">
					tef:prenom :
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="tef:prenom" />
				</td>
			</tr>
			<tr>
				<td class="librow" nowrap="true">
					tef:autoriteInterne : 
				</td>
		        <td class="valeur">
	         		<xsl:value-of select="tef:autoriteInterne" />
		        </td>
			</tr>
			<xsl:for-each select="tef:autoriteExterne">
			<tr>
				<td class="librow" nowrap="true">
					tef:autoriteExterne (<xsl:value-of select="./@autoriteSource" />) : 
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="." />
				</td>
			</tr>
			</xsl:for-each>
			</xsl:if>
		</xsl:for-each>
		
		<!-- Membre Jury -->
		<xsl:for-each select="tef:membreJury">
			<xsl:if test="normalize-space(.) != ''">
			<xsl:variable name="rowspan" select="count(node())" />
			<tr>
				<td class="librow" rowspan="{$rowspan}">
					<xsl:value-of select="name()"/>
				</td>
				<td class="librow" nowrap="true">
					tef:nom :
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="tef:nom" />
				</td>
			</tr>
			<tr>
				<td class="librow" nowrap="true">
					tef:prenom :
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="tef:prenom" />
				</td>
			</tr>
			<tr>
				<td class="librow" nowrap="true">
					tef:autoriteInterne : 
				</td>
		        <td class="valeur">
	         		<xsl:value-of select="tef:autoriteInterne" />
		        </td>
			</tr>
			<xsl:for-each select="tef:autoriteExterne">
			<tr>
				<td class="librow" nowrap="true">
					tef:autoriteExterne (<xsl:value-of select="./@autoriteSource" />) : 
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="." />
				</td>
			</tr>
			</xsl:for-each>
			</xsl:if>
		</xsl:for-each>
		
		<!-- Rapporteur -->
		<xsl:for-each select="tef:rapporteur">
			<xsl:if test="normalize-space(.) != ''">
			<xsl:variable name="rowspan" select="count(node())" />
			<tr>
				<td class="librow" rowspan="{$rowspan}">
					<xsl:value-of select="name()"/>
				</td>
				<td class="librow" nowrap="true">
					tef:nom :
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="tef:nom" />
				</td>
			</tr>
			<tr>
				<td class="librow" nowrap="true">
					tef:prenom :
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="tef:prenom" />
				</td>
			</tr>
			<tr>
				<td class="librow" nowrap="true">
					tef:autoriteInterne : 
				</td>
		        <td class="valeur">
	         		<xsl:value-of select="tef:autoriteInterne" />
		        </td>
			</tr>
			<xsl:for-each select="tef:autoriteExterne">
			<tr>
				<td class="librow" nowrap="true">
					tef:autoriteExterne (<xsl:value-of select="./@autoriteSource" />) : 
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="." />
				</td>
			</tr>
			</xsl:for-each>
			</xsl:if>
		</xsl:for-each>
		
		<xsl:for-each select="tef:partenaireRecherche" >
			<xsl:if test="normalize-space(.) != ''">
			<xsl:variable name="rowspanPartRech" select="count(./*)" />
			<tr>
				<td class="librow" rowspan="{$rowspanPartRech}">
					<xsl:value-of select="name()"/> (<xsl:value-of select="@type" />)
				</td>
				<td class="librow" nowrap="true">
					tef:nom
				</td>
		        <td class="valeur">
		         	<xsl:value-of select="tef:nom" />
				</td>
			</tr>
			<tr>
				<td class="librow">
					tef:autoriteInterne			
				</td>
				<td class="valeur">
		         	<xsl:value-of select="tef:autoriteInterne" />				
				</td>
			</tr>
			<tr>
				<td class="librow">
					tef:autoriteExterne			
				</td>
				<td class="valeur">
		         	<xsl:value-of select="tef:autoriteExterne" />				
				</td>
			</tr>
			</xsl:if>
		</xsl:for-each>
		
		<tr>
			<td class="libelle" colspan="2">
				tef:oaiSetSpec :
			</td>
			<td class="valeur">
				<xsl:value-of select="tef:oaiSetSpec" />
			</td>
		</tr>
		
	</xsl:template>
	
	<!--___________________________ BLOC TEF_VERSION_THESE ________________________________-->
	<xsl:template match="mets:amdSec/mets:rightsMD[@ID='dr_version']/mets:mdWrap[@OTHERMDTYPE='tef_droits_version']" mode="BlocVersion">
	
	
		<!-- ContextClass -->
		<tr>
			<td class="libelle">
				Context
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/@CONTEXTCLASS" />
	        </td>
		</tr>


		<tr>
			<td class="libelle">
				COPY
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@COPY" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DELETE
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DELETE" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DISCOVER
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DISCOVER" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DISPLAY
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DISPLAY" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DUPLICATE
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DUPLICATE" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				MODIFY
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@MODIFY" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				PRINT
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@PRINT" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				Titulaire des droits
			</td>
	        <td class="valeur">
	        	<ul>
	       		<xsl:for-each select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:RightsHolder">
		         	<li><xsl:value-of select="metsRights:RightsHolderName" /></li>
				</xsl:for-each>
				</ul>
	        </td>
		</tr>
		
		<tr>
			<td class="libelle">
				Contrainte
			</td>
	        <td class="valeur">
	        	<b><xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Constraints/@CONSTRAINTTYPE"/></b><br/>
	        	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Constraints/metsRights:ConstraintDescription"/>
	        </td>
		</tr> 
	</xsl:template>
	
	
	<!--___________________________ BLOC TEF_DROITS_ETABLISSEMENT_THESE ________________________________-->
	<xsl:template match="mets:amdSec/mets:rightsMD[@ID='dr_expr_univ']/mets:mdWrap[@OTHERMDTYPE='tef_droits_etablissement_these']" mode="BlocDroitsEtablissement">
		<!-- ContextClass -->
		<tr>
			<td class="libelle">
				Context
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/@CONTEXTCLASS" />
	        </td>
		</tr>


		<tr>
			<td class="libelle">
				COPY
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@COPY" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DELETE
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DELETE" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DISCOVER
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DISCOVER" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DISPLAY
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DISPLAY" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DUPLICATE
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DUPLICATE" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				MODIFY
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@MODIFY" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				PRINT
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@PRINT" />
	        </td>
		</tr>	
		<tr>
			<td class="libelle">
				Titulaire des droits
			</td>
	        <td class="valeur">
	        	<ul>
	       		<xsl:for-each select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:RightsHolder">
		         	<li><xsl:value-of select="metsRights:RightsHolderName" /></li>
				</xsl:for-each>
				</ul>
	        </td>
		</tr>
		
		<tr>
			<td class="libelle">
				Contrainte
			</td>
	        <td class="valeur">
	        	<b><xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Constraints/@CONSTRAINTTYPE"/></b><br/>
	        	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Constraints/metsRights:ConstraintDescription"/>
	        </td>
		</tr> 		
	</xsl:template>
	
	
	<!--___________________________ BLOC TEF_DROITS_AUTEUR_THESE ________________________________-->
	<xsl:template match="mets:amdSec/mets:rightsMD[@ID='dr_expr_thesard']/mets:mdWrap[@OTHERMDTYPE='tef_droits_auteur_these']" mode="BlocDroitsAuteur">
		<!-- ContextClass -->
		<tr>
			<td class="libelle">
				Context
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/@CONTEXTCLASS" />
	        </td>
		</tr>


		<tr>
			<td class="libelle">
				COPY
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@COPY" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DELETE
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DELETE" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DISCOVER
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DISCOVER" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DISPLAY
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DISPLAY" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				DUPLICATE
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@DUPLICATE" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				MODIFY
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@MODIFY" />
	        </td>
		</tr>
		<tr>
			<td class="libelle">
				PRINT
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Permissions/@PRINT" />
	        </td>
		</tr>	
		<tr>
			<td class="libelle">
				Titulaire des droits
			</td>
	        <td class="valeur">
	        	<ul>
	       		<xsl:for-each select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:RightsHolder">
		         	<li><xsl:value-of select="metsRights:RightsHolderName" /></li>
				</xsl:for-each>
				</ul>
	        </td>
		</tr>
		
		<tr>
			<td class="libelle">
				Contrainte
			</td>
	        <td class="valeur">
	        	<b><xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Constraints/@CONSTRAINTTYPE"/></b><br/>
	        	<xsl:value-of select="mets:xmlData/metsRights:RightsDeclarationMD/metsRights:Context/metsRights:Constraints/metsRights:ConstraintDescription"/>
	        </td>
		</tr> 		
	</xsl:template>


	
	<!--___________________________ BLOC FICHIERS ________________________________-->
	<xsl:template match="mets:fileSec" mode="BlocFichiers">
		<!-- Use -->
		<tr>
			<td class="libelle">
				Edition
			</td>
	        <td class="valeur">
	         	<xsl:value-of select="mets:fileGrp/@USE" />
	        </td>
		</tr>
	</xsl:template>


</xsl:stylesheet>