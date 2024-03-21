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
	<xsl:include href="IRS1042Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1042" />
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
				<meta name="Description" content="IRS Form 1042" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1042Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1042">
					<xsl:call-template name="PopulatePreheader"><xsl:with-param name="TargetNode" select="$FormData"/></xsl:call-template>
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv" style="overflow:visible;">
						<div class="styFNBox" style="width:30mm;height:14.7mm;">
							Form <span class="styFN" style="font-size:18pt;">1042</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<span class="styAgency" style="">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
							<span style="float:right;padding-right:4px;padding-top:8px;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
									<xsl:with-param name="Desc">Top Left Header - Special Condition Description</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:14.7mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:0.2mm;padding-bottom:0.5mm;">
								Annual Withholding Tax Return for U.S. Source <br /> Income of Foreign Persons
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form1042</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:14.7mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0096</div>
							<div class="styTY">20<span class="styTYColor">22</span></div>
						</div>
					</div>
					<div class="styStdDiv" style="padding:0.5mm 0mm;border-top:1px solid black;">
						If this is an amended return, check here 
						<span class="sty1042DotLn" style="float:none;margin-left:12px;padding-right:0px;">...............................</span>
						&#9658;
						<input type="checkbox" class="styCkboxNM" alt="Amended return">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
								<xsl:with-param name="BackupName">F1042AmendedReturnInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!-- Filer information section -->
					<div class="styGenericDiv" style="height:auto;width:127mm;border-right:1px solid black;border-top:1px solid black;">
						<div class="sty5227HeaderCell" style="height:auto;min-height:10mm;width:75%;border-width:0px 1px 0px 0px;">
							Name of withholding agent
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="sty5227HeaderCell" style="height:10mm;width:25%;border-width:0px;">
							<span style="font-weight:bold;font-size:6pt;">Employer identification number</span>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="sty5227HeaderCell" style="width:60%;height:4.4mm;border-left:none;border-top-width:1px;">
							Ch. 3 Status Code <span style="width:3mm;height:2mm;"/> 
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Chapter3StatusCd"/>
							</xsl:call-template>
						</div>
						<div class="sty5227HeaderCell" style="width:40%;height:4.4mm;border-left-width:1px;border-top-width:1px;">
							Ch. 4 Status Code <span style="width:3mm;height:2mm;"/> 
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Chapter4StatusCd"/>
							</xsl:call-template>
						</div>
						<div class="sty5227HeaderCell" style="height:10mm;width:100%;">
							<span>Number, street, and room or suite no. (If a P.O. box, see instructions.)</span>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="sty5227HeaderCell" style="min-height:7mm;width:106.7mm;border-bottom-width:0px;height:auto;">
							<span>City or town, state or province, country, and ZIP or foreign postal code</span>
							<br />
							<span style="display:inline;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
								<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
									<span style="width:7px;"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
						
					</div>
					<div class="styGenericDiv" style="height:auto;width:60mm;font-weight:bold;border-width:2px 0px 2px 2px;border-color:black;border-style:solid;">
						<div class="" style="width:100%;height:10mm;text-align:center;border-bottom:1px solid black;font-size:8pt;padding-top:1mm;">
							For IRS Use Only
						</div>
						<div class="sty1042IUOCell" style="width:50%;">CC</div>
						<div class="sty1042IUOCell" style="width:50%;border-left-width:1px;">FD</div>
						<div class="sty1042IUOCell" style="width:50%;">RD</div>
						<div class="sty1042IUOCell" style="width:50%;border-left-width:1px;">FF</div>
						<div class="sty1042IUOCell" style="width:50%;">CAF</div>
						<div class="sty1042IUOCell" style="width:50%;border-left-width:1px;">FP</div>
						<div class="sty1042IUOCell" style="width:50%;">CR</div>
						<div class="sty1042IUOCell" style="width:50%;border-left-width:1px;">I</div>
						<div class="sty1042IUOCell" style="width:15%;">EDC</div>
						<div class="sty1042IUOCell" style="width:15%;border-left-width:1px;">&nbsp;</div>
						<div class="sty1042IUOCell" style="width:20%;border-left-width:1px;">&nbsp;</div>
						<div class="sty1042IUOCell" style="width:15%;border-left-width:1px;">SIC</div>
						<div class="sty1042IUOCell" style="width:15%;border-left-width:1px;">&nbsp;</div>
						<div class="sty1042IUOCell" style="width:20%;border-left-width:1px;">&nbsp;</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:83mm;padding:1px;">
							If you do not expect to file this return in the future, check here &#9658;
						</div>
						<div class="styGenericDiv" style="width:9mm;text-align:center;padding:1px;">
							<input type="checkbox" class="styCkboxNM" alt="Future filing not required">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
									<xsl:with-param name="BackupName">F1042FutureFilingNotRequiredInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styGenericDiv" style="width:39.8mm;padding:2px;">
							Enter date final income paid &#9658;
						</div>
						<div class="styGenericDiv" style="width:30mm;text-align:left;padding:2px;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/FinalIncomePaidDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="width:18mm;">Section 1</div>
						<div class="styPartDesc" style="width:168mm;">
							Record of Federal Tax Liability <span style="font-weight:normal;">(do not show federal tax deposits here)</span>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:33%;">
							<table style="display:table;border-collapse:collapse;width:100%;">
								<colgroup span="1"/>
								<colgroup span="2"/>
								<colgroup span="1"/>
								<thead>
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:5mm;font-weight:bold;font-size:6pt;">
											Line No.
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:17mm;font-weight:bold;">
											Period Ending
										</th>
										<th class="styTableCellHeader" scope="col" style="width:39.7mm;font-weight:bold;border-right-width:0px;">
											Tax liability for period <br /> (including any taxes assumed on Form(s) 1000)
										</th>
									</tr>
								</thead>
								<tbody>
									<!-- Jan -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="1"/>
										<xsl:with-param name="Month">Jan.</xsl:with-param>
										<xsl:with-param name="FinalDay">31</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Jan7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Jan15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Jan22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Jan31PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/JanPeriodEndingTotalAmt"/>
									</xsl:call-template>
									<!-- Feb -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="6"/>
										<xsl:with-param name="Month">Feb.</xsl:with-param>
										<xsl:with-param name="FinalDay">28</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Feb7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Feb15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Feb22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/FebLastDayPrdEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/FebPeriodEndingTotalAmt"/>
									</xsl:call-template>
									<!-- Mar -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="11"/>
										<xsl:with-param name="Month">Mar.</xsl:with-param>
										<xsl:with-param name="FinalDay">31</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Mar7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Mar15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Mar22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Mar31PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/MarPeriodEndingTotalAmt"/>
									</xsl:call-template>
									<!-- Apr -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="16"/>
										<xsl:with-param name="Month">Apr.</xsl:with-param>
										<xsl:with-param name="FinalDay">30</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Apr7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Apr15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Apr22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Apr30PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/AprPeriodEndingTotalAmt"/>
									</xsl:call-template>
								</tbody>
							</table>
						</div>
						<div class="styGenericDiv" style="width:33%;border-left:2px solid black;">
							<table style="display:table;border-collapse:collapse;width:100%;">
								<colgroup span="1"/>
								<colgroup span="2"/>
								<colgroup span="1"/>
								<thead>
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:5mm;font-weight:bold;font-size:6pt;">
											Line No.
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:17mm;font-weight:bold;">
											Period Ending
										</th>
										<th class="styTableCellHeader" scope="col" style="width:39.7mm;font-weight:bold;border-right-width:0px;">
											Tax liability for period <br /> (including any taxes assumed on Form(s) 1000)
										</th>
									</tr>
								</thead>
								<tbody>
									<!-- May -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="21"/>
										<xsl:with-param name="Month">May</xsl:with-param>
										<xsl:with-param name="FinalDay">31</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/May7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/May15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/May22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/May31PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/MayPeriodEndingTotalAmt"/>
									</xsl:call-template>
									<!-- June -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="26"/>
										<xsl:with-param name="Month">June</xsl:with-param>
										<xsl:with-param name="FinalDay">30</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Jun7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Jun15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Jun22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Jun30PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/JunPeriodEndingTotalAmt"/>
									</xsl:call-template>
									<!-- July -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="31"/>
										<xsl:with-param name="Month">July</xsl:with-param>
										<xsl:with-param name="FinalDay">31</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Jul7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Jul15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Jul22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Jul31PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/JulPeriodEndingTotalAmt"/>
									</xsl:call-template>
									<!-- Aug -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="36"/>
										<xsl:with-param name="Month">Aug.</xsl:with-param>
										<xsl:with-param name="FinalDay">31</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Aug7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Aug15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Aug22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Aug31PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/AugPeriodEndingTotalAmt"/>
									</xsl:call-template>
								</tbody>
							</table>
						</div>
						<div class="styGenericDiv" style="width:33%;border-left:2px solid black;">
							<table style="display:table;border-collapse:collapse;width:100%;">
								<colgroup span="1"/>
								<colgroup span="2"/>
								<colgroup span="1"/>
								<thead>
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:5mm;font-weight:bold;font-size:6pt;">
											Line No.
										</th>
										<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:17mm;font-weight:bold;">
											Period Ending
										</th>
										<th class="styTableCellHeader" scope="col" style="width:39.7mm;font-weight:bold;border-right-width:0px;">
											Tax liability for period <br /> (including any taxes assumed on Form(s) 1000)
										</th>
									</tr>
								</thead>
								<tbody>
									<!-- Sept -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="41"/>
										<xsl:with-param name="Month">Sept.</xsl:with-param>
										<xsl:with-param name="FinalDay">30</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Sep7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Sep15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Sep22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Sep30PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/SepPeriodEndingTotalAmt"/>
									</xsl:call-template>
									<!-- Oct -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="46"/>
										<xsl:with-param name="Month">Oct.</xsl:with-param>
										<xsl:with-param name="FinalDay">31</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Oct7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Oct15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Oct22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Oct31PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/OctPeriodEndingTotalAmt"/>
									</xsl:call-template>
									<!-- Nov -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="51"/>
										<xsl:with-param name="Month">Nov.</xsl:with-param>
										<xsl:with-param name="FinalDay">30</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Nov7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Nov15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Nov22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Nov30PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/NovPeriodEndingTotalAmt"/>
									</xsl:call-template>
									<!-- Dec -->
									<xsl:call-template name="F1042MonthRowGroup">
										<xsl:with-param name="StartRow" select="56"/>
										<xsl:with-param name="Month">Dec.</xsl:with-param>
										<xsl:with-param name="FinalDay">31</xsl:with-param>
										<xsl:with-param name="TN1" select="$FormData/Dec7PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN2" select="$FormData/Dec15PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN3" select="$FormData/Dec22PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TN4" select="$FormData/Dec31PeriodEndingTaxLiabAmt"/>
										<xsl:with-param name="TNE" select="$FormData/DecPeriodEndingTotalAmt"/>
									</xsl:call-template>
								</tbody>
							</table>
						</div>
					</div>
					<div class="styStdDiv" style="padding:3px 0px;border-bottom:2px solid black;">
						<strong>Note: </strong> The totals from the above table are to be entered on lines 64b through 64d (as indicated in the instructions for those lines).
					</div>
					<!-- Line 61 -->
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBox">61</div>
						<div class="styLNDesc" style="height:auto;width:178mm;">
							<strong>No. of Forms 1042-S filed: </strong>
							<span style="width:4mm;padding-left:2mm;font-weight:bold;">a</span>
							On paper 
							<span style="width:50mm;border-bottom:1px dashed black;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form1042FiledPaperCnt"/>
								</xsl:call-template>
							</span>
							<span style="width:4mm;padding-left:2mm;font-weight:bold;">b</span>
							Electronically 
							<span style="width:50mm;border-bottom:1px dashed black;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form1042FiledElectronicallyCnt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Lines 62 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">62</div>
						<div class="styLNDesc">
							Total gross amounts reported on all Forms 1042-S and 1000: 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Lines 62a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc">
							Total U.S. source FDAP income (other than U.S. source substitute payments) reported 
							<span class="sty1042DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">62a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUSSourceFDAPIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Lines 62b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Total U.S. source substitute payments reported: 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Lines 62b1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">
							<strong>(1)</strong>
							Total U.S. source substitute dividend payments reported
							<span class="sty1042DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">62b(1)</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUSSrceSubstDivPymtRptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Lines 62b2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">
							<strong>(2)</strong>
							Total U.S. source substitute payments reported other than substitute dividend payments
							<span class="sty1042DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">62b(2)</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotUSSrceSubstPymtRptNonDivAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Lines 62c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							<strong>Total gross amounts reported </strong> (add lines 62a-b)
							<span class="sty1042DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">62c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGrossReportedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Lines 62d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc">
							Enter gross amounts actually paid if different from gross amounts reported
							<span class="sty1042DotLn">..........</span>
						</div>
						<div class="styLNRightNumBoxNBB">62d</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ActualGrossPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Third Party -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:23mm;height:14mm;padding-top:2mm;border-right:1px solid black;">
							<span style="font-weight:bold;font-size:10pt;">Third Party Designee</span>
						</div>
						<div style="width:164mm;height:7mm;font-family:Arial;padding-left:2mm;padding-top:3px;">
							Do you want to allow another person to discuss this return with the IRS (see instructions)?
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;margin-left:3mm;" alt="Third Party Designee Ind Yes">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
									<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeYesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes. Complete the following.
						  <span style="width:2mm;"/>									
							<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" alt="Third Party Designee Ind No">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
									<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeNoInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
						<div style="width:164mm;height:7mm;">
							<span style="padding-left:2mm;width:70mm;">
								Designee's <br /> name 
								<span style="width:8px;"/> &#9658;
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</span>
							<span style="width:11mm;">
								Phone <br /> no. 
									<span style="width:8px;"/> &#9658;
							</span>
							<span style="width:26mm;">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
								</xsl:call-template>
							</span>
							<span style="width:30mm;">
								Personal identification <br /> number (PIN) 
									<span style="width:8px;"/> &#9658;
							</span>
							<span style="width:20mm;height:4mm;border:1px solid black;text-align:center;padding:1px;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Sign Here -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:23mm;height:18.5mm;font-size:12pt;font-weight:bold;padding-top:3mm;border-right:1px solid black;">
							Sign Here
						</div>
						<div class="styGenericDiv" style="width:164mm;font-size:6pt;padding:0.5mm;margin-bottom:1.5mm;">
							Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
							and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than withholding agent) 
							is based on all information of which preparer has any knowledge.<br />
						</div>
						<div class="styGenericDiv" style="width:164mm;">
							<div class="styGenericDiv" style="padding-left:2mm;width:15mm;padding-top:1mm;">
								Your <br /> signature
							</div>
							<div class="styGenericDiv" style="width:6mm;height:8mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="24" width="8" style="margin-top:0px;"/>
							</div>
							<div class="styGenericDiv" style="width:50mm;padding-top:1.5mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styGenericDiv" style="width:22mm;height:8mm;border-left:1px solid black;border-right:1px solid black;padding:3px;">
								Date
								<br />
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">SignatureDt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styGenericDiv" style="width:71mm;height:4mm;padding:2px;font-family:Arial;">
								Capacity in which acting &#9658;
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Title</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styGenericDiv" style="width:71mm;height:4mm;padding:2px;font-family:Arial;border-top:1px solid black;">
								Daytime phone number &#9658;
								<xsl:choose>
									<xsl:when test="$RtnHdrData/BusinessOfficerGrp/ForeignPhoneNum">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								
							</div>
						</div>
					</div>
					<!-- Implementing the preparer section in table -->
					<div class="styStdDiv" style="font-size:6pt;">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;height:auto;">
              <span class="styMainTitle" style="font-size:11pt;height:auto;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
              </div>
                <div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1px solid black;border-left:1px ;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                  <input type="checkbox" class="styCkboxNM" alt="Self Employed Checkbox">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-bottom:1px ">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black; border-left:1px solid black;padding-left:1mm;border-bottom:1px solid black;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:42mm;padding-left:1mm;border-bottom:0px solid black;">Firm's EIN
                <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <span style="width:4px;"/>
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="width:55mm;padding-left:1mm;height:auto;border-top:1px solid black;"> Phone no. 
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
            </div>
          </div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 11384V</span>
						<span style="float:right;">Form <strong>1042</strong> (2022)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 1042 (2022)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Line 63 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">63</div>
						<div class="styLNDesc">
							Total tax reported as withheld or paid by withholding agent on all Forms 1042-S and 1000: 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 63a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc">
							Tax withheld by withholding agent
							<span class="sty1042DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">63a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentTaxWthldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 63b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Tax withheld by other withholding agents: 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 63b1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">
							<strong>(1)</strong>
							For payments other than substitute dividends
							<span class="sty1042DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">63b(1)</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SubstDivOtherPymtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 63b2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">
							<strong>(2)</strong>
							For substitute dividends
							<span class="sty1042DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">63b(2)</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SubstituteDivWthldTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 63c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							Adjustments to withholding: 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 63c1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">
							<strong>(1)</strong>
							Adjustments to overwithholding
							<span class="sty1042DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">63c(1)</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/OverwithholdingAdjAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 63c2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">
							<strong>(2)</strong>
							Adjustments to underwithholding
							<span class="sty1042DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">63c(2)</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnderwithholdingAdjAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 63d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc">
							Tax paid by withholding agent
							<span class="sty1042DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">63d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/WithholdingAgentTaxPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 63e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc">
							<strong>Total tax reported as withheld or paid </strong> (add lines 63a-d)
							<span class="sty1042DotLn">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB">63e</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxWithheldOrPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="padding:2px 2px 2px 20mm;font-weight:bold;font-size:8pt;border-style:solid;border-color:black;border-width:1px 0px;">
						Computation of Tax Due or Overpayment
					</div>
					<!-- Line 64 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">64</div>
						<div class="styLNDesc">
							Total net tax liability
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 64a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc">
							Adjustments to total net tax liability
							<span class="sty1042DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">64a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetTaxLiabilityAdjAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 64b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Total net tax liability under chapter 3
							<span class="sty1042DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">64b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetTaxLiabUnderChap3Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 64c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							Total net tax liability under chapter 4
							<span class="sty1042DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">64c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetTaxLiabUnderChap4Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 64d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc">
							Excise tax on specified federal procurement payments (total payments made x 2% (0.02))
							<span class="sty1042DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">64d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FedPrcmntPaymentExciseTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 64e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc">
							<strong>Total net tax liability </strong> (add lines 64a-d)
							<span class="sty1042DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">64e</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetTaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 65 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">65</div>
						<div class="styLNDesc">
							Total paid by electronic funds transfer (or with a request for extension of time to file): 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 65a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc">
							Total paid during calendar year
							<span class="sty1042DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">65a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalEFTPaidDuringCYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 65b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Total paid during subsequent year
							<span class="sty1042DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">65b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalEFTPaidDuringSubsqYrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 66 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">66</div>
						<div class="styLNDesc">
							Enter overpayment applied as credit from 2021 Form 1042
							<span class="sty1042DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">66</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form1042OvpmtCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 67 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">67</div>
						<div class="styLNDesc">
							Credit for amounts withheld by other withholding agents: 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 67a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc">
							For payments other than substitute dividend payments
							<span class="sty1042DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">67a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherNonSubstDivPaymentsCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 67b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							For substitute dividend payments
							<span class="sty1042DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">67b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SubstDivPaymentsCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 68 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">68</div>
						<div class="styLNDesc">
							<strong>Total payments. </strong> Add lines 65 through 67
							<span class="sty1042DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">68</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 69 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">69</div>
						<div class="styLNDesc">
							If line 64e is larger than line 68, enter balance due here
							<span class="sty1042DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">69</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 70a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">70a</div>
						<div class="styLNDesc">
							Enter overpayment attributable to overwithholding on U.S. source income of foreign persons
							<span class="sty1042DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">70a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSrceIncmOverWHOvpmtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 70b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Enter overpayment attributable to excise tax on specified federal procurement payments
							<span class="sty1042DotLn">......</span>
						</div>
						<div class="styLNRightNumBox">70b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FedPrcmntPymtExciseTaxOvpmtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 71 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">71</div>
						<div class="styLNDesc" style="height:auto;line-height:1.5;">
							Apply overpayment (sum of lines 70a and 70b) to <strong>(check one)</strong>: <br />
							<input type="checkbox" class="styCkboxNM" style="" alt="Credit on Form 1042">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form1042CreditInd"/>
									<xsl:with-param name="BackupName">F1042Form1042CreditInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Credit on 2023 Form 1042
							<span style="width:10mm;text-align:center;"> or </span>
							<input type="checkbox" class="styCkboxNM" style="" alt="Refund Overpayment">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">F1042RefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Refund
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="width:18mm;">Section 2</div>
						<div class="styPartDesc" style="width:168mm;">
							Reconciliation of Payments of U.S. Source FDAP Income
						</div>
					</div>
					<!-- Section 2, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Total U.S. source FDAP income required to be withheld upon under chapter 4
							<span class="sty1042DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotChap4USSrceFDAPIncmWthldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section 2, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;">
							Total U.S. source FDAP income required to be reported under chapter 4 but not required to be withheld upon under chapter 4 because: 
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7.4mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc">
							Amount of income paid to recipients whose chapter 4 status established no withholding is required
							<span class="sty1042DotLn">...</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Chap4NoWHRqdRcpntIncmPdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Amount of excluded nonfinancial payments
							<span class="sty1042DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcludedNonfinancialPymtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							Amount of income paid with respect to grandfathered obligations
							<span class="sty1042DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">2c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrandfatheredObligIncmPdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc">
							Amount of income effectively connected with the conduct of a trade or business in the U.S.
							<span class="sty1042DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">2d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USBusinessOrTradeECIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc" style="height:auto;">
							Total U.S. source FDAP income required to be reported under chapter 4 but not required to be withheld upon under chapter 4 (add lines 2a-2d)
							<span class="sty1042DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />2e</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotUSSrceFDAPNotWthldChap4Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section 2, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Total U.S. source FDAP income reportable under chapter 4 (add lines 1 and 2e)
							<span class="sty1042DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotUSSrceFDAPChap4IncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section 2, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Total U.S. source FDAP income reported on all Forms 1042-S (from line 62a, (b)(1), and (b)(2))
							<span class="sty1042DotLn">....</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotUSSrceFDAP1042SRptIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section 2, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Total variance, subtract line 3 from line 4; if amount other than zero, provide explanation on line 6
							<span class="sty1042DotLn">...</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalVarianceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="border-bottom:1px solid black;height:auto;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TotalVarianceExplanationTxt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="border-bottom:1px solid black;height:auto;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="border-bottom:1px solid black;height:auto;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="border-bottom:1px solid black;height:auto;">&nbsp;</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;margin-top:3mm;">
						<div class="styPartName" style="width:18mm;">Section 3</div>
						<div class="styPartDesc" style="width:168mm;">
							Potential Section 871(m) Transactions
						</div>
					</div>
					<div class="styStdDiv" style="padding:2px 0px;">
						Check here if any payments (including gross proceeds) were made by the withholding agent under a potential section 871(m) transaction, <br />
						including a notional principal contract or other derivatives contract that references (in whole or in part) a U.S. stock or other underlying <br />
						security. See instructions 
						<span class="sty1042DotLn" style="float:none;margin-left:5px;">....................................</span>
						<input type="checkbox" class="styCkboxNM" style="margin-top:-2px;" alt="Section 871 m transaction payment">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/Sect871mTransPaymentInd"/>
								<xsl:with-param name="BackupName">F1042Sect871mTransPaymentInd</xsl:with-param>
							</xsl:call-template>
						</input>
					</div>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="width:18mm;">Section 4</div>
						<div class="styPartDesc" style="width:168mm;">
							Dividend Equivalent Payments by a Qualified Derivatives Dealer (QDD)
						</div>
					</div>
					<div class="styStdDiv" style="padding:2px 0px;">
						Check here if any payments were made by a QDD 
						<span class="sty1042DotLn" style="float:none;margin-left:9px;">............................</span>
						<input type="checkbox" class="styCkboxNM" style="" alt="qualified derivatives dealer payment">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedDerivativePaymentInd"/>
								<xsl:with-param name="BackupName">F1042QualifiedDerivativePaymentInd</xsl:with-param>
							</xsl:call-template>
						</input><br />
						If box is checked, you must: <br />
						(1) Attach Schedule Q (Form 1042). See instructions.
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedDerivativePaymentInd"/>
						</xsl:call-template><br />
						(2) Enter the EIN (not the QI-EIN) of the QDD &#9658; 
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$FormData/QDDEIN"/>
						</xsl:call-template>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>1042</strong> (2022)</span>
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
						<xsl:for-each select="$FormData/SpecialConditionDesc">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="."/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description <xsl:value-of select="position()"/></xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherEntityTypeInd/@entityTypeTxt"/>
							<xsl:with-param name="Desc">Line C(5) - Entity Type Explanation</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt/@form4684Cd"/>
							<xsl:with-param name="Desc">Part I, Line 6 - Form 4684 Code</xsl:with-param>
						</xsl:call-template>
					</table>
					<xsl:if test="$FormData/OtherIncomeDescAndAmt">
						<br /><br />
						<span class="styRepeatingDataTitle">Part I, Line 7 - Other Income Type and Amount</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:60mm;font-weight:normal;">
										Other Income Description
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										Other Income Amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherIncomeDescAndAmt">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="US13DigitAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/OtherNontxIncmDescAndAmt">
						<br /><br />
						<span class="styRepeatingDataTitle">Part I, Line 15 - Other nontaxable income type and amount</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:60mm;font-weight:normal;">
										Other Nontaxable Income Description
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										Other Nontaxable Income Amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherNontxIncmDescAndAmt">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="US13DigitAmt"/>
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
	<xsl:template name="F1042MonthRowGroup">
		<xsl:param name="StartRow"/>
		<xsl:param name="Month"/>
		<xsl:param name="FinalDay"/>
		<xsl:param name="TN1"/>
		<xsl:param name="TN2"/>
		<xsl:param name="TN3"/>
		<xsl:param name="TN4"/>
		<xsl:param name="TNE"/>
		<tr>
			<th class="sty1042TblNumCell" scope="row" style=""><xsl:value-of select="$StartRow"/></th>
			<td class="styTableCellCtrInherit" rowspan="4" style="vertical-align:center;font-size:9pt;"><xsl:value-of select="$Month"/></td>
			<td class="sty1042TblDayCell" style="">7</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TN1"/>
				</xsl:call-template>
			</td>
		</tr>
		<tr>
			<th class="sty1042TblNumCell" scope="row" style=""><xsl:value-of select="$StartRow + 1"/></th>
			<td class="sty1042TblDayCell" style="">15</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TN2"/>
				</xsl:call-template>
			</td>
		</tr>
		<tr>
			<th class="sty1042TblNumCell" scope="row" style=""><xsl:value-of select="$StartRow + 2"/></th>
			<td class="sty1042TblDayCell" style="">22</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TN3"/>
				</xsl:call-template>
			</td>
		</tr>
		<tr>
			<th class="sty1042TblNumCell" scope="row" style=""><xsl:value-of select="$StartRow + 3"/></th>
			<td class="sty1042TblDayCell" style="border-bottom-width:1px;"><xsl:value-of select="$FinalDay"/></td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TN4"/>
				</xsl:call-template>
			</td>
		</tr>
		<tr>
			<th class="sty1042TblNumCell" scope="row" style=""><xsl:value-of select="$StartRow + 4"/></th>
			<td class="styTableCellCtrInherit" colspan="2" style=""><xsl:value-of select="$Month"/> total</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TNE"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
