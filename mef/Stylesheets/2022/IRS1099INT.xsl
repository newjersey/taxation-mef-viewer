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
	<xsl:include href="IRS1099INTStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1099INT" />
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
				<meta name="Description" content="IRS Form 1099-INT" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1099INTStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1099DINT">
					<xsl:call-template name="DocumentHeader" />
					<div class="styStdDiv" style="padding:2px;text-align:center;font-size:9pt;">
						<input type="checkbox" class="styCkboxNM" style="" alt="Corrected Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
								<xsl:with-param name="BackupName">F1099INTCorrectedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						CORRECTED (if checked)
					</div>
					<xsl:variable name="StateCount" select="count($FormData/Form1099INTStateLocalTaxGrp)"/>
					<xsl:variable name="SepStateLocal" select="$StateCount &gt; 1"/>
					<!-- Left side -->
					<div class="styGenericDiv" style="width:87mm;border-right:1px solid black;">
						<div class="sty1099INTLeftCell" style="min-height:40.6mm;border-top:1px solid black;">
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
						<div class="sty1099INTLeftCell" style="width:50%;height:14.8mm;">
							PAYER'S TIN<br /><br />
							<span style="width:12mm;height:1mm;"/>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/PayerEIN"/>
							</xsl:call-template>
						</div>
						<div class="sty1099INTLeftCell" style="width:50%;height:14.8mm;">
							RECIPIENT'S TIN<br /><br />
							<span style="width:12mm;height:1mm;"/>
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
						</div>
						<div class="sty1099INTLeftCell" style="height:12mm;">
							RECIPIENT'S name<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RecipientNm"/>
							</xsl:call-template>
						</div>
						<div class="sty1099INTLeftCell" style="height:12mm;">
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
						<div class="sty1099INTLeftCell" style="height:12mm;">
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
						<div class="sty1099INTLeftCell" style="min-height:8mm;height:12mm;width:80%;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1099INTLeftCell" style="min-height:8mm;height:12mm;width:20%;border-bottom-width:0px;padding-left:4px;">
							<span style="width:15mm;font-family:Arial;">FATCA filing requirement</span><br />
							<input type="checkbox" class="styCkboxNM" style="margin-top:4px;margin-left:5mm;" alt="FATCA Filing Requirement">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FATCAFilingRequirementInd"/>
									<xsl:with-param name="BackupName">F1099INTFATCAFilingRequirementInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Right side -->
					<div class="styGenericDiv" style="width:100mm;">
						<div class="styGenericDiv" style="width:36mm;">
							<div class="sty1099INTNumberedBox" style="height:13mm;border-top-width:1px;line-height:1.5;">
								&nbsp;
								<span style="font-family:Arial;width:30mm;">Payer's RTN (optional)</span> <br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PayerRoutingTransitNum"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099INTNumberedBox" style="height:13mm;line-height:1.5;">
								<div class="sty1099INTLeftNumBoxSD">1</div>
								Interest income <br /><br />
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:30mm;">
							<div class="sty1099INTNumberedBox" style="text-align:center;height:18mm;width:30mm;border-top-width:1px;">
								OMB No. 1545-0112<br />
								Form <span style="font-weight:bold;font-family:Arial;font-size:12pt;margin-top:6px;margin-bottom:6px;">1099-INT</span><br />
								(Rev. January 2022)
							</div>
							<div class="sty1099INTNumberedBox" style="text-align:center;height:8mm;width:30mm;line-height:1.2;">
								For calendar year<br />
								<span style="border-bottom:1px solid black;width:12mm;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/CalendarYr"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="sty1099INTRightCell" style="width:34mm;height:26mm;font-size:14pt;font-weight:bold;border-bottom:1px solid black;"><br />
							Interest Income
						</div>
						<!-- Cols 2 and 3 -->
						<div class="styGenericDiv" style="width:72mm;">
							<!-- Line 3 4 -->
							<div class="sty1099INTNumberedBox" style="width:100%;height:13mm;line-height:1.5;">
								<div class="sty1099INTLeftNumBoxSD">2</div>
								Early withdrawal penalty <br /><br />
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EarlyWithdrawalPenaltyAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 3 -->
							<div class="sty1099INTNumberedBox" style="width:100%;height:13mm;line-height:1.5;">
								<div class="sty1099INTLeftNumBoxSD" style="float:left;">3</div>
								<span style="font-family:Arial;float:left;">Interest on U.S. Savings Bonds and Treasury obligations </span><br /><br />
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/USSavingsBondsTreasObligIntAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 4 5 -->
							<div class="sty1099INTNumberedBox" style="border:2px solid black;height:8.5mm;line-height:1.3;">
								<div class="sty1099INTLeftNumBoxSD" style="float:left;">4</div>
								<span style="font-family:Arial Narrow;font-weight:bold;float:left;">Federal income tax withheld</span> <br />
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099INTNumberedBox" style="height:8.5mm;line-height:1.3;padding-top:1mm;">
								<div class="sty1099INTLeftNumBoxSD">5</div>
								Investment expenses <br />
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/InvestmentExpenseAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 6 7 -->
							<div class="sty1099INTNumberedBox" style="">
								<div class="sty1099INTLeftNumBoxSD">6</div>
								Foreign tax paid <br />
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxesPaidAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099INTNumberedBox" style="">
								<div class="sty1099INTLeftNumBoxSD" style="width:2.5mm;padding-left:0px;float:left;">7</div>
								<span style="font-family:Arial Narrow;width:32mm;float:left;">Foreign country or U.S. possession</span> <br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryOrUSPossessionCd"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 8 9 -->
							<div class="sty1099INTNumberedBox" style="height:12mm;">
								<div class="sty1099INTLeftNumBoxSD" style="width:4mm;">8</div>
								Tax-exempt interest <br /><br /> 
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099INTNumberedBox" style="height:12mm;">
								<div class="sty1099INTLeftNumBoxSD" style="width:4mm;float:left;">9</div>
								<span style="font-family:Arial;width:30mm;">Specified private activity bond interest</span> <br />
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SpcfdPrvtActyBondInterestAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 10 11 -->
							<div class="sty1099INTNumberedBox" style="height:12mm;">
								<div class="sty1099INTLeftNumBox">10</div>
								Market discount <br /><br /> 
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MarketDiscountAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099INTNumberedBox" style="height:12mm;">
								<div class="sty1099INTLeftNumBox">11</div>
								Bond premium <br /><br /> 
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BondPremiumAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 12 13 -->
							<div class="sty1099INTNumberedBox" style="padding-right:0px;height:10mm;line-height:1.7;border-bottom-width:0px;">
								<div class="sty1099INTLeftNumBox" style="width:3.5mm;padding-left:0px;float:left;font-family:Arial;">12</div>
								<span style="font-family:Arial Narrow;width:31.3mm;float:left;font-size:6pt;">Bond premium on Treasury obligations</span> <br />
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TreasuryObligBondPremiumAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099INTNumberedBox" style="padding-right:0px;height:10mm;line-height:1.7;border-bottom-width:0px;">
								<div class="sty1099INTLeftNumBox" style="width:3mm;padding-left:0px;float:left;font-family:Arial;">13</div>
								<span style="font-family:Arial Narrow;width:32mm;float:left;">Bond premium on tax-exempt bond</span> <br />
								$ 
								<span class="sty1099INTAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondPremiumAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Copy info -->
						<div class="sty1099INTRightCell">
							<span style="display:inline;font-weight:bold;font-size:9pt;">Copy B <br /><br /> For Recipient</span>
							<br/><br /><br/><br/>
							This is important tax information and is being furnished to the IRS. If you are required to file a return, 
							a negligence penalty or other sanction may be imposed on you if this income is taxable and the IRS 
							determines that it has not been reported.
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:69.6mm;">
							<div class="sty1099INTLeftCell" style="min-height:11.5mm;border-bottom-width:0px;border-right-width:1px;">
								<span style="display:inline;font-family:Arial;">Account number (see instructions)</span><br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RecipientAccountNum"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Line 14 -->
						<div class="sty1099INTNumberedBox" style="padding-right:0px;height:11.5mm;line-height:1.4;border-bottom-width:0px;">
							<div class="sty1099INTLeftNumBox" style="float:left;">14</div>
							<span style="font-family:Arial;width:31.3mm;float:left;margin-left:1px;">Tax-exempt and tax credit bond CUSIP no.</span> <br />
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptTaxCreditBondCUSIPNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv" style="width:81mm;">
							<!-- Line 15 16 17 -->
							<div class="sty1099INTLeftCell" style="min-height:7.5mm;width:17mm;border-bottom-style:dashed;border-left-width:0px;">
								<div class="sty1099INTLeftNumBox">15</div>
								State <br />
								<xsl:choose>
									<xsl:when test="$SepStateLocal">See Addn'l Data</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099INTStateLocalTaxGrp/StateAbbreviationCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099INTLeftCell" style="min-height:7.5mm;width:33mm;border-bottom-style:dashed;font-family:Arial Narrow;">
								<div class="sty1099INTLeftNumBox" style="font-family:Verdana;">16</div>
								State identification no. <br />
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099INTStateLocalTaxGrp/StateIdNum"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099INTLeftCell" style="min-height:7.5mm;width:31mm;border-bottom-style:dashed;">
								<div class="sty1099INTLeftNumBox">17</div>
								State tax withheld <br />
								$ 
								<span class="sty1099INTAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099INTStateLocalTaxGrp/StateTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="sty1099INTLeftCell" style="min-height:4mm;width:17mm;border-bottom-width:0px;border-left-width:0px;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099INTStateLocalTaxGrp/LocalAbbreviationCdTxt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099INTLeftCell" style="min-height:4mm;width:33mm;border-bottom-width:0px;font-family:Arial;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099INTStateLocalTaxGrp/LocalityNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099INTLeftCell" style="min-height:4mm;width:31mm;border-bottom-width:0px;">
								$ 
								<span class="sty1099INTAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099INTStateLocalTaxGrp/LocalTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						Form <span style="font-weight:bold;font-size:9pt;">1099-INT</span> (Rev. 1-2022)
						<span style="margin-left:5mm;">(Keep for your records)</span>
						<span style="margin-left:5mm;">www.irs.gov/Form1099INT</span>
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
						<span class="styRepeatingDataTitle">Lines 15-17 - State and Local Tax Withheld</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>15</strong> State
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>16</strong> State identification no.
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										<strong>17</strong> State tax withheld
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
								<xsl:for-each select="$FormData/Form1099INTStateLocalTaxGrp">
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
