<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 08/31/2015 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/Frm5227Elect1141110gFlowStmt"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<!-- New -->
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="width:auto;">
						<span>
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;padding-left:6mm;">
						<span class="styTopSectionLineLbl">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$DependencyData"/>
							</xsl:call-template>
						</span>
					</div>
				</div>
				<!--Data info Begin -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Entity Name:</span>
					</div>
					<div style="float:left;clear:none;width:440px;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/EntityName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/EntityName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					</div>
				</div>
				<div class="styTopSectionLine" style="width:187mm;">
					<div style="float:left;clear:none;">
						<span class="styTopSectionLineLbl">Entity EIN:</span>
					</div>
					<div style="float:left;clear:none;">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/EntityEIN"/>
						</xsl:call-template>
					</div>
				</div>
				<br />
				<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:110mm;">Elect Under Regulations Section 1.1411 Text</th>
							<th class="styDepTblCell" scope="col" style="width:52mm;">Business name</th>
							<th class="styDepTblCell" scope="col" style="width:25mm;">EIN or Foreign Entity Identification</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$DependencyData/Frm5227Elect1141110gFlowGrp">
							<tr>
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<td class="styDepTblCell" style="text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ElectUnderRegsSect11411Txt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="BusinessName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</td>
								<td class="styDepTblCell" style="text-align:center;word-break:break-all;">
									<xsl:choose>
										<xsl:when test="ForeignEntityIdentificationGrp">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>