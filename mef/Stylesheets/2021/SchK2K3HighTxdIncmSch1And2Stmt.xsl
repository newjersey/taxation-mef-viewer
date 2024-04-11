<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/SchK2K3HighTxdIncmSch1And2Stmt"/>
	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		
		<!--Added Header Elements start here-->
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Partnership or Corporation EIN:
			</div>
			<div class="styExplanationLine" style="float:left">
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
			<div class="styExplanationLine" style="float:left">
				<xsl:choose>
				<xsl:when test="$DependencyData/PartnershipName">
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/PartnershipName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/CorporationName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			</div>
		</div>
		
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Partner or Shareholder TIN:
			</div>
			<div class="styExplanationLine" style="float:left">
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
				<xsl:when test="$DependencyData/ShareholderSSN">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderSSN"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>	
			</div>
		</div>
		
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Name of Partner or Shareholder:
			</div>
			<div class="styExplanationLine" style="float:left">
			<xsl:choose>
				<xsl:when test="$DependencyData/PartnerName">
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/PartnerName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				</xsl:when>
				<xsl:when test="$DependencyData/PartnerPersonNm">
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/PartnerPersonNm"/>
				</xsl:call-template>
				</xsl:when>
				<xsl:when test="$DependencyData/ShareholderName">
					<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/ShareholderName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				</xsl:when>
				<xsl:when test="$DependencyData/ShareholderPersonNm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderPersonNm"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
			</div>
	
		</div>
		
		<!--End of header-->

		<!-- code for first table -->
		<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
			<thead class="styTableThead">
				<caption class="styDepTblCell" style="text-align:left;">Schedule 1 </caption>
				<caption class="styDepTblCell" style="text-align:left;">Reference: Regulations section 1.904-4(c)(3) </caption>
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:5mm;"/>
					<th class="styDepTblCell" scope="col" style="width:40mm;"/>
					<th class="styDepTblCell" scope="col" style="width:40mm;">I. Passive Income Net of Allocable Expenses</th>
					<th class="styDepTblCell" scope="col" style="width:40mm;">II. Taxes</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<!-- code for first row group -->
					<td class="styDepTblCell" style="text-align:left;">A</td>
					<td class="styDepTblCell" style="text-align:left;">Passive income subject to withholding tax of 15% or more
					</td>
					<!-- code for third column, first row -->
					<td class="styDepTblCell" style="text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/HighTaxedIncomeSch1Grp/PassiveIncmWH15PctOrMoreGrp/PssvIncmNetAllcblExpnssAmt"/>
						</xsl:call-template>
					</td>
					<!-- code for first row, fourth column -->
					<td class="styDepTblCell" style="text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/HighTaxedIncomeSch1Grp/PassiveIncmWH15PctOrMoreGrp/TaxesAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<!-- code second column, second row -->
					<td class="styDepTblCell" style="text-align:left;">B</td>
					<td class="styDepTblCell" style="text-align:left;">Passive income subject to withholding tax of less than 15% but greater than zero
					</td>
					<!-- code for second column, second row -->
					<td class="styDepTblCell" style="text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/HighTaxedIncomeSch1Grp/PassiveIncmWHLessThan15PctGrp/PssvIncmNetAllcblExpnssAmt"/>
						</xsl:call-template>
					</td>
					<!-- code for third column, second row -->
					<td class="styDepTblCell" style="text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/HighTaxedIncomeSch1Grp/PassiveIncmWHLessThan15PctGrp/TaxesAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<!-- code for third row -->
					<td class="styDepTblCell" style="text-align:left;">C</td>
					<td class="styDepTblCell" style="text-align:left;">Passive income not subject to any foreign tax
					</td>
					<td class="styDepTblCell" style="text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/HighTaxedIncomeSch1Grp/PassiveIncmNotSubjFrgnTaxGrp/PssvIncmNetAllcblExpnssAmt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/HighTaxedIncomeSch1Grp/PassiveIncmNotSubjFrgnTaxGrp/TaxesAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<!-- code for fourth row -->
					<td class="styDepTblCell" style="text-align:left;">D</td>
					<td class="styDepTblCell" style="text-align:left;">Passive income subject to no withholding tax, but subject to other foreign tax
					</td>
					<td class="styDepTblCell" style="text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/HighTaxedIncomeSch1Grp/PassiveIncmNoWHOthFrgnTaxGrp/PssvIncmNetAllcblExpnssAmt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/HighTaxedIncomeSch1Grp/PassiveIncmNoWHOthFrgnTaxGrp/TaxesAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<!--</xsl:for-each>-->
			</tbody>
		</table>
