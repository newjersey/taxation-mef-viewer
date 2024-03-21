<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/SchK2K3DistriOwnrChainStmt" />

	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		
		<!--Added Header Elements start here-->
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				<br></br>
				Partnership or Corporation EIN:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
			<xsl:choose>
				<xsl:when test="$DependencyData/PartnershipEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipEIN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/CorporationEIN"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
				
			</div>
		</div>
		
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Name of Partnership or Corporation:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnershipName">
							
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine2Txt"/>
							</xsl:call-template>
					
					</xsl:when>
					
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				<br></br>
				Partner or Shareholder TIN:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnerEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerEIN"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:when test="$DependencyData/PartnerSSN">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerSSN"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:when test="$DependencyData/ShareholderEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderEIN"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderSSN"/>
							</xsl:call-template>
					</xsl:otherwise>
					
				</xsl:choose>
				
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
			<br></br>
				Name of Partner or Shareholder:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnerName">
							
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine2Txt"/>
							</xsl:call-template>
					
					</xsl:when>
					<xsl:when test="$DependencyData/ShareholderName">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine2Txt"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:when test="$DependencyData/PartnerPersonNm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerPersonNm"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderPersonNm"/>
							</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				
				
			</div>
		</div>
		
		<!--End of header-->
		
		
		
		<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">           
					<th class="styDepTblCell" scope="col" style="width:15mm;">(a) Row number of distributing foreign corporation</th>
					<th class="styDepTblCell" scope="col" style="width:95mm;">(b) Description of ownership chain</th>
					
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/SchK2K3DistriOwnrChainGrp">
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<td class="styDepTblCell" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="RowId"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MediumExplanationTxt"/>
							</xsl:call-template>
						</td>
						
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		
	</xsl:template>

	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="$depDocTitle" /></title>

				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content= "{$depDocTitle}" />

				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
				<xsl:call-template name="InitJS"></xsl:call-template>

				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''"> -->
						<xsl:call-template name="AddOnStyle"></xsl:call-template>
					<!-- </xsl:if> -->
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass" >
				<xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="">
						<xsl:value-of select="$depDocTitle" />
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
				<xsl:call-template name="ShowDependencyData" />
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
