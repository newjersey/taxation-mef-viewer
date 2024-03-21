<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1099DIVStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1099DIV" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 1099-DIV" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1099DIVStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1099DIV">
					<xsl:call-template name="DocumentHeader" />
					<div class="styStdDiv" style="padding:2px;text-align:center;font-size:9pt;">
						<input type="checkbox" class="styCkboxNM" style="" alt="Corrected Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
								<xsl:with-param name="BackupName">F1099DIVCorrectedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						CORRECTED (if checked)
					</div>
					<xsl:variable name="StateCount" select="count($FormData/Form1099DIVStateLocalTaxGrp)"/>
					<xsl:variable name="SepStateLocal" select="$StateCount &gt; 1"/>
					<!-- Left side -->
					<div class="styGenericDiv" style="width:87mm;border-right:1px solid black;">
						<div class="sty1099DIVLeftCell" style="min-height:37.8mm;border-top:1px solid black;">
							PAYER'S name, street address, city or town, state or province, country, ZIP or foreign postal code, and telephone no.<br /><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PayerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/PayerName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PayerName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/PayerNameControlTxt"/>
								<xsl:with-param name="Desc">Payer Info - Payer Name Control</xsl:with-param>
							</xsl:call-template>
							<br />
							<xsl:choose>
								<xsl:when test="$FormData/PayerForeignAddress">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/PayerForeignAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/PayerUSAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<br />
							<xsl:choose>
								<xsl:when test="$FormData/ForeignPhoneNum">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignPhoneNum"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/PhoneNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="sty1099DIVLeftCell" style="width:50%;height:14.8mm;">
							PAYER'S TIN<br /><br />
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/PayerEIN"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1099DIVLeftCell" style="width:50%;height:14.8mm;">
							RECIPIENT'S TIN<br /><br />
							<span style="width:100%;text-align:center;">
								<xsl:choose>
									<xsl:when test="$FormData/RecipientSSN">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/RecipientSSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$FormData/RecipientEIN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="sty1099DIVLeftCell" style="height:12mm;">
							RECIPIENT'S name<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RecipientNm"/>
							</xsl:call-template>
						</div>
						<div class="sty1099DIVLeftCell" style="height:12mm;">
							Street address (including apt. no.)<br />
							<xsl:choose>
								<xsl:when test="$FormData/RecipientForeignAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RecipientForeignAddress/AddressLine1Txt"/>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RecipientForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RecipientUSAddress/AddressLine1Txt"/>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RecipientUSAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="sty1099DIVLeftCell" style="height:12mm;">
							<span style="display:inline;font-family:Arial;">City or town, state or province, country, and ZIP or foreign postal code</span><br />
							<xsl:call-template name="PopulateCityStateInfo">
								<xsl:with-param name="TargetNode" select="$FormData/RecipientUSAddress"/>
								<xsl:with-param name="ForeignAddressTargetNode" select="$FormData/RecipientForeignAddress"/>
							</xsl:call-template>
							<span style="width:7px;height:1px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RecipientForeignAddress/CountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Right side -->
					<div class="styGenericDiv" style="width:100mm;">
						<div class="styGenericDiv" style="width:36mm;">
							<div class="sty1099DIVNumberedBox" style="height:12.5mm;border-top-width:1px;">
								<div class="sty1099DIVLeftNumBoxSD">1a</div>
								<span style="font-family:Arial;display:inline;">Total ordinary dividends</span> <br /><br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryDividendsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099DIVNumberedBox" style="height:12.5mm;">
								<div class="sty1099DIVLeftNumBoxSD">1b</div>
								Qualified dividends <br /><br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:30mm;">
							<div class="sty1099DIVNumberedBox" style="text-align:center;height:17mm;width:30mm;border-top-width:1px;">
								OMB No. 1545-0110<br />
								Form <span style="font-weight:bold;font-size:10pt;margin-top:4px;margin-bottom:4px;">1099-DIV</span><br />
								(Rev. January 2022)
							</div>
							<div class="sty1099DIVNumberedBox" style="text-align:center;height:8mm;width:30mm;line-height:1.2;">
								For calendar year<br />
								<span style="border-bottom:1px solid black;width:12mm;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/CalendarYr"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="sty1099DIVRightCell" style="width:34mm;height:25mm;font-size:10pt;font-weight:bold;border-bottom:1px solid black;"><br />
							Dividends and Distributions
						</div>
						<!-- Cols 2 and 3 -->
						<div class="styGenericDiv" style="width:72mm;">
							<!-- Lines 2a 2b -->
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBoxSD">2a</div>
								Total capital gain distr. <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalDistributionsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBoxSD">2b</div>
								<span style="font-family:Arial;display:inline;">Unrecap. Sec. 1250 gain</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250GainAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Lines 2c 2d -->
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBoxSD">2c</div>
								Section 1202 gain <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CapitalGainSect1202Amt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBoxSD">2d</div>
								Collectibles (28%) gain <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Collectibles28PercentGainAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 2e 2f -->
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBoxSD">2e </div>
								<span style="font-family:Arial Narrow;display:inline;">Section 897 ordinary dividends</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Section897OrdinaryDividendsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBoxSD">2f </div>
								<span style="font-family:Arial;display:inline;">Section 897 capital gain</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Section897CapitalGainAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 3 4 -->
							<div class="sty1099DIVNumberedBox" style="height:8.5mm;line-height:1.3;">
								<div class="sty1099DIVLeftNumBoxSD">3 </div>
								<span style="font-family:Arial;display:inline;">Nondividend distributions</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NondividendDistributionsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099DIVNumberedBox" style="border:2px solid black;height:8.5mm;line-height:1.3;">
								<div class="sty1099DIVLeftNumBoxSD" style="float:left;">4</div>
								<span style="font-family:Arial Narrow;font-weight:bold;float:left;">Federal income tax withheld</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 4 5 -->
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBoxSD">5 </div>
								<span style="font-family:Arial;display:inline;">Section 199A dividends</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Section199ADividendsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBoxSD">6 </div>
								<span style="font-family:Arial;display:inline;">Investment expenses</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/InvestmentExpenseAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 7 8 -->
							<div class="sty1099DIVNumberedBox" style="height:10mm;line-height:1;">
								<div class="sty1099DIVLeftNumBoxSD">7</div>
								<span style="font-family:Arial;display:inline;">Foreign tax paid</span> <br /><br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxesPaidAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099DIVNumberedBox" style="height:10mm;line-height:1;">
								<div class="sty1099DIVLeftNumBoxSD" style="width:3mm;">8</div>
								<span style="font-family:Arial Narrow;display:inline;">Foreign country or U.S. possession</span> <br /><br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryOrUSPossessionCd"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 9 10 -->
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBoxSD" style="width:4mm;">9</div>
								<span style="font-family:Arial Narrow;display:inline;">Cash liquidation distributions</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CashLiquidationDistriAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099DIVNumberedBox">
								<div class="sty1099DIVLeftNumBox" style="width:5mm;">10</div>
								<span style="font-family:Arial Narrow;display:inline;">Noncash liquidation distributions</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NoncashLiquidationDistriAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Copy info -->
						<div class="sty1099DIVRightCell">
							<br/><br />
							<span style="display:inline;font-weight:bold;font-size:9pt;">Copy B <br /> For Recipient</span>
							<br/><br /><br/>
							This is important tax information and is being furnished to the IRS. If you are required to file a return, 
							a negligence penalty or other sanction may be imposed on you if this income is taxable and the IRS 
							determines that it has not been reported.
						</div>
					</div>
					<!-- Line 11 12 13 -->
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:87mm;">
							<div class="sty1099DIVLeftCell" style="min-height:8mm;height:10.5mm;width:75%;border-bottom-width:0px;">&nbsp;</div>
							<div class="sty1099DIVLeftCell" style="min-height:8mm;height:10.5mm;width:25%;border-bottom-width:0px;border-right-width:1px;">
								<div class="sty1099DIVLeftNumBox" style="float:left;">11</div>
								<span style="width:15mm;font-family:Arial;">FATCA filing requirement</span><br />
								<input type="checkbox" class="styCkboxNM" style="margin-top:0px;margin-left:10mm;" alt="FATCA Filing Requirement">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FATCAFilingRequirementInd"/>
										<xsl:with-param name="BackupName">F1099DIVFATCAFilingRequirementInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<div class="styGenericDiv" style="width:72mm;">
							<!-- Line 12 13 -->
							<div class="sty1099DIVNumberedBox" style="height:10.5mm;line-height:1.2;border-bottom-width:0px;">
								<div class="sty1099DIVLeftNumBox">12</div>
								<span style="font-family:Arial;display:inline;">Exempt-interest dividends</span> <br /><br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExemptInterestDividendsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099DIVNumberedBox" style="height:10.5mm;line-height:1.2;border-bottom-width:0px;">
								<div class="sty1099DIVLeftNumBox" style="float:left;">13</div>
								<span style="font-family:Arial;width:30mm;float:left;">Specified private activity bond interest dividends</span> <br />
								$ 
								<span class="sty1099DIVAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PrivateActivityBondIntDivAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- Line 14 15 16 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:87mm;">
							<div class="sty1099DIVLeftCell" style="min-height:11.5mm;border-bottom-width:0px;border-right-width:1px;">
								<span style="display:inline;font-family:Arial;">Account number (see instructions)</span><br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RecipientAccountNum"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:100mm;">
							<!-- Line 14 15 16 -->
							<div class="sty1099DIVLeftCell" style="min-height:7.5mm;width:30%;border-bottom-style:dashed;border-left-width:0px;">
								<div class="sty1099DIVLeftNumBox">14</div>
								State <br />
								<xsl:choose>
									<xsl:when test="$SepStateLocal">See Addn'l Data</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099DIVStateLocalTaxGrp/StateAbbreviationCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099DIVLeftCell" style="min-height:7.5mm;width:35%;border-bottom-style:dashed;font-family:Arial Narrow;">
								<div class="sty1099DIVLeftNumBox" style="font-family:Verdana;">15</div>
								State identification no. <br />
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099DIVStateLocalTaxGrp/StateIdNum"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099DIVLeftCell" style="min-height:7.5mm;width:35%;border-bottom-style:dashed;">
								<div class="sty1099DIVLeftNumBox">16</div>
								State tax withheld <br />
								$ 
								<span class="sty1099DIVAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099DIVStateLocalTaxGrp/StateTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="sty1099DIVLeftCell" style="min-height:4mm;width:30%;border-bottom-width:0px;border-left-width:0px;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099DIVStateLocalTaxGrp/LocalAbbreviationCdTxt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099DIVLeftCell" style="min-height:4mm;width:35%;border-bottom-width:0px;font-family:Arial;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099DIVStateLocalTaxGrp/LocalityNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099DIVLeftCell" style="min-height:4mm;width:35%;border-bottom-width:0px;">
								$ 
								<span class="sty1099DIVAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099DIVStateLocalTaxGrp/LocalTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						Form <span style="font-weight:bold;font-size:9pt;">1099-DIV</span> (Rev. 1-2022)
						<span style="margin-left:5mm;">(Keep for your records)</span>
						<span style="margin-left:5mm;">www.irs.gov/Form1099DIV</span>
						<span style="float:right;font-family:Arial;padding-top:2px;">Department of the Treasury - Internal Revenue Service</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/PayerNameControlTxt"/>
							<xsl:with-param name="Desc">Payer Info - Payer Name Control</xsl:with-param>
						</xsl:call-template>
					</table>
					<xsl:if test="$SepStateLocal">
						<br /><br />
						<span class="styRepeatingDataTitle">Lines 14-16 - State and Local Tax Withheld</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>14</strong> State
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>15</strong> State identification no.
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										<strong>16</strong> State tax withheld
									</th>
									<th class="styDepTblCell" scope="col" style="width:23mm;font-weight:normal;">
										Local abbreviation code
									</th>
									<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;">
										Locality name
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										Local tax withheld
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Form1099DIVStateLocalTaxGrp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StateIdNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LocalAbbreviationCdTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LocalityNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LocalTaxWithheldAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
