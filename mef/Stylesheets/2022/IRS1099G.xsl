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
	<xsl:include href="IRS1099GStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1099G" />
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
				<meta name="Description" content="IRS Form 1099-G" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1099GStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1099G">
					<xsl:call-template name="DocumentHeader" />
					<div class="styStdDiv" style="padding:2px;text-align:center;font-size:9pt;">
						<input type="checkbox" class="styCkboxNM" style="" alt="Corrected Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
								<xsl:with-param name="BackupName">F1099GCorrectedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						CORRECTED (if checked)
					</div>
					<xsl:variable name="StateCount" select="count($FormData/Form1099GStateLocalTaxGrp)"/>
					<xsl:variable name="SepStateLocal" select="$StateCount &gt; 1"/>
					<!-- Left side -->
					<div class="styGenericDiv" style="width:87mm;border-right:1px solid black;">
						<div class="sty1099GLeftCell" style="min-height:34mm;border-top:1px solid black;">
							PAYER'S name, street address, city or town, state or province, country, ZIP or foreign postal code, and telephone no.<br />
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
						<div class="sty1099GLeftCell" style="width:50%;min-height:8mm;;">
							PAYER'S TIN<br />
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/PayerEIN"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1099GLeftCell" style="width:50%;min-height:8mm;">
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
						<div class="sty1099GLeftCell" style="min-height:8.5mm;">
							RECIPIENT'S name<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RecipientNm"/>
							</xsl:call-template>
						</div>
						<div class="sty1099GLeftCell" style="min-height:10.5mm;">
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
						<div class="sty1099GLeftCell" style="min-height:9mm;border-bottom-width:0px;">
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
							<div class="sty1099GNumberedBox" style="height:12.5mm;border-top-width:1px;">
								<div class="sty1099GLeftNumBoxSD" style="width:4.5mm;">1</div>
								<span style="font-family:Arial Narrow;">Unemployment compensation</span> <br /><br />
								$ 
								<span class="sty1099GAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099GNumberedBox" style="height:12.5mm;">
								<div class="sty1099GLeftNumBoxSD" style="float:left;">2</div>
								<span style="font-family:Arial;float:left;width:30mm;">State or local income tax refunds, credits, or offsets</span> <br />
								$ 
								<span class="sty1099GAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/StateLclRefundCreditOffsetAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:30mm;">
							<div class="sty1099GNumberedBox" style="text-align:center;height:17mm;width:30mm;border-top-width:1px;">
								OMB No. 1545-0120<br />
								Form <span style="font-weight:bold;font-size:12pt;margin-top:4px;margin-bottom:4px;">1099-G</span><br />
								(Rev. January 2022)
							</div>
							<div class="sty1099GNumberedBox" style="text-align:center;height:8mm;width:30mm;line-height:1.2;">
								For calendar year<br />
								<span style="border-bottom:1px solid black;width:12mm;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/CalendarYr"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="sty1099GRightCell" style="width:34mm;height:25mm;font-size:10pt;font-weight:bold;border-bottom:1px solid black;"><br />
							Certain Government Payments
						</div>
						<!-- Cols 2 and 3 -->
						<div class="styGenericDiv" style="width:72mm;">
							<!-- Line 3 4 -->
							<div class="sty1099GNumberedBox" style="height:9mm;line-height:1.3;">
								<div class="sty1099GLeftNumBoxSD" style="width:3.5mm;">3</div>
								<span style="font-family:Arial;display:inline;">Box 2 amount is for tax year</span><br />
								<span style="width:100%;text-align:center;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/RefundCreditOffsetTaxYr"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099GNumberedBox" style="border:2px solid black;height:9mm;line-height:1.3;">
								<div class="sty1099GLeftNumBoxSD" style="float:left;">4</div>
								<span style="font-family:Arial Narrow;font-weight:bold;float:left;">Federal income tax withheld</span> <br />
								$ 
								<span class="sty1099GAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 5 6 -->
							<div class="sty1099GNumberedBox">
								<div class="sty1099GLeftNumBoxSD">5</div>
								<span style="font-family:Arial;display:inline;">RTAA Payments</span> <br /><br />
								$ 
								<span class="sty1099GAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RTAAPaymentsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099GNumberedBox">
								<div class="sty1099GLeftNumBoxSD">6</div>
								<span style="font-family:Arial;display:inline;">Taxable grants</span> <br /><br />
								$ 
								<span class="sty1099GAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableGrantsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 7 8 -->
							<div class="sty1099GNumberedBox" style="">
								<div class="sty1099GLeftNumBoxSD">7</div>
								<span style="font-family:Arial;display:inline;">Agriculture payments</span> <br /><br />
								$ 
								<span class="sty1099GAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AgriculturePaymentsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099GNumberedBox" style="">
								<div class="sty1099GLeftNumBoxSD" style="width:4mm;float:left;">8</div>
								<span style="font-family:Arial;float:left;width:23mm;">
									If checked, box 2 is trade or business income
								</span>
								<span style="float:right;text-align:right;margin-right:3px;margin-top:7mm;">
									&#9658;
									<input type="checkbox" class="styCkboxNM" style="" alt="Trade Or Business IncomeInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TradeOrBusinessIncomeInd"/>
											<xsl:with-param name="BackupName">F1099GTradeOrBusinessIncomeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<!-- Line 9 10 -->
							<div class="sty1099GNumberedBox" style="border-bottom-width:0px;">
								<div class="sty1099GLeftNumBoxSD">9</div>
								Market gain <br /><br />
								$ 
								<span class="sty1099GAmountSpan">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MarketGainAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1099GNumberedBox" style="border-bottom-width:0px;">&nbsp;</div>
						</div>
						<!-- Copy info -->
						<div class="sty1099GRightCell" style="font-family:Arial;">
							<span style="font-weight:bold;font-size:10pt;margin-bottom:3px;">Copy B <br /> For Recipient</span>
							<br/>
							This is important tax information and is being furnished to the IRS. If you are required to file a return, 
							a negligence penalty or other sanction may be imposed on you if this income is taxable and the IRS 
							determines that it has not been reported.
						</div>
					</div>
					<!-- Line 10a 10b 11 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:87mm;">
							<div class="sty1099GLeftCell" style="min-height:11.5mm;border-bottom-width:0px;border-right-width:1px;">
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
							<div class="sty1099GLeftCell" style="min-height:7.5mm;width:30%;border-bottom-style:dashed;border-left-width:0px;">
								<div class="sty1099GLeftNumBox" style="width:5.5mm;">10a</div>
								State <br />
								<xsl:choose>
									<xsl:when test="$SepStateLocal">See Addn'l Data</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099GStateLocalTaxGrp/StateAbbreviationCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099GLeftCell" style="min-height:7.5mm;width:35%;border-bottom-style:dashed;font-family:Arial Narrow;">
								<div class="sty1099GLeftNumBox" style="font-family:Verdana;width:5.5mm;">10b</div>
								State identification no. <br />
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099GStateLocalTaxGrp/StateIdNum"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099GLeftCell" style="min-height:7.5mm;width:35%;border-bottom-style:dashed;">
								<div class="sty1099GLeftNumBox">11</div>
								<span style="font-family:Arial;">State income tax withheld</span> <br />
								$ 
								<span class="sty1099GAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099GStateLocalTaxGrp/StateTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="sty1099GLeftCell" style="min-height:4mm;width:30%;border-bottom-width:0px;border-left-width:0px;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099GStateLocalTaxGrp/LocalAbbreviationCdTxt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099GLeftCell" style="min-height:4mm;width:35%;border-bottom-width:0px;font-family:Arial;">
								<xsl:choose>
									<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1099GStateLocalTaxGrp/LocalityNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1099GLeftCell" style="min-height:4mm;width:35%;border-bottom-width:0px;">
								$ 
								<span class="sty1099GAmountSpan" style="width:27mm;">
									<xsl:choose>
										<xsl:when test="$SepStateLocal">&nbsp;</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/Form1099GStateLocalTaxGrp/LocalTaxWithheldAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						Form <span style="font-weight:bold;font-size:9pt;">1099-G</span> (Rev. 1-2022)
						<span style="margin-left:5mm;">(Keep for your records)</span>
						<span style="margin-left:5mm;">www.irs.gov/Form1099G</span>
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
						<span class="styRepeatingDataTitle">Lines 10-11 - State and Local Tax Withheld</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>10</strong> State
									</th>
									<th class="styDepTblCell" scope="col" style="width:45mm;font-weight:normal;">
										<strong>10b</strong> State identification no.
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										<strong>11</strong> State income tax withheld
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
								<xsl:for-each select="$FormData/Form1099GStateLocalTaxGrp">
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
