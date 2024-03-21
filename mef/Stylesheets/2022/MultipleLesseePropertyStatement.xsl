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
	<xsl:param name="DependencyData" select="$RtnDoc/MultiLesseePropStmt"/>
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

<div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:105mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
<xsl:with-param name="TargetNode" select="$DependencyData"/>
</xsl:call-template>
<!-- TransformAdjustments to Shareholder's Equity Schedule  Schedule -->
<xsl:call-template name="MultiLesseePropStmtTempTemp"/>
</body>
		</html>
	</xsl:template>
	<xsl:template name="MultiLesseePropStmtTempTemp">
	<table id="VesselOrAircraftCharterOutStmtTbl" class="styDepTblLandscape">
			<thead class="styTableThead">
			
					<tr class="styDepTblHdr">
			      		<th class="styDepTblCell" scope="col" style="text-align:center">Name of lessor</th>
			     		<th class="styDepTblCell" scope="col" style="text-align:center">Lessor USA ddress</th>
			     		<th class="styDepTblCell" scope="col" style="text-align:center">Lessor Foreign Address</th>
				     	<th class="styDepTblCell" scope="col" style="text-align:center">Description of property</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">Amount Treated as Acquired Property</th>
					</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/MultipleLesseeProperty">
					<!-- set row background -->
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
							 <xsl:with-param name="TargetNode" select="LessorBusinessName"/>
							</xsl:call-template>
						</td>
			<td class="styDepTblCell" style="text-align:left;">
              <!--<xsl:choose>
                <xsl:when test="LessorUSAddress">-->
                  <xsl:call-template name="PopulateUSAddressTemplate">
                    <xsl:with-param name="TargetNode" select="LessorUSAddress"/>
                  </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:left;">
                <xsl:call-template name="PopulateForeignAddressTemplate">
                    <xsl:with-param name="TargetNode" select="LessorForeignAddress"/>
                  </xsl:call-template>
            </td>
   			<td class="styDepTblCell" style="text-align:center;font-size:8pt">
									<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PropertyDesc"/>
							</xsl:call-template>
						</td>
						 <td class="styDepTblCell" style="text-align:right;padding-top:8mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TreatedAsAcquiredPropertyAmt"/>
              </xsl:call-template>
            </td>
					</tr>
				</xsl:for-each>
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