<br></br>
		
		<!--<code for second table >-->
		<xsl:for-each select="$DependencyData/HighTaxedIncomeSch2Grp">
			<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
				<thead class="styTableThead">
					<caption class="styDepTblCell" style="text-align:left;">Schedule 2 </caption>
					<caption class="styDepTblCell" style="text-align:left;">Reference: Regulations section 1.904-4(c)(4) </caption>
						<th class="styDepTblCell" scope="col" style="width:5mm; font-weight:normal ">A</th>
						<th class="styDepTblCell" scope="col" style="width:40mm; font-weight:normal; text-align:left">Name of foreign QBU</th>
						<th colspan="2" class="styDepTblCell" scope="col" style="width:40mm; font-weight:normal; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignQBUName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="ForeignQBUName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignQBUName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</th>
				</thead>
				<tbody>
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!-- code for first row group -->
						<tr class="styDepTblHdr" >
						<td class="styDepTblCell" style="text-align:left;"/>
						<td class="styDepTblCell" style="text-align:left;">(Complete a separate Schedule 2 for each foreign QBU)
						</td>
						<!-- code for third column, first row -->
						<td class="styDepTblCell" style="text-align:center;">I. Passive Income Net of Allocable Expenses
						</td>
						<!-- code for first row, fourth column -->
						<td class="styDepTblCell" style="text-align:center;">II. Taxes
						</td>
						</tr>
					</tr>
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!-- code second column, second row -->
						<td class="styDepTblCell" style="text-align:left;">B</td>
						<td class="styDepTblCell" style="text-align:left;">Passive income subject to withholding tax of 15% or more
						</td>
						<!-- code for second column, second row -->
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PassiveIncmWH15PctOrMoreGrp/PssvIncmNetAllcblExpnssAmt"/>
							</xsl:call-template>
						</td>
						<!-- code for third column, second row -->
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PassiveIncmWH15PctOrMoreGrp/TaxesAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!-- code for third row -->
						<td class="styDepTblCell" style="text-align:left;">C</td>
						<td class="styDepTblCell" style="text-align:left;">Passive income subject to withholding tax of less than 15% but greater than zero
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PassiveIncmWHLessThan15PctGrp/PssvIncmNetAllcblExpnssAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PassiveIncmWHLessThan15PctGrp/TaxesAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!-- code for fourth row -->
						<td class="styDepTblCell" style="text-align:left;">D</td>
						<td class="styDepTblCell" style="text-align:left;">Passive income not subject to any foreign tax
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PassiveIncmNotSubjFrgnTaxGrp/PssvIncmNetAllcblExpnssAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PassiveIncmNotSubjFrgnTaxGrp/TaxesAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- code for fifth row -->
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;">E</td>
						<td class="styDepTblCell" style="text-align:left;">Passive income subject to no withholding tax, but subject to other foreign tax
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PassiveIncmNoWHOthFrgnTaxGrp/PssvIncmNetAllcblExpnssAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PassiveIncmNoWHOthFrgnTaxGrp/TaxesAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
			<br></br>
		</xsl:for-each>
		
		
	</xsl:template>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
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
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''"> -->
					<xsl:call-template name="AddOnStyle"/>
					<!-- </xsl:if> -->
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="ShowDependencyData"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
