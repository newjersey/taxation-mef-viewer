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
	<xsl:include href="IRS1042ScheduleQStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1042ScheduleQ" />
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
				<meta name="Description" content="IRS Schedule Q Form 1042" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1042ScheduleQStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1042ScheduleQ">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:19mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE Q<br />(Form 1042)</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<span class="styAgency" style="padding-top:1mm;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:19mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;">
								Tax Liability of Qualified Derivative Dealer (QDD)
							</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658; Attach to Form 1042
							</span>
							<br />
							<span style="font-weight:bold;">
								&#9658; Go to <span style="font-style:italic;">www.irs.gov/Form1042</span> for the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm;">
							<div class="styOMB" style="font-size:6pt;">OMB No. 1545-0096</div>
							<div class="styTY" style="margin-top:1mm;">20<span class="styTYColor">22</span></div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1042SQHeaderCell" style="height:10mm;width:127mm;border-right-width:1px;">
							Name of taxpayer
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:60mm;height:10mm;padding-left:1mm;font-weight:normal;font-size:inherit;">
							<strong>Employer identification number</strong><br />
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationEIN"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1042SQHeaderCell" style="height:10mm;width:127mm;border-right-width:1px;">
							Name of QDD
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QDDName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QDDName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:60mm;height:10mm;padding-left:1mm;font-weight:normal;font-size:inherit;">
							<strong>QI-EIN</strong><br />
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedIntermediaryEIN"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styGenericDiv" style="height:auto;width:127mm;border-right:1px solid black;border-top:1px solid black;">
						<div class="sty1042SQHeaderCell" style="height:9mm;width:100%;border-bottom-width:1px;">
							QDD Taxable Year (enter month, day, and year for beginning and ending dates) <br />
							<span style="height:4mm;width:1mm;"/>
							Beginning 
							<span style="width:40mm;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/QDDTaxPeriodBeginDt"/>
								</xsl:call-template>
							</span>
							, and ending 
							<span style="width:40mm;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/QDDTaxPeriodEndDt"/>
								</xsl:call-template>
							</span>.
						</div>
						<div class="sty1042SQHeaderCell" style="height:13mm;width:100%;padding-top:4px;">
							Indicate the year or portion of the year to which the schedule relates (enter month, day, and year beginning and ending dates) <br />
							<span style="height:4mm;width:1mm;"/>
							Beginning 
							<span style="width:40mm;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/SchRltdTaxPeriodBeginDt"/>
								</xsl:call-template>
							</span>
							, and ending 
							<span style="width:40mm;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/SchRltdTaxPeriodEndDt"/>
								</xsl:call-template>
							</span>.
						</div>
					</div>
					<div class="styGenericDiv" style="height:auto;width:60mm;border-top:1px solid black;">
						<div class="sty1042SQHeaderCell" style="width:100%;height:auto;padding-top:9mm;">
							Schedule 
							<span style="min-width:20mm;border-bottom:1px solid black;text-align:right;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/QDDScheduleNum"/>
								</xsl:call-template>
							</span>
							of 
							<span style="min-width:20mm;border-bottom:1px solid black;text-align:right;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TotalQDDScheduleNum"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:84mm;height:13mm;padding-left:20mm;font-weight:bold;padding-top:1.5mm;font-size:8pt;">Summary of QDD Tax Liability</div>
						<div class="styLNRightNumBoxNBB" style="height:13mm;width:7mm;border-left-width:0px;">&nbsp;</div>
						<div class="sty1042SQAmountBox" style="height:13mm;text-align:center;border-bottom-width:0px;"><strong>(a)</strong><br /> Gross Amount</div>
						<div class="sty1042SQAmountBox" style="height:13mm;text-align:center;border-bottom-width:0px;"><strong>(b)</strong><br /> Withholding <br /> Tax Rate</div>
						<div class="sty1042SQAmountBox" style="height:13mm;text-align:center;border-bottom-width:0px;"><strong>(c)</strong><br /> Amount of <br /> Tax Liability (column (a) x column (b))</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:84mm;">
							Total section 871(m) amount
							<span class="sty1042SQDotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">1</div>
						<div class="sty1042SQAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalSect871mAmountGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1042SQAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TotalSect871mAmountGrp/WithholdingTaxRt"/>
							</xsl:call-template>
						</div>
						<div class="sty1042SQAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalSect871mAmountGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:84mm;">
							Total dividends recieved in equity derivatives dealer capacity
							<span class="sty1042SQDotLn">.</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">2</div>
						<div class="sty1042SQAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDivRcvdInEqtyDerivativesGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1042SQAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TotDivRcvdInEqtyDerivativesGrp/WithholdingTaxRt"/>
							</xsl:call-template>
						</div>
						<div class="sty1042SQAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDivRcvdInEqtyDerivativesGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:84mm;height:auto;">
							Total QDD tax liability pursuant to section 3.09(A) of the Qualified Intermediary Agreement
							<span class="sty1042SQDotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;width:7mm;"><br />3</div>
						<div class="sty1042SQAmountBox" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty1042SQAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQDDTaxPerSect309AGrp/WithholdingTaxRt"/>
							</xsl:call-template>
						</div>
						<div class="sty1042SQAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQDDTaxPerSect309AGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:84mm;height:auto;">
							Total QDD tax liability pursuant to section 3.09(B) of the Qualified Intermediary Agreement
							<span class="sty1042SQDotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;width:7mm;"><br />4</div>
						<div class="sty1042SQAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQDDTaxPerSect309BGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1042SQAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQDDTaxPerSect309BGrp/WithholdingTaxRt"/>
							</xsl:call-template>
						</div>
						<div class="sty1042SQAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQDDTaxPerSect309BGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:84mm;height:auto;">
							Total QDD tax liability pursuant to section 3.09(C) of the Qualified Intermediary Agreement:
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;width:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty1042SQAmountBox" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty1042SQAmountBox" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty1042SQAmountBox" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 5a+ -->
					<xsl:variable name="CGrpCount" select="count($FormData/TotQDDTaxPerSect309CIncmGrp)"/>
					
					<xsl:for-each select="$FormData/TotQDDTaxPerSect309CIncmGrp">
						<div class="styStdDiv" style="">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;"><xsl:number value="position()" format="a"/></div>
							<div class="styLNDesc" style="width:84mm;height:auto;">
								Income Type &#9658;
								<span style="width:60mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="IncomeTypeDesc"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.2mm;width:7mm;">5<xsl:number value="position()" format="a"/></div>
							<div class="sty1042SQAmountBox" style="height:4.2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="GrossAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1042SQAmountBox" style="height:4.2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="WithholdingTaxRt"/>
								</xsl:call-template>
							</div>
							<div class="sty1042SQAmountBox" style="height:4.2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="$CGrpCount &lt; 1">
						<div class="styStdDiv" style="">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
							<div class="styLNDesc" style="width:84mm;">
								Income Type &#9658;
								<span style="width:60mm;border-bottom:1px dashed black;">&nbsp;</span>
							</div>
							<div class="styLNRightNumBox" style="width:7mm;">5a</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="$CGrpCount &lt; 2">
						<div class="styStdDiv" style="">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
							<div class="styLNDesc" style="width:84mm;">
								Income Type &#9658;
								<span style="width:60mm;border-bottom:1px dashed black;">&nbsp;</span>
							</div>
							<div class="styLNRightNumBox" style="width:7mm;">5b</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="$CGrpCount &lt; 3">
						<div class="styStdDiv" style="">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
							<div class="styLNDesc" style="width:84mm;">
								Income Type &#9658;
								<span style="width:60mm;border-bottom:1px dashed black;">&nbsp;</span>
							</div>
							<div class="styLNRightNumBox" style="width:7mm;">5c</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="$CGrpCount &lt; 4">
						<div class="styStdDiv" style="">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
							<div class="styLNDesc" style="width:84mm;">
								Income Type &#9658;
								<span style="width:60mm;border-bottom:1px dashed black;">&nbsp;</span>
							</div>
							<div class="styLNRightNumBox" style="width:7mm;">5d</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
							<div class="sty1042SQAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Line 6 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:84mm;">
							Total of line 5 amounts
							<span class="sty1042SQDotLn">...........</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:7mm;">6</div>
						<div class="sty1042SQAmountBox" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQDDTaxPerSect309CGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1042SQAmountBox" style="border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty1042SQAmountBox" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQDDTaxPerSect309CGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<span style="font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 1042.</span>
						<span style="margin-left:10mm;">Cat. No. 71805T</span>
						<span style="float:right;font-weight:bold;">Schedule Q (Form 1042) 2022</span>
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
					</table>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
