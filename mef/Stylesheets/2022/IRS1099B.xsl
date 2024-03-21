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
	<xsl:include href="IRS1099BStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1099B" />
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
				<meta name="Description" content="IRS Form 1099-B" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1099BStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1099B">
					<xsl:call-template name="DocumentHeader" />
					<div class="styStdDiv" style="padding:2px;text-align:center;font-size:9pt;">
						<input type="checkbox" class="styCkboxNM" style="" alt="Corrected Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
								<xsl:with-param name="BackupName">F1099BCorrectedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						CORRECTED (if checked)
					</div>
					<xsl:variable name="StateCount" select="count($FormData/Form1099BStateLocalTaxGrp)"/>
					<xsl:variable name="SepStateLocal" select="$StateCount &gt; 1"/>
					<!-- Left side -->
					<div class="styGenericDiv" style="width:87mm;border-right:1px solid black;">
						<div class="sty1099BLeftCell" style="min-height:37.8mm;border-top:1px solid black;">
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
						<div class="sty1099BLeftCell" style="width:50%;height:14.8mm;">
							PAYER'S TIN<br /><br />
							<span style="width:12mm;height:1mm;"/>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/PayerEIN"/>
							</xsl:call-template>
						</div>
						<div class="sty1099BLeftCell" style="width:50%;height:14.8mm;">
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
						<div class="sty1099BLeftCell" style="height:12mm;">
							RECIPIENT'S name<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RecipientNm"/>
							</xsl:call-template>
						</div>
						<div class="sty1099BLeftCell" style="height:12mm;">
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
						<div class="sty1099BLeftCell" style="height:12mm;">
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
						<div class="sty1099BLeftCell" style="min-height:8mm;">
							<span style="display:inline;font-family:Arial;">Account number (see instructions)</span><br />
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/RecipientAccountNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1099BLeftCell" style="min-height:8mm;width:75%;">
							<span style="display:inline;font-family:Arial;">CUSIP number</span><br />
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CUSIPNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1099BLeftCell" style="min-height:8mm;width:25%;">
							<span style="display:inline;font-family:Arial;">FATCA filing requirement</span>
							<input type="checkbox" class="styCkboxNM" style="float:right;margin-top:0px;margin-right:6px;" alt="FATCA Filing Requirement">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FATCAFilingRequirementInd"/>
									<xsl:with-param name="BackupName">F1099BFATCAFilingRequirementInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<!-- Line 14 15 16 -->
						<div class="sty1099BLeftCell" style="min-height:7.5mm;width:30%;border-bottom-style:dashed;">
							<div class="sty1099BLeftNumBox">14</div>
							State name <br />
							<xsl:choose>
								<xsl:when test="$SepStateLocal">See Addn'l Data</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form1099BStateLocalTaxGrp/StateAbbreviationCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="sty1099BLeftCell" style="min-height:7.5mm;width:35%;border-bottom-style:dashed;font-family:Arial Narrow;">
							<div class="sty1099BLeftNumBox" style="font-family:Verdana;">15</div>
							State identification no. <br />
							<xsl:choose>
								<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form1099BStateLocalTaxGrp/StateIdNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="sty1099BLeftCell" style="min-height:7.5mm;width:35%;border-bottom-style:dashed;">
							<div class="sty1099BLeftNumBox">16</div>
							State tax withheld <br />
							$ 
							<span class="sty1099BAmountSpan" style="width:27mm;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099BStateLocalTaxGrp/StateTaxWithheldAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="sty1099BLeftCell" style="min-height:4mm;width:30%;border-bottom-width:0px;">
							<xsl:choose>
								<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form1099BStateLocalTaxGrp/LocalAbbreviationCdTxt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="sty1099BLeftCell" style="min-height:4mm;width:35%;border-bottom-width:0px;font-family:Arial;">
							<xsl:choose>
								<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form1099BStateLocalTaxGrp/LocalityNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="sty1099BLeftCell" style="min-height:4mm;width:35%;border-bottom-width:0px;">
							$ 
							<span class="sty1099BAmountSpan" style="width:27mm;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099BStateLocalTaxGrp/LocalTaxWithheldAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Right side -->
					<div class="styGenericDiv" style="width:100mm;">
						<div class="sty1099BNumberedBox" style="padding-left:3mm;width:42mm;border-width:1px 0px 0px 0px;">
							<span style="display:inline;font-family:Arial Narrow;font-size:8pt;">Applicable checkbox on Form 8949</span><br /><br />
							<span style="width:15mm;height:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Form8949ApplicableCheckboxCd"/>
							</xsl:call-template>
						</div>
						<div class="sty1099BNumberedBox" style="text-align:center;height:auto;border-width:1px 1px 0px 1px;width:30mm;">
							OMB No. 1545-0715<br />
							<div class="styTY" style="margin-top:1mm;">20<span class="styTYColor">22</span></div><br />
							Form <span style="font-weight:bold;font-size:9pt;">1099-B</span>
						</div>
						<div class="sty1099BRightCell" style="font-size:8pt;font-weight:bold;">
							Proceeds From Broker and Barter Exchange Transactions
						</div>
						<!-- Line 1a -->
						<div class="sty1099BLeftCell" style="border-width:1px 0px;">
							<div class="sty1099BLeftNumBoxSD">1a</div>
							Description of property (Example: 100 sh. XYZ Co.)<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PropertyDesc"/>
							</xsl:call-template>
						</div>
						<!-- Cols 2 and 3 -->
						<div class="styGenericDiv" style="width:72mm;">
							<!-- Lines 1b 1c -->
							<div class="sty1099BNumberedBox">
								<div class="sty1099BLeftNumBoxSD">1b</div>
								Date acquired <br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/AcquiredDt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099BNumberedBox">
								<div class="sty1099BLeftNumBoxSD">1c</div>
								Date sold or disposed <br />
								<span style="width:10mm;height:1mm;"/>
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/SoldOrDisposedDt"/>
								</xsl:call-template>
							</div>
							<!-- Lines 1d 1e -->
							<div class="sty1099BNumberedBox">
								<div class="sty1099BLeftNumBoxSD">1d</div>
								Proceeds <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ProceedsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099BNumberedBox">
								<div class="sty1099BLeftNumBoxSD">1e</div>
								Cost or other basis <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CostOrOtherBasisAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 1f 1g -->
							<div class="sty1099BNumberedBox">
								<div class="sty1099BLeftNumBoxSD">1f</div>
								<span style="font-family:Arial;display:inline;">Accrued market discount</span> <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccruedMarketDiscountAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099BNumberedBox">
								<div class="sty1099BLeftNumBoxSD">1g</div>
								<span style="font-family:Arial;display:inline;">Wash sale loss disallowed</span> <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NondeductibleWashSaleLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 2 3 -->
							<div class="sty1099BNumberedBox" style="font-family:Arial;height:12mm">
								<div class="sty1099BLeftNumBoxSD" style="font-family:Verdana;height:9mm;float:left;">2</div>
								Short-term gain or loss 
								<input type="checkbox" class="styCkboxNM" style="" alt="Short-term gain or loss">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ShortTermGainLossInd"/>
										<xsl:with-param name="BackupName">F1099BShortTermGainLossInd</xsl:with-param>
									</xsl:call-template>
								</input><br />
								Long-term gain or loss 
								<input type="checkbox" class="styCkboxNM" style="margin-left:2px;" alt="Long-term gain or loss">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/LongTermGainLossInd"/>
										<xsl:with-param name="BackupName">F1099BLongTermGainLossInd</xsl:with-param>
									</xsl:call-template>
								</input><br />
								Ordinary
								<input type="checkbox" class="styCkboxNM" style="margin-left:15.5mm;" alt="Ordinary">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OrdinaryInd"/>
										<xsl:with-param name="BackupName">F1099BOrdinaryInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="sty1099BNumberedBox" style="font-family:Arial;height:12mm">
								<div class="sty1099BLeftNumBoxSD" style="font-family:Verdana;height:9mm;float:left;">3</div>
								If checked, proceeds from: <br />
								Collectibles
								<input type="checkbox" class="styCkboxNM" style="margin-left:8.1mm;" alt="Collectibles">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CollectiblesInd"/>
										<xsl:with-param name="BackupName">F1099BCollectiblesInd</xsl:with-param>
									</xsl:call-template>
								</input><br />
								QOF
								<input type="checkbox" class="styCkboxNM" style="margin-left:15.5mm;" alt="QOF">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QOFInd"/>
										<xsl:with-param name="BackupName">F1099BQOFInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<!-- Line 4 5 -->
							<div class="sty1099BNumberedBox" style="border:2px solid black;height:8mm;">
								<div class="sty1099BLeftNumBoxSD" style="float:left;">4</div>
								<span style="font-family:Arial Narrow;font-weight:bold;float:left;">Federal income tax withheld</span> <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099BNumberedBox" style="height:8mm;">
								<div class="sty1099BLeftNumBoxSD" style="width:4mm;">5</div>
								If checked, noncovered security
								<input type="checkbox" class="styCkboxNM" style="margin-left:15.5mm;" alt="Noncovered security">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NoncoveredSecurityInd"/>
										<xsl:with-param name="BackupName">F1099BNoncoveredSecurityInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<!-- Line 6 7 -->
							<div class="sty1099BNumberedBox" style="font-family:Arial;height:12mm">
								<div class="sty1099BLeftNumBoxSD" style="font-family:Verdana;height:9mm;float:left;">6</div>
								Reported to IRS <br />
								Gross proceeds
								<input type="checkbox" class="styCkboxNM" style="margin-left:5.1mm;" alt="Gross Proceeds">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/GrossProceedsInd"/>
										<xsl:with-param name="BackupName">F1099BGrossProceedsInd</xsl:with-param>
									</xsl:call-template>
								</input><br />
								Net proceeds
								<input type="checkbox" class="styCkboxNM" style="margin-left:7.8mm;" alt="Net Proceeds">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NetProceedsInd"/>
										<xsl:with-param name="BackupName">F1099BNetProceedsInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="sty1099BNumberedBox" style="font-family:Arial;height:12mm">
								<div class="sty1099BLeftNumBoxSD" style="font-family:Verdana;height:9mm;float:left;">7</div>
								If checked, loss is not allowed based on amount in 1d 
								<input type="checkbox" class="styCkboxNM" style="margin-left:15.6mm;margin-top:3px;" alt="Loss is not allowed">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/LossNotAllowedInd"/>
										<xsl:with-param name="BackupName">F1099BLossNotAllowedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<!-- Line 8 9 10 11 -->
							<div class="sty1099BNumberedBox" style="border-width:2px 1px 1px 2px;height:11.2mm;">
								<div class="sty1099BLeftNumBoxSD" style="float:left;">8</div>
								<span style="font-family:Arial;float:left;width:29mm;">Profit or (loss) realized in 2022 on closed contracts</span> <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TYClosedContractProfitLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099BNumberedBox" style="border-width:2px 2px 1px 0px;height:11.2mm;">
								<div class="sty1099BLeftNumBoxSD" style="float:left;">9</div>
								<span style="font-family:Arial Narrow;float:left;width:29mm;">Unrealized profit or (loss) on open contracts&mdash;12/31/2021</span> <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PriorYrOpenCntrctProfitLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099BNumberedBox" style="border-width:0px 1px 2px 2px;height:11.2mm;">
								<div class="sty1099BLeftNumBox" style="float:left;">10</div>
								<span style="font-family:Arial Narrow;float:left;width:29mm;">Unrealized profit or (loss) on open contracts&mdash;12/31/2022</span> <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CYOpenCntrctProfitLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099BNumberedBox" style="border-width:0px 2px 2px 0px;height:11.2mm;">
								<div class="sty1099BLeftNumBox" style="float:left;">11</div>
								<span style="font-family:Arial;float:left;width:29mm;">Aggregate profit or (loss) on contracts</span> <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CntrctAggregateProfitLossAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 12 13 -->
							<div class="sty1099BNumberedBox" style="height:8.5mm;border-bottom-width:0px;">
								<div class="sty1099BLeftNumBox" style="width:4.5mm;float:left;">12</div>
								<span style="font-family:Arial;display:inline;">
								If checked, basis reported <br /><span style="width:4.5mm;"/> to IRS</span>
								<input type="checkbox" class="styCkboxNM" style="margin-left:15.5mm;margin-top:0px;" alt="Basis reported">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BasisReportedInd"/>
										<xsl:with-param name="BackupName">F1099BBasisReportedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="sty1099BNumberedBox" style="height:8.5mm;border-bottom-width:0px;">
								<div class="sty1099BLeftNumBox">13</div>
								Bartering <br />
								$ 
								<span class="sty1099BAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BarterAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Copy info -->
						<div class="sty1099BRightCell">
							<br/><br />
							<span style="display:inline;font-weight:bold;font-size:9pt;">Copy B <br /> For Recipient</span>
							<br/><br /><br/><br />
							This is important tax information and is being furnished to the IRS. If you are required to fild a return, 
							a negligence penalty or other sanction may be imposed on you if this income is taxable and the IRS 
							determines that it has not been reported.
						</div>
					</div>
					
					<div class="styStdDiv" style="border-top:1px solid black;">
						Form <span style="font-weight:bold;font-size:9pt;">1099-B</span>
						<span style="margin-left:15mm;">(Keep for your records)</span>
						<span style="margin-left:10mm;">www.irs.gov/Form1099B</span>
						<span style="float:right;">Department of the Treasurey - Internal Revenue Service</span>
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
										<strong>14</strong> State name
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
								<xsl:for-each select="$FormData/Form1099BStateLocalTaxGrp">
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
