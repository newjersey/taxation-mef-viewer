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
	<xsl:include href="IRS1099KStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1099K" />
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
				<meta name="Description" content="IRS Form 1099-K" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1099KStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1099K">
					<xsl:call-template name="DocumentHeader" />
					<div class="styStdDiv" style="padding:2px;text-align:center;font-size:9pt;">
						<input type="checkbox" class="styCkboxNM" style="" alt="Corrected Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
								<xsl:with-param name="BackupName">F1099KCorrectedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						CORRECTED (if checked)
					</div>
					<xsl:variable name="StateCount" select="count($FormData/Form1099KStateLocalTaxGrp)"/>
					<xsl:variable name="SepStateLocal" select="$StateCount &gt; 1"/>
					<!-- Left side -->
					<div class="styGenericDiv" style="width:87mm;border-right:1px solid black;">
						<div class="sty1099KLeftCell" style="min-height:41.5mm;border-top:1px solid black;">
							FILER'S name, street address, city or town, state or province, country, ZIP or foreign postal code, and telephone no.<br /><br />
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
						<div class="sty1099KLeftCell" style="width:50%;height:15.5mm;font-family:Arial;">
							Check to indicate if FILER is a (an): 
							<br />
							<span style="width:100%;padding-left:1mm;padding-top:1mm;">
								Payment settlement entity (PSE)
								<span style="float:right;padding-right:2px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Payment settlement entity">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PSEInd"/>
											<xsl:with-param name="BackupName">F1099KPSEInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</span>
							<span style="width:100%;padding-left:1mm;">
								Electronic Payment Facilitator (EPF)/Other third party
								<span style="float:right;padding-right:2px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="electronic payment facilitator or other third party">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EPFOrOtherThirdPartyInd"/>
											<xsl:with-param name="BackupName">F1099KEPFOrOtherThirdPartyInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</span>
						</div>
						<div class="sty1099KLeftCell" style="width:50%;height:15.5mm;font-family:Arial;">
							Check to indicate transactions reported are: 
							<br />
							<span style="width:100%;padding-left:1mm;">
								Payment card
								<span style="float:right;padding-right:2px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Payment card">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PaymentCardInd"/>
											<xsl:with-param name="BackupName">F1099KPaymentCardInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</span>
							<span style="width:100%;padding-left:1mm;padding-top:1mm;">
								Third party network
								<span style="float:right;padding-right:2px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Third party network">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyNetworkInd"/>
											<xsl:with-param name="BackupName">F1099KThirdPartyNetworkInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</span>
						</div>
						<div class="sty1099KLeftCell" style="height:12mm;border-bottom-width:0px;">
							PAYEE'S name<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RecipientNm"/>
							</xsl:call-template>
						</div>
						<div class="sty1099KLeftCell" style="height:13mm;border-bottom-width:0px;">
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
						<div class="sty1099KLeftCell" style="height:12.5mm;">
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
						<div class="sty1099KLeftCell" style="height:13mm;border-bottom-width:0px;">
							PSE'S name and telephone number <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PSENm"/>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PSEPhoneNum"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Right side -->
					<div class="styGenericDiv" style="width:100mm;">
						<div class="styGenericDiv" style="width:36mm;">
							<div class="sty1099KNumberedBox" style="height:8.5mm;border-top-width:1px;">
								FILER'S TIN <br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/PayerEIN"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099KNumberedBox" style="height:8.5mm;">
								PAYEE'S TIN <br />
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
							<div class="sty1099KNumberedBox" style="height:12.5mm;line-height:1;">
								<div class="sty1099KLeftNumBox" style="float:left;">1a</div>
								<span style="float:left;width:30mm;font-family:Arial;">
									Gross amount of payment card/third party network transactions
								</span>								
								<br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/GrossAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:30mm;">
							<div class="sty1099KNumberedBox" style="text-align:center;height:21.5mm;width:30mm;border-top-width:1px;">
								OMB No. 1545-2205<br />
								Form <span style="font-weight:bold;font-size:12pt;margin-top:10px;margin-bottom:10px;">1099-K</span><br />
								(Rev. April 2022)
							</div>
							<div class="sty1099KNumberedBox" style="text-align:center;height:8mm;width:30mm;line-height:1.2;">
								For calendar year<br />
								<span style="border-bottom:1px solid black;width:12mm;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/CalendarYr"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="sty1099KRightCell" style="width:34mm;height:29.5mm;font-size:12pt;font-weight:bold;border-bottom:1px solid black;font-family:Arial;"><br />
							Payment Card and Third Party Network Transactions
						</div>
						<!-- Cols 2 and 3 -->
						<div class="styGenericDiv" style="width:72mm;">
							<!-- Lines 1b 2 -->
							<div class="sty1099KNumberedBox" style="height:12mm;">
								<div class="sty1099KLeftNumBox" style="float:left;">1b</div>
								<span style="float:left;width:30mm;">Card Not Present transactions</span> <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CardNotPresentTransAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099KNumberedBox" style="height:12mm;">
								<div class="sty1099KLeftNumBoxSD">2</div>
								<span style="font-family:Arial;display:inline;">Merchant category code</span> <br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MerchantCategoryCd"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 3 4 -->
							<div class="sty1099KNumberedBox" style="height:12mm;line-height:1.3;">
								<div class="sty1099KLeftNumBoxSD" style="float:left;">3</div>
								<span style="font-family:Arial;float:left;width:30mm;">Number of payment transactions</span> <br />
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PaymentTransactionCnt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099KNumberedBox" style="border:2px solid black;height:12mm;line-height:1.3;">
								<div class="sty1099KLeftNumBoxSD" style="float:left;">4</div>
								<span style="font-family:Arial;font-weight:bold;float:left;width:29mm;">Federal income tax withheld</span> <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 5a 5b -->
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5a</div>
								January <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/JanuaryAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5b</div>
								February <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FebruaryAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 5c 5d -->
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5c</div>
								March <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MarchAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5d</div>
								April <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AprilAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 5e 5f -->
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5e</div>
								May <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MayAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5f</div>
								June <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/JuneAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 5g 5h -->
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5g</div>
								July <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/JulyAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5h</div>
								August <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AugustAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 5i 5j -->
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5i</div>
								September <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/SeptemberAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099KNumberedBox">
								<div class="sty1099KLeftNumBox">5j</div>
								October <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OctoberAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 5k 5l -->
							<div class="sty1099KNumberedBox" style="border-bottom-width:0px;">
								<div class="sty1099KLeftNumBox">5k</div>
								November <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NovemberAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099KNumberedBox" style="border-bottom-width:0px;">
								<div class="sty1099KLeftNumBox">5l</div>
								December <br />
								$ 
								<span class="sty1099KAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/DecemberAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Copy info -->
						<div class="sty1099KRightCell">
							<span style="display:inline;font-weight:bold;font-size:11pt;">Copy B <br /> <span style="font-size:10pt;">For Payee</span></span>
							<br/><br /><br/>
							This is important tax information and is being furnished to the IRS. If you are required to file a return, 
							a negligence penalty or other sanction may be imposed on you if this income is taxable and the IRS 
							determines that it has not been reported.
						</div>
					</div>
					<!-- Line Account 6 7 8 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:87mm;">
							<div class="sty1099KLeftCell" style="min-height:11.5mm;border-bottom-width:0px;border-right-width:1px;">
								<span style="display:inline;font-family:Arial;">Account number (see instructions)</span><br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RecipientAccountNum"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:100mm;">
							<!-- Line 6 7 8 -->
							<div class="sty1099KLeftCell" style="min-height:7.5mm;width:30%;border-bottom-style:dashed;border-left-width:0px;">
								<div class="sty1099KLeftNumBox">6</div>
								State <br />
								<xsl:choose>
									<xsl:when test="$SepStateLocal">See Addn'l Data</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099KStateLocalTaxGrp/StateAbbreviationCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099KLeftCell" style="min-height:7.5mm;width:35%;border-bottom-style:dashed;font-family:Arial Narrow;">
								<div class="sty1099KLeftNumBox" style="font-family:Verdana;">7</div>
								State identification no. <br />
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099KStateLocalTaxGrp/StateIdNum"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099KLeftCell" style="min-height:7.5mm;width:35%;border-bottom-style:dashed;">
								<div class="sty1099KLeftNumBox">8</div>
								<span style="font-family:Arial;">State income tax withheld</span> <br />
								$ 
								<span class="sty1099KAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099KStateLocalTaxGrp/StateTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="sty1099KLeftCell" style="min-height:4mm;width:30%;border-bottom-width:0px;border-left-width:0px;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099KStateLocalTaxGrp/LocalAbbreviationCdTxt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099KLeftCell" style="min-height:4mm;width:35%;border-bottom-width:0px;font-family:Arial;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099KStateLocalTaxGrp/LocalityNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099KLeftCell" style="min-height:4mm;width:35%;border-bottom-width:0px;">
								$ 
								<span class="sty1099KAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099KStateLocalTaxGrp/LocalTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						Form <span style="font-weight:bold;font-size:9pt;">1099-K</span> (Rev. 4-2022)
						<span style="margin-left:5mm;">(Keep for your records)</span>
						<span style="margin-left:5mm;">www.irs.gov/Form1099K</span>
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
										<strong>6</strong> State
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>7</strong> State identification no.
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										<strong>8</strong> State tax withheld
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
								<xsl:for-each select="$FormData/Form1099KStateLocalTaxGrp">
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
