<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Change this dependency name (ItemizedIncomeNotRecOnBooksSch)
           by your dependency name -->
	<xsl:param name="DependencyData" select="$RtnDoc/DefrdIntExpnsPriorYrDedStmt"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template  -->
	<xsl:template match="/">
		<html>
			<head>
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
				<meta name="Author" content="Trin Xue"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
<div class="styDepTitleLineLandscape">
<span class="styDepTitle">
<span style="width:135mm;">
<xsl:value-of select="$depDocTitle"/>
</span>
</span>
</div>
<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
<xsl:with-param name="TargetNode" select="$DependencyData"/>
</xsl:call-template>
<!-- TransformAdjustments to Shareholder's Equity Schedule  Schedule -->
<xsl:call-template name="DefrdIntExpnsPriorYrDedStmtTemp"/>
</body>
		</html>
	</xsl:template>
	<xsl:template name="DefrdIntExpnsPriorYrDedStmtTemp">
	<table id="VesselOrAircraftCharterOutStmtTbl" class="styDepTblLandscape">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="text-align:center;width:50mm ">Deferred Interest Expense Prior Year Deduction Amt</th>
					<th class="styDepTblCell" scope="col" style="text-align:center;width:50mm">IRC Provisions</th>
					<th class="styDepTblCell" scope="col" style="text-align:center;width:80mm">Explanation</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/DefrdIntExpnsPriorYrDedAmtGrp">
					<!-- set row background -->
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DefrdIntExpensePriorYrDedAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="IRCProvisionsTxt"/>
							</xsl:call-template>
						</td>
			<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
							</xsl:call-template>
						</td>			
					</tr>
				</xsl:for-each>
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					</tr>
			</tbody>
		</table>
		<br/>
		
		
		
		
		
		
		<!-- <tr>
         <td class="styDepTblCell" style="border:none;padding-left:0mm;padding-bottom:0mm;font-size:8pt">   
          <div class="styTopSectionLineLbl" style="font-size:10pt"><b>Explanation:</b></div>      
          </td>       
          <td class="styDepTblCell" style="text-align:left;border:none;padding-left:0mm;padding-bottom:0mm">   
                    <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$DependencyData/ExplanationTxt"/>
			</xsl:call-template>             
          </td>                      
        </tr>-->
	</xsl:template>
</xsl:stylesheet>
