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
	<xsl:include href="IRS1099PATRStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1099PATR" />
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
				<meta name="Description" content="IRS Form 1099-PATR" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1099PATRStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1099DOID">
					<xsl:call-template name="DocumentHeader" />
					<div class="styStdDiv" style="padding:2px;text-align:center;font-size:9pt;">
						<input type="checkbox" class="styCkboxNM" style="" alt="Corrected Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
								<xsl:with-param name="BackupName">F1099PATRCorrectedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						CORRECTED (if checked)
					</div>
					<xsl:variable name="StateCount" select="count($FormData/Form1099PATRStateLocalTaxGrp)"/>
					<xsl:variable name="SepStateLocal" select="$StateCount &gt; 1"/>
					<!-- Left side -->
					<div class="styGenericDiv" style="width:87mm;border-right:1px solid black;">
						<div class="sty1099PATRLeftCell" style="min-height:27mm;border-top:1px solid black;">
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
						<div class="sty1099PATRLeftCell" style="width:50%;min-height:8.5mm;">
							PAYER'S TIN<br />
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/PayerEIN"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1099PATRLeftCell" style="width:50%;min-height:8.5mm;">
							RECIPIENT'S TIN<br />
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
						<div class="sty1099PATRLeftCell" style="height:12mm;">
							RECIPIENT'S name<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RecipientNm"/>
							</xsl:call-template>
						</div>
						<div class="sty1099PATRLeftCell" style="height:12mm;">
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
						<div class="sty1099PATRLeftCell" style="height:12mm;">
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
						<div class="sty1099PATRLeftCell" style="min-height:9mm;border-bottom-width:0px;">
							<span style="display:inline;font-family:Arial;">Account number (see instructions)</span><br />
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/RecipientAccountNum"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Right side -->
					<div class="styGenericDiv" style="width:100mm;">
						<div class="styGenericDiv" style="width:36mm;">
							<div class="sty1099PATRNumberedBox" style="border-top-width:1px;">
								<div class="sty1099PATRLeftNumBoxSD" style="float:left;">1</div>
								<span style="font-family:Arial;float:left;width:30mm;">Patronage dividends</span> <br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronageDividendsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099PATRNumberedBox" style="">
								<div class="sty1099PATRLeftNumBoxSD" style="float:left;">2</div>
								<span style="font-family:Arial;float:left;width:30mm;">Nonpatronage distributions</span> <br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonpatronageDistributionsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099PATRNumberedBox" style="">
								<div class="sty1099PATRLeftNumBoxSD" style="float:left;">3</div>
								<span style="font-family:Arial;float:left;width:30mm;">Per-unit retain allocations</span> <br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PerUnitRetainAllocationsAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:30mm;">
							<div class="sty1099PATRNumberedBox" style="text-align:center;height:27mm;width:30mm;border-top-width:1px;">
								OMB No. 1545-0118<br />
								<div class="styTY" style="margin-top:1mm;">20<span class="styTYColor">22</span></div><br />
								Form <span style="font-weight:bold;font-family:Arial;font-size:11pt;margin-top:10px;">1099-PATR</span>
							</div>
						</div>
						<div class="sty1099PATRRightCell" style="width:34mm;height:27mm;font-size:10pt;font-weight:bold;border-bottom:1px solid black;"><br />
							Taxable Distributions Received From Cooperatives
						</div>
						<!-- Cols 2 and 3 -->
						<div class="styGenericDiv" style="width:72mm;">
							<!-- Line 3 4 -->
							<div class="sty1099PATRNumberedBox" style="border:2px solid black;height:8.5mm;line-height:1.3;">
								<div class="sty1099PATRLeftNumBoxSD" style="float:left;">4</div>
								<span style="font-family:Arial Narrow;font-weight:bold;float:left;">Federal income tax withheld</span> <br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099PATRNumberedBox" style="height:8.5mm;">
								<div class="sty1099PATRLeftNumBoxSD" style="float:left;">5</div>
								<span style="font-family:Arial Narrow;float:left;width:30mm;">Redeemed nonqualified notices</span> <br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RedeemedNonqualifiedNoticesAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 6 7 -->
							<div class="sty1099PATRNumberedBox" style="height:12mm;line-height:1.3;">
								<div class="sty1099PATRLeftNumBoxSD" style="float:left;">6</div>
								<span style="font-family:Arial;float:left;">Section 199A(g) deduction </span><br /><br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Section199AgDeductionAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099PATRNumberedBox" style="height:12mm;line-height:1.3;">
								<div class="sty1099PATRLeftNumBoxSD" style="float:left;">7</div>
								<span style="float:left;width:30mm;">Qualified payments <br /> (Section 199A(b)(7))</span>
								<br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Section199Ab7QualifiedPymtAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 8 9 -->
							<div class="sty1099PATRNumberedBox" style="height:12mm;line-height:1.3;">
								<div class="sty1099PATRLeftNumBoxSD" style="float:left;">9</div>
								<span style="float:left;width:30mm;">Section 199A(a) <br />qual. items </span><br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Section199AaQualifiedItemsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099PATRNumberedBox" style="height:12mm;line-height:1.3;">
								<div class="sty1099PATRLeftNumBoxSD" style="float:left;">9</div>
								<span style="float:left;width:30mm;">Section 199A(a) <br />SSTB items</span>
								<br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Section199AaSSTBItemsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 10 11 -->
							<div class="sty1099PATRNumberedBox" style="height:12mm;line-height:1.3;">
								<div class="sty1099PATRLeftNumBox" style="float:left;">10</div>
								<span style="font-family:Arial;float:left;">Investment credit </span><br /><br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/InvestmentCreditAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099PATRNumberedBox" style="height:12mm;line-height:1.3;">
								<div class="sty1099PATRLeftNumBox" style="float:left;">11</div>
								<span style="font-family:Arial;float:left;">Work opportunity credit </span><br /><br />
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WorkOpportunityCreditAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 12 13 -->
							<div class="sty1099PATRNumberedBox" style="height:9mm;border-bottom-width:0px;width:45mm;">
								<div class="sty1099PATRLeftNumBox">12</div>
								Other credits and deductions <br /> 
								$ 
								<span class="sty1099PATRAmountSpan">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8844CreditAmt"/>
										<xsl:with-param name="Desc">Line 12 - Form 8844 Credit Amount</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8896CreditAmt"/>
										<xsl:with-param name="Desc">Line 12 - Form 8896 Credit Amount</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8941CreditAmt"/>
										<xsl:with-param name="Desc">Line 12 - Form 8941 Credit Amount</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8932CreditAmt"/>
										<xsl:with-param name="Desc">Line 12 - Form 8932 Credit Amount</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/EPASulfurRegDeductionAmt"/>
										<xsl:with-param name="Desc">Line 12 - EPA Sulfur Regulations Deduction Amount</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8864CreditAmt"/>
										<xsl:with-param name="Desc">Line 12 - Form 8864 Credit Amount</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099PATRNumberedBox" style="height:9mm;border-bottom-width:0px;width:27mm;">
								<div class="sty1099PATRLeftNumBoxSD">13</div>
								Specified Coop <br />
								<span class="" style="width:100%;text-align:center;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Specified Cooperative">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SpecifiedCooperativeInd"/>
											<xsl:with-param name="BackupName">F1099PATRSpecifiedCooperativeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
						</div>
						<!-- Copy info -->
						<div class="sty1099PATRRightCell">
							<span style="display:inline;font-weight:bold;font-size:9pt;">Copy B <br /> For Recipient</span>
							<br/><br />
							This is important tax information and is being furnished to the IRS. If you are required to file a return, 
							a negligence penalty or other sanction may be imposed on you if this income is taxable and the IRS 
							determines that it has not been reported.
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						Form <span style="font-weight:bold;font-size:9pt;">1099-PATR</span> 
						<span style="margin-left:10mm;">(Keep for your records)</span>
						<span style="margin-left:10mm;">www.irs.gov/Form1099PATR</span>
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
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form8844CreditAmt"/>
							<xsl:with-param name="Desc">Line 12 - Form 8844 Credit Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form8896CreditAmt"/>
							<xsl:with-param name="Desc">Line 12 - Form 8896 Credit Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form8941CreditAmt"/>
							<xsl:with-param name="Desc">Line 12 - Form 8941 Credit Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form8932CreditAmt"/>
							<xsl:with-param name="Desc">Line 12 - Form 8932 Credit Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EPASulfurRegDeductionAmt"/>
							<xsl:with-param name="Desc">Line 12 - EPA Sulfur Regulations Deduction Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form8864CreditAmt"/>
							<xsl:with-param name="Desc">Line 12 - Form 8864 Credit Amount</xsl:with-param>
						</xsl:call-template>
					</table>
					<xsl:if test="($FormData/CUSIPNumberOrObligationDesc) and (string-length($FormData/CUSIPNumberOrObligationDesc) &gt; 250)">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 7 - CUISP Number or Obligation Description</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:187mm;font-weight:normal;">
										Description
									</th>
								</tr>
							</thead>
							<tbody>
								<tr class="styDepTblRow1">
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/CUSIPNumberOrObligationDesc"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$SepStateLocal">
						<br /><br />
						<span class="styRepeatingDataTitle">Lines 14-16 - State and Local Tax Withheld</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>12</strong> State
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>13</strong> State identification no.
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										<strong>14</strong> State tax withheld
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
								<xsl:for-each select="$FormData/Form1099PATRStateLocalTaxGrp">
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
