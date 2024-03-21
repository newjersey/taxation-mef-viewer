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
	<xsl:include href="IRS1099MISCStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1099MISC" />
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
				<meta name="Description" content="IRS Form 1099-MISC" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1099MISCStyle" />
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
								<xsl:with-param name="BackupName">F1099MISCCorrectedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						CORRECTED (if checked)
					</div>
					<xsl:variable name="StateCount" select="count($FormData/Form1099MISCStateLocalTaxGrp)"/>
					<xsl:variable name="SepStateLocal" select="$StateCount &gt; 1"/>
					<!-- Left side -->
					<div class="styGenericDiv" style="width:87mm;border-right:1px solid black;">
						<div class="sty1099MISCLeftCell" style="min-height:40.6mm;border-top:1px solid black;">
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
						<div class="sty1099MISCLeftCell" style="width:50%;height:14.8mm;">
							PAYER'S TIN<br /><br />
							<span style="width:12mm;height:1mm;"/>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/PayerEIN"/>
							</xsl:call-template>
						</div>
						<div class="sty1099MISCLeftCell" style="width:50%;height:14.8mm;">
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
						<div class="sty1099MISCLeftCell" style="height:12mm;">
							RECIPIENT'S name<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RecipientNm"/>
							</xsl:call-template>
						</div>
						<div class="sty1099MISCLeftCell" style="height:12mm;">
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
						<div class="sty1099MISCLeftCell" style="height:12mm;">
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
							<div class="sty1099MISCNumberedBox" style="height:15mm;line-height:1.5;border-top:1px solid black;">
								<div class="sty1099MISCLeftNumBoxSD">1</div>
								Rents <br /><br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RentAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099MISCNumberedBox" style="height:15mm;line-height:1.5;">
								<div class="sty1099MISCLeftNumBoxSD">2</div>
								Royalties <br /><br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RoyaltyAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:30mm;">
							<div class="sty1099MISCNumberedBox" style="text-align:center;height:21mm;width:30mm;border-top-width:1px;">
								OMB No. 1545-0115<br />
								Form <span style="font-weight:bold;font-family:Arial;font-size:12pt;margin-top:10px;margin-bottom:10px;">1099-MISC</span><br />
								(Rev. January 2022)
							</div>
							<div class="sty1099MISCNumberedBox" style="text-align:center;height:9mm;width:30mm;line-height:1.2;">
								For calendar year<br />
								<span style="border-bottom:1px solid black;width:12mm;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/CalendarYr"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="sty1099MISCRightCell" style="width:34mm;height:30mm;font-size:10pt;font-weight:bold;border-bottom:1px solid black;"><br /><br />
							Miscellaneous Information
						</div>
						<!-- Cols 2 and 3 -->
						<div class="styGenericDiv" style="width:72mm;">
							<!-- Line 3 4 -->
							<div class="sty1099MISCNumberedBox" style="height:10.6mm;line-height:1.3;padding-top:1mm;">
								<div class="sty1099MISCLeftNumBoxSD">3</div>
								Other income <br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099MISCNumberedBox" style="border:2px solid black;height:10.6mm;line-height:1.3;">
								<div class="sty1099MISCLeftNumBoxSD" style="float:left;">4</div>
								<span style="font-family:Arial Narrow;font-weight:bold;float:left;">Federal income tax withheld</span> <br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Lines 5 6 -->
							<div class="sty1099MISCNumberedBox" style="height:14.8mm;line-height:1.5;">
								<div class="sty1099MISCLeftNumBoxSD">5</div>
								Fishing boat proceeds <br /><br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FishingBoatProceedsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099MISCNumberedBox" style="height:14.8mm;line-height:1.5;">
								<div class="sty1099MISCLeftNumBoxSD" style="float:left;">6</div>
								<span style="font-family:Arial;float:left;width:30mm;">Medical and health care payments </span><br /><br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MedicalHealthCarePaymentsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 7 8 -->
							<div class="sty1099MISCNumberedBox" style="height:12mm;line-height:1;">
								<div class="sty1099MISCLeftNumBoxSD" style="width:3.5mm;padding-left:0px;float:left;">7</div>
								<span style="width:31mm;float:left;font-family:Arial;">
									Payer made direct sales totalling $5,000 or more of consumer products to recipient for resale
								</span> 
								<span style="float:right;margin-top:-10px;margin-right:4px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Direct Sale Above Threshold Ind">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DirectSaleAboveThresholdInd"/>
											<xsl:with-param name="BackupName">F1099MISCDirectSaleAboveThresholdInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1099MISCNumberedBox" style="height:12mm;">
								<div class="sty1099MISCLeftNumBoxSD" style="width:3.5mm;padding-left:0px;float:left;">8</div>
								<span style="font-family:Arial;width:31mm;float:left;">Substitute payments in lieu of dividends or interest</span> <br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SubstitutePaymentsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 9 10 -->
							<div class="sty1099MISCNumberedBox" style="height:12mm;">
								<div class="sty1099MISCLeftNumBoxSD" style="width:4mm;">9</div>
								<span style="font-family:Arial;width:30mm;">Crop insurance proceeds</span> <br /><br /> 
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CropInsuranceProceedsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099MISCNumberedBox" style="height:12mm;">
								<div class="sty1099MISCLeftNumBox" style="width:4mm;float:left;">10</div>
								<span style="font-family:Arial;width:30mm;">Gross proceeds paid to an attorney</span> <br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AttorneyGrossProceedsPaidAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 11 12 -->
							<div class="sty1099MISCNumberedBox" style="height:12mm;">
								<div class="sty1099MISCLeftNumBox" style="width:4.5mm;">11</div>
								<span style="font-family:Arial;width:30mm;">Fish purchased for resale</span><br /><br /> 
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FishPurchasedForResaleAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099MISCNumberedBox" style="height:12mm;">
								<div class="sty1099MISCLeftNumBox">12</div>
								Section 409A deferrals <br /><br /> 
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Section409ADeferralsAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Copy info -->
						<div class="sty1099MISCRightCell">
							<span style="display:inline;font-weight:bold;font-size:9pt;">Copy B <br /> For Recipient</span>
							<br/><br /><br /><br />
							This is important tax information and is being furnished to the IRS. If you are required to file a return, 
							a negligence penalty or other sanction may be imposed on you if this income is taxable and the IRS 
							determines that it has not been reported.
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:87mm;">
							<div class="sty1099MISCLeftCell" style="min-height:8mm;height:10.5mm;width:75%;border-bottom-width:0px;">&nbsp;</div>
							<div class="sty1099MISCLeftCell" style="min-height:8mm;height:10.5mm;width:25%;border-bottom-width:0px;border-right-width:1px;">
								<div class="sty1099MISCLeftNumBox" style="float:left;">13</div>
								<span style="width:15mm;font-family:Arial;">FATCA filing requirement</span><br />
								<input type="checkbox" class="styCkboxNM" style="margin-top:0px;margin-left:10mm;" alt="FATCA Filing Requirement">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FATCAFilingRequirementInd"/>
										<xsl:with-param name="BackupName">F1099MISCFATCAFilingRequirementInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<div class="styGenericDiv" style="width:72mm;">
							<!-- Line 14 15 -->
							<div class="sty1099MISCNumberedBox" style="height:10.5mm;line-height:1.2;border-bottom-width:0px;">
								<div class="sty1099MISCLeftNumBox" style="float:left;">14</div>
								<span style="font-family:Arial;display:inline;width:30mm;float:left;">Excess golden parachute payments</span> <br /><br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExcessParachutePaymentAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099MISCNumberedBox" style="height:10.5mm;line-height:1.2;border-bottom-width:0px;">
								<div class="sty1099MISCLeftNumBox" style="float:left;">15</div>
								<span style="font-family:Arial;width:30mm;float:left;">Nonqualifed deferred compensation</span> <br />
								$ 
								<span class="sty1099MISCAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonqlfyDeferredCompensationAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!-- Line 16 17 18 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:87mm;">
							<div class="sty1099MISCLeftCell" style="min-height:13.5mm;border-bottom-width:0px;border-right-width:1px;">
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
							<div class="sty1099MISCLeftCell" style="min-height:8.5mm;width:31%;border-bottom-style:dashed;border-left-width:0px;line-height:1.4;">
								<div class="sty1099MISCLeftNumBox">16</div>
								State tax withheld <br />
								$ 
								<span class="sty1099MISCAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">See Additional Data</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099MISCStateLocalTaxGrp/StateTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="sty1099MISCLeftCell" style="min-height:8.5mm;width:38%;border-bottom-style:dashed;font-family:Arial;line-height:1.4;">
								<div class="sty1099MISCLeftNumBox" style="font-family:Verdana;">17</div>
								State/Payer's state no. <br />
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099MISCStateLocalTaxGrp/StateAbbreviationCd"/>
										</xsl:call-template>
										/ 
										<span style="display:inline;">
											<xsl:if test="string-length($FormData/Form1099MISCStateLocalTaxGrp/StateIdNum) &gt; 20"><xsl:attribute name="style">display:inline;font-family:Arial Narrow;</xsl:attribute></xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099MISCStateLocalTaxGrp/StateIdNum"/>
											</xsl:call-template>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099MISCLeftCell" style="min-height:8.5mm;width:31%;border-bottom-style:dashed;line-height:1.4;">
								<div class="sty1099MISCLeftNumBox">18</div>
								State income <br />
								$ 
								<span class="sty1099MISCAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099MISCStateLocalTaxGrp/StateIncomeAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="sty1099MISCLeftCell" style="min-height:5mm;width:31%;border-left-width:0px;border-bottom-width:0px;">
								$ 
								<span class="sty1099MISCAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099MISCStateLocalTaxGrp/LocalTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="sty1099MISCLeftCell" style="min-height:5mm;width:38%;font-family:Arial;border-bottom-width:0px;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099MISCStateLocalTaxGrp/LocalityNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099MISCLeftCell" style="min-height:5mm;width:31%;border-bottom-width:0px;">
								$ 
								<span class="sty1099MISCAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099MISCStateLocalTaxGrp/LocalIncomeAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						Form <span style="font-weight:bold;font-size:9pt;">1099-MISC</span> (Rev. 1-2022)
						<span style="margin-left:5mm;">(Keep for your records)</span>
						<span style="margin-left:5mm;">www.irs.gov/Form1099MISC</span>
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
						<span class="styRepeatingDataTitle">Lines 16-18 - State and Local Tax Withheld</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<strong>16</strong> State tax withheld
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;">
										<strong>17</strong> State/Payer's state no.
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<strong>18</strong> State income
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										Local tax withheld
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										Locality name
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										Local income
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Form1099MISCStateLocalTaxGrp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
											</xsl:call-template>
											 / 
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StateIdNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="StateIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LocalTaxWithheldAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LocalityNm"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LocalIncomeAmt"/>
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
