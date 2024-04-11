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
	<xsl:include href="IRS5227Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS5227" />
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
				<meta name="Description" content="IRS Form 5227" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5227Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form5227">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:27mm;height:22.7mm;">
							Form <span class="styFN" style="font-size:18pt;">5227</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<br />
							<span class="styAgency" style="padding-top:2mm;">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:133mm;height:22.7mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:0.2mm;padding-bottom:0.5mm;">
								Split-Interest Trust Information Return
							</span><br />
							<span style="font-weight:bold;margin-top:1.5mm;">
								&#9658;See separate instructions.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form5227</span>
								for instructions and the latest information.
							</span><br />
							<span style="font-weight:bold;font-family:Arial;">
								&#9658;Do not enter social security numbers on this form (except on Schedule A) as it may be made public.
							</span><br />
							<span style="font-weight:bold;padding-top:2mm;">
								For calendar year 2022 or other tax year beginning 
								<span style="width:20mm;text-align:center;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>
								and ending 
								<span style="width:20mm;text-align:center;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
							</span>
						</div>
						<div class="styTYBox" style="width:27mm;height:22.7mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0196</div>
							<div class="styTY">20<span class="styTYColor">22</span></div>
							<div style="text-align:center;background-color:black;font-size:8pt;padding:0.5mm;">
								<span class="styBoldText" style="color:white">Open to Public Inspection</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styGenericDiv" style="height:auto;width:127mm;border-right:1px solid black;border-top:1px solid black;">
						<div class="sty5227HeaderCell" style="height:10mm;width:100%;">
							<strong>A </strong> Full name of trust
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="sty5227HeaderCell" style="height:10mm;width:100%;">
							Name of trustee
							<br />
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/TrusteeBusinessName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TrusteeBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TrusteeBusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TrusteePersonNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="sty5227HeaderCell" style="height:10mm;width:100%;">
							<span>Number, street, and room or suite no. (If a P.O. box, see the instructions.)</span>
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
						<div class="sty5227HeaderCell" style="width:60%;height:7.5mm;border-left:none;border-top-width:1px;border-bottom-width:0px;">
							<strong>D</strong>
							Fair market value (FMV) of assets at end of tax year<br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FMVAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227HeaderCell" style="width:40%;height:7.5mm;border-left:1px solid black;border-top-width:1px;border-bottom-width:0px;">
							<strong>E</strong>
							Gross income<br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styGenericDiv" style="height:auto;width:60mm;border-top:1px solid black;">
						<div class="styEINBox" style="width:100%;height:10mm;padding-left:1mm;font-weight:normal;border-bottom:1px solid black;font-size:inherit;">
							<strong>B <span style="font-family:Arial;font-size:6pt;"> Employer identification number</span></strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"><xsl:with-param name="EINChanged" select="true()"/></xsl:call-template>
						</div>
						<div class="sty5227HeaderCell" style="width:100%;height:auto;border-left-width:0px;border-bottom-width:0px;padding-top:2px;">
							<strong>C &nbsp; Type of Entity</strong><br />
							<span style="font-weight:bold;margin-left:4mm;width:6mm;">(1)</span>
							<input type="checkbox" class="styCkboxNM" style="" alt="Charitable Lead Trust Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CharitableLeadTrustInd"/>
									<xsl:with-param name="BackupName">CharitableLeadTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Charitable lead trust
							<br style="line-height:2.5;" />
							<span style="font-weight:bold;margin-left:4mm;width:6mm;float:left;">(2)</span>
							<input type="checkbox" class="styCkboxNM" style="float:left;" alt="Charitable Remainder Annuity Trust Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ChrtblRemainderAnnuityTrustInd"/>
									<xsl:with-param name="BackupName">ChrtblRemainderAnnuityTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:45mm;padding-left:4px;float:left;">Charitable remainder annuity trust described in section 664(d)(1)</span>
							<br style="line-height:2.5;" />
							<span style="font-weight:bold;margin-left:4mm;width:6mm;float:left;">(3)</span>
							<input type="checkbox" class="styCkboxNM" style="float:left;" alt="Charitable Remainder Unitrust Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ChrtblRemainderUnitrustInd"/>
									<xsl:with-param name="BackupName">ChrtblRemainderUnitrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:45mm;padding-left:4px;float:left;">Charitable remainder unitrust described in section 664(d)(2)</span>
							<br style="line-height:2.5;" />
							<span style="font-weight:bold;margin-left:4mm;width:6mm;float:left;">(4)</span>
							<input type="checkbox" class="styCkboxNM" style="float:left;" alt="Pooled Income Fund Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PooledIncomeFundInd"/>
									<xsl:with-param name="BackupName">PooledIncomeFundInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:45mm;padding-left:4px;float:left;">Pooled income fund described in section 642(c)(5)</span>
							<br style="line-height:2.5;" />
							<span style="font-weight:bold;margin-left:4mm;width:6mm;float:left;">(5)</span>
							<input type="checkbox" class="styCkboxNM" style="float:left;" alt="Other Entity Type Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherEntityTypeInd"/>
									<xsl:with-param name="BackupName">OtherEntityTypeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:45mm;padding-left:4px;float:left;">
								Other &mdash; Attach explanation
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherEntityTypeInd/@entityTypeTxt"/>
									<xsl:with-param name="Desc">Line C(5) - Entity Type Explanation</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty5227LeftLtrBox">F</div>
						<div class="styGenericDiv" style="width:27mm;padding:1px;">
							<strong>Check applicable boxes </strong> (see instructions)
						</div>
						<div class="styGenericDiv" style="width:96mm;border-right:1px solid black;padding:1px;">
							<input type="checkbox" class="styCkboxNM" alt="Initial Return">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
									<xsl:with-param name="BackupName">InitialReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:27mm;padding-left:3px;">
								Initial return 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
								</xsl:call-template>
							</span>
							<input type="checkbox" class="styCkboxNM" alt="Final Return" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
									<xsl:with-param name="BackupName">FinalReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:18.7mm;padding-left:4px;">
								Final return
							</span>
							<input type="checkbox" class="styCkboxNM" alt="Amended Return" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">AmendedReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="font-family:Arial Narrow;padding-left:3px;">Amended return incl. amdnded K-1s, if nec.</span>
							<br style="line-height:2;" />
							<span style="width:30mm;">
								Change in trustee's &#9658;
							</span>
							<input type="checkbox" class="styCkboxNM" alt="Trustee Name Change" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TrusteeNameChangeInd"/>
									<xsl:with-param name="BackupName">TrusteeNameChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Name
							<input type="checkbox" class="styCkboxNM" alt="Trustee Address Change" style="margin-left:10mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TrusteeAddressChangeInd"/>
									<xsl:with-param name="BackupName">TrusteeAddressChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Address
							<span style="float:right;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv" style="width:59.8mm;padding:2px;">
							<strong>G </strong> Date the trust was created <br />
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustCreateDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="">
							Income and Deductions <span style="font-weight:normal;"> (All trusts complete Sections A through D)</span>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:4.4mm;font-size:8pt;font-weight:bold;text-align:center;">
							Section A &mdash; Ordinary Income
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.4mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="">
							Interest income
							<span class="sty5227DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="styLNDesc">
							Ordinary dividends (including qualified dividends)
							<span class="sty5227DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;">
							Qualified dividends (see instructions)
							<span class="sty5227DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Business income or (loss). Attach Schedule C (Form 1040)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NetProfitOrLossAmt"/>
							</xsl:call-template>
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetProfitOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Rents, royalties, partnerships, other estates and trusts, etc. Attach Schedule E (Form 1040)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NetRentalIncomeOrLossAmt"/>
							</xsl:call-template>
							<span class="sty5227DotLn">....</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetRentalIncomeOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Farm income or (loss). Attach Schedule F (Form 1040)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
							</xsl:call-template>
							<span class="sty5227DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							Ordinary gain or (loss). Attach Form 4797
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt/@form4684Cd"/>
								<xsl:with-param name="Desc">Part I, Line 6 - Form 4684 Code</xsl:with-param>
							</xsl:call-template>
							<span class="sty5227DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="">
							Other income. List type and amount &#9658; 
							<span style="width:80mm;padding-left:1px;border-bottom:1px dashed black;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeDescAndAmt"/>
									<xsl:with-param name="Desc">Part I, Line 7 - Other income type and amount</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;">7</div>
						<div class="styLNAmountBox" style="height:auto;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							<strong>Total ordinary income. </strong> Combine lines 1, 2a, and 3 through 7
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
							</xsl:call-template>
							<span class="sty5227DotLn" style="margin-right:-6px;">.............&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">8</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:4.4mm;font-size:8pt;font-weight:bold;text-align:center;">
							Section B &mdash; Capital Gains (Losses)
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.4mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Total short-term capital gain or (loss). Attach Schedule D, Part I (Form 1041)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
							<span class="sty5227DotLn">........</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotSTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Total long-term capital gain or (loss). Attach Schedule D, Part II (Form 1041)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotLTCapitalGainOrLossAmt"/>
							</xsl:call-template>
							<span class="sty5227DotLn">........</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotLTCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:98mm;">
							Unrecaptured section 1250 gain
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250GainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Part 1, Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:98mm;">
							28% gain
							<span class="sty5227DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Collectibles28PercentGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Part 1, Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							<strong>Total capital gains (losses). </strong> Combine lines 9 and 10
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetGainOrLossAmt"/>
							</xsl:call-template>
							<span class="sty5227DotLn" style="margin-right:-6px;">...............&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">13</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:4.4mm;font-size:8pt;font-weight:bold;text-align:center;">
							Section C &mdash; Nontaxable Income
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.4mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc">
							Tax-exempt interest
							<span class="sty5227DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="">
							Other nontaxable income. List type and amount &#9658; 
							<span style="width:70mm;padding-left:1px;border-bottom:1px dashed black;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherNontxIncmDescAndAmt"/>
									<xsl:with-param name="Desc">Part I, Line 15 - Other nontaxable income type and amount</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;">15</div>
						<div class="styLNAmountBox" style="height:auto;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOtherNontaxableIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc">
							<strong>Total nontaxable income. </strong> Combine lines 14 and 15
							<span class="sty5227DotLn" style="margin-right:-6px;">................&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">16</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNontaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:4.4mm;font-size:8pt;font-weight:bold;text-align:center;">
							Section D &mdash; Deductions
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.4mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc">
							Interest
							<span class="sty5227DotLn">...............................</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc">
							Taxes (see the instructions)
							<span class="sty5227DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc">
							Trustee fees
							<span class="sty5227DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">19</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TrusteeFeesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc">
							Attorney, accountant, and return preparer fees
							<span class="sty5227DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxPreparationFeesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc">
							Other allowable deductions. Attach statement (see the instructions)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
							</xsl:call-template>
							<span class="sty5227DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">21</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc">
							<strong>Total. </strong> Add lines 17 through 21
							<span class="sty5227DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">22</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:98mm;">
							Charitable deduction
							<span class="sty5227DotLn">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB">23</div>
						<div class="styLNAmountBoxNBB" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CharitableDeductionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:4.4mm;font-size:8pt;font-weight:bold;text-align:center;">
							Section E &mdash; Deductions Allocable to Income Categories <span style="font-weight:normal;">(Section 664 trust only)</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.4mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 24a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">24a</div>
						<div class="styLNDesc">
							Enter the amount from line 22 allocable to ordinary income
							<span class="sty5227DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">24a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDedAllcblOrdnryIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 24b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Subtract line 24a from line 8
							<span class="sty5227DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">24b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetOrdinaryIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 25a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25a</div>
						<div class="styLNDesc">
							Enter the amount from line 22 allocable to capital gains (losses)
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">25a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDedAllcblCapitalGainLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 25b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Subtract line 25a from line 13
							<span class="sty5227DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">25b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCapitalGainOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 26a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26a</div>
						<div class="styLNDesc">
							Enter the amount from line 22 allocable to nontaxable income
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">26a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotDedAllcblNontaxableIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 26b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Subtract line 26a from line 16
							<span class="sty5227DotLn">........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">26b</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetNontaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 13227T</span>
						<span style="float:right;">Form <strong>5227</strong> (2022)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 5227 (2022)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:0px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="">
							Schedule of Distributable Income 
							<span style="font-weight:normal;">(Section 664 trust only) (See instructions)</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:65mm;text-align:center;">
							Accumulations
						</div>
						<div class="styLNDesc" style="width:38mm;text-align:center;border-left:1px solid black;"><strong>(a) </strong> Ordinary income</div>
						<div class="styLNDesc" style="width:38mm;text-align:center;border-left:1px solid black;"><strong>(b) </strong> Capital gains (losses)</div>
						<div class="styLNDesc" style="width:38mm;text-align:center;border-left:1px solid black;"><strong>(c) </strong> Nontaxable income</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:65mm;text-align:center;height:8mm;padding-top:2mm;">
							Net Investment Income (NII) Classification
						</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Excluded <br /> Income</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Accumulated <br /> NII post 2012</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Excluded <br /> Income</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Accumulated <br /> NII post 2012</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Excluded <br /> Income</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Accumulated <br /> NII post 2012</div>
					</div>
					<!-- Part 2, Line 1 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:65mm;">
							Undistributed income from prior tax years 
							<span class="sty5227DotLn">..</span>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncmPriorTYGrp/OrdnryIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncmPriorTYGrp/OrdnryIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncmPriorTYGrp/CapGainLossExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncmPriorTYGrp/CapGainLossAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncmPriorTYGrp/NontxIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncmPriorTYGrp/NontxIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 2 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:65mm;height:13.2mm;">
							Current tax year net income (before distributions):
							<ul style="padding-left:12px;margin-top:1px;margin-bottom:0px;font-family:Arial;">
								<li>In column (a), enter the amount from Part I, line 24b</li>
								<li>In column (b), enter the amount from Part I, line 25b</li>
								<li>In column (c), enter the amount from Part I, line 26b</li>
							</ul>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:13.2mm;padding-top:9.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrTYNetIncmBfrDistriGrp/OrdnryIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:13.2mm;padding-top:9.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrTYNetIncmBfrDistriGrp/OrdnryIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:13.2mm;padding-top:9.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrTYNetIncmBfrDistriGrp/CapGainLossExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:13.2mm;padding-top:9.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrTYNetIncmBfrDistriGrp/CapGainLossAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:13.2mm;padding-top:9.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrTYNetIncmBfrDistriGrp/NontxIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:13.2mm;padding-top:9.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrTYNetIncmBfrDistriGrp/NontxIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:65mm;">
							Total distributable income. Add lines 1 and 2
							<span class="sty5227DotLn">.</span>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/OrdnryIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/OrdnryIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/CapGainLossExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/CapGainLossAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/NontxIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/NontxIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Distributions of Principal for Charitable Purposes
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:4.4mm;font-size:8pt;font-weight:bold;text-align:center;">
							Section A
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Part 3, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="">
							Principal distributed in prior tax years for charitable purposes
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrincipalDistributedPriorTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;">
							Principal distributed during the current tax year for charitable purposes. Fill in the information for <br /> columns (A), (B), and (C) 
							and enter the amount distributed on the space to the right. (see the instructions)
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:11mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<xsl:variable name="CharCount" select="count($FormData/PrinDistributedPayeeCurrTYGrp)"/>
					<xsl:variable name="SepChar" select="($Print = $Separated) and ($CharCount &gt; 3)"/>
					<div class="styStdDiv">
						<table style="display:table;border-collapse:collapse;width:186mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:6mm;font-weight:bold;border-top-width:0px;border-right-width:0px;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" style="width:60mm;font-weight:normal;border-top-width:0px;border-right-width:0px;">
										(A) <br /> Payee's name and address
									</th>
									<th class="styTableCellHeader" scope="col" style="width:22mm;font-weight:normal;border-top-width:0px;border-right-width:0px;">
										(B) <br /> Date of distribution
									</th>
									<th class="styTableCellHeader" scope="col" style="width:59.0mm;font-weight:normal;border-top-width:0px;">
										(C) <br /> Charitable purpose and description of assets distributed
									</th>
									<th class="styTableCellHeader" scope="col" style="width:8.0mm;font-weight:normal;background-color:lightgrey;border-top:1px solid lightgrey;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32.0mm;font-weight:normal;background-color:lightgrey;border-top:1px solid lightgrey;border-right-width:0px;">
										&nbsp;
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($SepChar)">
									<xsl:for-each select="$FormData/PrinDistributedPayeeCurrTYGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
												<xsl:number value="position()" format="a"/>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="BusinessName/BusinessNameLine2Txt">
															<br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
												<br />
												<xsl:choose>
													<xsl:when test="ForeignAddress">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DistributionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ChrtblPurposeAssetsDistriDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												2<xsl:number value="position()" format="a"/>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($CharCount &lt; 1) or $SepChar">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
											a
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											<xsl:if test="$SepChar">See Additional Data</xsl:if>
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											2a
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($CharCount &lt; 2) or $SepChar">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
											b
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											2b
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($CharCount &lt; 3) or $SepChar">
									<tr>
										<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
											c
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											2c
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 3, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="">
							<strong>Attachment total</strong>
							<span class="sty5227DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="">3</div>
						<div class="styLNAmountBox" style="">&nbsp;</div>
					</div>
					<!-- Part 3, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="">
							<strong>Total. </strong> Add lines 1 through 3
							<span class="sty5227DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="">4</div>
						<div class="styLNAmountBoxNBB" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPrincipalDistributedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="padding:2px 2px 2px 20mm;border-bottom:1px solid black;border-top:2px solid black;font-size:8pt;">
						<strong>Accumulated Income Set Aside and Income Distributions for Charitable Purposes</strong><br />
						Grantor type trusts complete only lines 7 through 9 (see instructions)
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:4.4mm;font-size:8pt;font-weight:bold;text-align:center;">
							Section B
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Part 3, Line 5a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5a</div>
						<div class="styLNDesc" style="">
							Income set aside in prior tax years for which a deduction was claimed under section 642(c)
							<span class="sty5227DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">5a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeSetAsidePriorTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 5b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="">
							Enter the amount shown on Part I, line 23
							<span class="sty5227DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">5b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CharitableDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="">
							Add lines 5a and 5b
							<span class="sty5227DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotIncmSetAsideChrtblDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="height:auto;">
							Distributions made during the tax year (see the instructions): <br />
							<ul style="padding-left:12px;margin-top:1mm;margin-bottom:1mm;">
								<li>For income set aside in prior tax years for which a deduction was claimed under section 642(c), </li>
								<li>For charitable purposes for which a charitable deduction was claimed under section 642(c) in the current tax year, or </li>
								<li>For charitable purposes by a grantor type trust for which a charitable deduction was claimed under section 170 upon contribution to the trust</li>
							</ul>
							Fill in the information for columns (A), (B), and (C) 
							and enter the amount distributed on the line to the right. 
						</div>
						<div class="styLNRightNumBoxNBB" style="height:25mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:25mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<xsl:variable name="SetAsideCount" select="count($FormData/AccumIncmSetAsideDistriTYGrp)"/>
					<xsl:variable name="SepSetAside" select="($Print = $Separated) and ($SetAsideCount &gt; 3)"/>
					<div class="styStdDiv">
						<table style="display:table;border-collapse:collapse;width:186mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:6mm;font-weight:bold;border-top-width:0px;border-right-width:0px;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" style="width:60mm;font-weight:normal;border-top-width:0px;border-right-width:0px;">
										(A) <br /> Payee's name and address
									</th>
									<th class="styTableCellHeader" scope="col" style="width:22mm;font-weight:normal;border-top-width:0px;border-right-width:0px;">
										(B) <br /> Date of distribution
									</th>
									<th class="styTableCellHeader" scope="col" style="width:58.1mm;font-weight:normal;border-top-width:0px;">
										(C) <br /> Charitable purpose and description of assets distributed
									</th>
									<th class="styTableCellHeader" scope="col" style="width:8.0mm;font-weight:normal;background-color:lightgrey;border-top:1px solid lightgrey;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32.0mm;font-weight:normal;background-color:lightgrey;border-top:1px solid lightgrey;border-right-width:0px;">
										&nbsp;
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($SepSetAside)">
									<xsl:for-each select="$FormData/AccumIncmSetAsideDistriTYGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
												<xsl:number value="position()" format="a"/>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="BusinessName/BusinessNameLine2Txt">
															<br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
												<br />
												<xsl:choose>
													<xsl:when test="ForeignAddress">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DistributionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ChrtblPurposeAssetsDistriDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												7<xsl:number value="position()" format="a"/>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($SetAsideCount &lt; 1) or $SepSetAside">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
											a
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											<xsl:if test="$SepSetAside">See Additional Data</xsl:if>
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											7a
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($SetAsideCount &lt; 2) or $SepSetAside">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
											b
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											7b
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($SetAsideCount &lt; 3) or $SepSetAside">
									<tr>
										<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
											c
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											7c
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 3, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="">
							<strong>Attachment total</strong>
							<span class="sty5227DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="">8</div>
						<div class="styLNAmountBox" style="">&nbsp;</div>
					</div>
					<!-- Part 3, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="">
							Add lines 7a through 8
							<span class="sty5227DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="">9</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotIncmSetAsideIncmDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="">
							Carryover. Subtract line 9 from line 6
							<span class="sty5227DotLn">......................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="">10</div>
						<div class="styLNAmountBoxNBB" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncmSetAsideIncmDistriCyovAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>5227</strong> (2022)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 5227 (2022)
						<div style="float:right;">Page <strong>3</strong></div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:0px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="">
							Balance Sheet
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:90mm;height:8mm;padding-left:20mm;font-weight:bold;padding-top:1.5mm;font-size:8pt;">Assets</div>
						<div class="styLNRightNumBox" style="height:8mm;border-left-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="height:8mm;text-align:center;"><strong>(a) </strong> Beginning-of-Year Book Value</div>
						<div class="sty5227AmountBox" style="height:8mm;text-align:center;"><strong>(b) </strong> End-of-Year Book Value</div>
						<div class="sty5227AmountBox" style="height:8mm;text-align:center;"><strong>(c) </strong> FMV (see the instructions)</div>
					</div>
					<!-- Part 4, Line 1 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:90mm;">
							Cash &mdash; non-interest-bearing
							<span class="sty5227DotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CashBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CashEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CashFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 2 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:90mm;">
							Savings and temporary cash investments
							<span class="sty5227DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="">2</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/SavAndTempCashInvstBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/SavAndTempCashInvstEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/SavAndTempCashInvstFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 3a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="styLNDesc" style="width:55mm;">
							Accounts receivable
							<span class="sty5227DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="">3a</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/AccountsReceivableAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 3a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:55mm;">
							Less: allowance for doubful accounts
							<span class="sty5227DotLn">.</span>
						</div>
						<div class="styLNRightNumBox" style="">3b</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/AcctRcvblAllwncDbtflAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/AcctRcvblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/AcctRcvblEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/AcctRcvblFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 4 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:90mm;height:7.2mm;">
							Receivables due from officers, directors, trustees, and other disqualified persons (attach statement)
							<span class="sty5227DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />4</div>
						<div class="sty5227AmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/RcvblFromOfficersBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox" style="height:7.2mm;"><br />
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/RcvblFromOfficersEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/RcvblFromOfficersEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/RcvblFromOfficersFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 5a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">5a</div>
						<div class="styLNDesc" style="width:55mm;">
							Other notes and loans receivable
							<span class="sty5227DotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="">5a</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherNtsAndLoansRcvblAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 5b -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:55mm;">
							Less: allowance for doubful accounts
							<span class="sty5227DotLn">.</span>
						</div>
						<div class="styLNRightNumBox" style="">5b</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherRcvblAllwncDbtflAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherNtsAndLoansRcvblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherNtsAndLoansRcvblEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherNtsAndLoansRcvblEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherNtsAndLoansRcvblFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 6 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:90mm;">
							Inventories for sale or use
							<span class="sty5227DotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="">6</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/InventoriesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/InventoriesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/InventoriesFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 7 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:90mm;">
							Prepaid expenses and deferred charges
							<span class="sty5227DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="">7</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/PrepaidExpensesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/PrepaidExpensesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/PrepaidExpensesFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 8a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">8a</div>
						<div class="styLNDesc" style="width:90mm;font-family:Arial;padding-top:0.8mm;">
							Investments &mdash; U.S. and state government obligations (attach statement)
							<span class="sty5227DotLn" style="font-family:Verdana">..</span>
						</div>
						<div class="styLNRightNumBox" style="">8a</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/USGovernmentObligationsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/USGovernmentObligationsEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/USGovernmentObligationsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/USGovtObligationsFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 8b -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:90mm;">
							Investments &mdash; corporate stock (attach statement)
							<span class="sty5227DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="">8b</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CorporateStockBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CorporateStockEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CorporateStockEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CorporateStockFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 8c -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:90mm;">
							Investments &mdash; corporate bonds (attach statement)
							<span class="sty5227DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="">8c</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CorporateBondsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CorporateBondsEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CorporateBondsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/CorporateBondsFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 9a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">9a</div>
						<div class="styLNDesc" style="width:55mm;height:7.2mm;">
							Investments &mdash; land, buildings, and equipment: basis (attach statement)
							<span class="sty5227DotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />9a</div>
						<div class="sty5227AmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/InvstLandCostOrOtherBasisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox" style="height:7.2mm;background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="height:7.2mm;background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="height:7.2mm;background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 9b -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:55mm;">
							Less: accumulated depreciation
							<span class="sty5227DotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="">9b</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/InvstLandAccumDepreciationAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandBldgInvestmentsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandBldgInvestmentsEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandBldgInvestmentsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandBldgInvestmentsFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 10 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">10</div>
						<div class="styLNDesc" style="width:90mm;">
							Investments &mdash; other (attach statement)
							<span class="sty5227DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="">10</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherInvestmentsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherInvestmentsEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherInvestmentsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherInvestmentsFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 11a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox">11a</div>
						<div class="styLNDesc" style="width:55mm;">
							Land, buildings, and equipment: basis
							<span class="sty5227DotLn">.</span>
						</div>
						<div class="styLNRightNumBox" style="">11a</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandBldgEquipCostOrOtherBssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 11b -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:55mm;">
							Less: accumulated depreciation
							<span class="sty5227DotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="">11b</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandBldgEquipAccumDeprecAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LandFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 12 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">12</div>
						<div class="styLNDesc" style="width:90mm;">
							Other assets. Describe &#9658;
							<span style="width:50mm;border-bottom:1px dashed black;">&nbsp;</span>
						</div>
						<div class="styLNRightNumBox" style="">12</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherAssetsBOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherAssetsEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherAssetsFMVAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherAssetsFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 13 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">13</div>
						<div class="styLNDesc" style="width:90mm;">
							<strong>Total assets. </strong> Add lines 1 through 12 (must equal line 23)
							<span class="sty5227DotLn" style="margin-right:-5px;">..&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="">13</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalAssetsFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:90mm;padding-left:20mm;font-weight:bold;">Liabilities</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 14 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">14</div>
						<div class="styLNDesc" style="width:90mm;">
							Accounts payable and accrued expenses
							<span class="sty5227DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="">14</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/AccountsPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/AccountsPayableEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/AccountsPayableFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 15 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">15</div>
						<div class="styLNDesc" style="width:90mm;">
							Deferred revenue
							<span class="sty5227DotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="">15</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/DeferredRevenueBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/DeferredRevenueEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/DeferredRevenueFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 16 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">16</div>
						<div class="styLNDesc" style="width:90mm;">
							Loans from officers, directors, trustees, and other disqualified persons
							<!--<span class="sty5227DotLn">.........</span>-->
						</div>
						<div class="styLNRightNumBox" style="">16</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LoansFromOfficersBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LoansFromOfficersEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LoansFromOfficersEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/LoansFromOfficersFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 17 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">17</div>
						<div class="styLNDesc" style="width:90mm;">
							Mortgages and other notes payable (attach statement)
							<span class="sty5227DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="">17</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/MortgagesAndNotesPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/MortgagesAndNotesPayableEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/MortgagesAndNotesPayableEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/MortgagesAndNotesPyblFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 18 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">18</div>
						<div class="styLNDesc" style="width:90mm;">
							Other liabilities. Describe &#9658;
							<span style="width:50mm;border-bottom:1px dashed black;">&nbsp;</span>
						</div>
						<div class="styLNRightNumBox" style="">18</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherLiabilitiesBOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherLiabilitiesEOYAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherLiabilitiesFMVAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/OtherLiabilitiesFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 19 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">19</div>
						<div class="styLNDesc" style="width:90mm;">
							<strong>Total liabilities. </strong> Add lines 14 through 18
							<span class="sty5227DotLn" style="margin-right:-5px;">.......&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="">19</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalLiabilitiesFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:90mm;padding-left:20mm;font-weight:bold;">Net Assets</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 20 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">20</div>
						<div class="styLNDesc" style="width:90mm;">
							Trust principal or corpus
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="">20</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TrustPrincipalOrCorpusBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TrustPrincipalOrCorpusEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 21a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">21a</div>
						<div class="styLNDesc" style="width:90mm;">
							Undistributed income
							<span class="sty5227DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="">21a</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/UndistributedIncomeBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/UndistributedIncomeEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 21b -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:90mm;">
							Undistributed capital gains
							<span class="sty5227DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="">21b</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/UndistributedCapGainsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/UndistributedCapGainsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 21c -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:90mm;">
							Undistributed nontaxable income
							<span class="sty5227DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="">21c</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/UndistributedNontxIncmBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/UndistributedNontxIncmEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 22 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">22</div>
						<div class="styLNDesc" style="width:90mm;">
							<strong>Total net assets. </strong> Add lines 20 through 21c
							<span class="sty5227DotLn">........</span>
						</div>
						<div class="styLNRightNumBox" style="">22</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalNetAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalNetAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 23 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="">23</div>
						<div class="styLNDesc" style="width:90mm;">
							<strong>Total liabilities and net assets. </strong> Add lines 19 and 22
							<span class="sty5227DotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB">23</div>
						<div class="sty5227AmountBox" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalLiabilitiesNetAstBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form5227BalanceSheetGrp/TotalLiabilitiesNetAstEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBox" style="border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>5227</strong> (2022)</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 5227 (2022)
						<div style="float:right;">Page <strong>4</strong></div>
					</div>
					<!-- Part 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:0px solid black;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc" style="">
							Charitable Remainder Annuity Trust (CRAT) Information 
							<span style="font-weight:normal;">(to be completed <strong>only</strong> by a Section 664 CRAT)</span>
						</div>
					</div>
					<!-- Part 5, Line 1a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="styLNDesc">
							Enter the initial fair market value (FMV) of the property placed in the trust
							<span class="sty5227DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InitialFMVTrustPropertyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 5, Line 1b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Enter the total annual annuity amounts for all recipients
							<span class="sty5227DotLn">................</span>
						</div>
						<div class="styLNRightNumBoxNBB">1b</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAnnualAnnuityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 6 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="margin-top:1mm;">Part VI</div>
						<div class="styPartDesc" style="height:auto;">
							Charitable Remainder Unitrust (CRUT) Information 
							<span style="font-weight:normal;display:inline;">(to be completed <strong>only</strong> by a Section 664 CRUT) <br /> (See instructions)</span>
						</div>
					</div>
					<!-- Part 6, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:7.2mm;width:148mm;">
							Is the CRUT a net income charitable remainder unitrust (NICRUT) as described in Regulations section <br /> 1.664-3(a)(1)(i)(b)(1)?
							<span class="sty5227DotLn">............................</span>
						</div>
						<div class="styLNDesc" style="height:7.2mm;width:30mm;padding-top:3mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/NICRUTInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Net Income Charitiable Remainder Unitrust Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NICRUTInd"/>
									<xsl:with-param name="BackupName">F5227NICRUTInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Net Income Charitiable Remainder Unitrust No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NICRUTInd"/>
									<xsl:with-param name="BackupName">F5227NICRUTInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Part 6, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:7.2mm;width:148mm;">
							Is the CRUT a net income with make-up charitable remainder unitrust (NIMCRUT) as described in Regulations <br /> section 1.664-3(a)(1)(i)(b)(2)?
							<span class="sty5227DotLn">..........................</span>
						</div>
						<div class="styLNDesc" style="height:7.2mm;width:30mm;padding-top:3mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/NIMCRUTInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Net Income with make-up Charitiable Remainder Unitrust Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NIMCRUTInd"/>
									<xsl:with-param name="BackupName">F5227NIMCRUTInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Net Income with make-up Charitiable Remainder Unitrust No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NIMCRUTInd"/>
									<xsl:with-param name="BackupName">F5227NIMCRUTInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Part 6, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:4.4mm;width:148mm;padding-top:0.7mm;">
							Did the trust change its method of payment during the tax year?
							<span class="sty5227DotLn">................</span>
						</div>
						<div class="styLNDesc" style="height:4.4mm;width:30mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/PaymentMethodChangeInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Trust Payment Method Change Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PaymentMethodChangeInd"/>
									<xsl:with-param name="BackupName">F5227PaymentMethodChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Trust Payment Method Change No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PaymentMethodChangeInd"/>
									<xsl:with-param name="BackupName">F5227PaymentMethodChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="">
							If "Yes," describe the triggering event including the date of the event and old method of payment &#9658;
						</div>
						<div class="styGenericDiv" style="border-bottom:1px dashed black;width:40mm;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:178mm;height:auto;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PaymentMethodChangeDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:178mm;border-bottom:1px dashed black;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:178mm;border-bottom:1px dashed black;">&nbsp;</div>
					</div>
					<!-- Part 6, Line 4a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="styLNDesc">
							Enter the unitrust fixed percentage to be paid to the recipients
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/FixedBasedPct"/>
							</xsl:call-template>
							<span class="sty5227DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">4a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/FixedBasedPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 6, Line 4b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="height:7.2mm;">
							<strong>Unitrust amount. </strong> Subtract Part IV, line 19, column (c), from Part IV, line 13, column (c), and multiply 
							the result by the percentage on line 4a. Do not enter less than -0-
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />4b</div>
						<div class="styLNAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CRUTAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="font-weight:bold;height:auto;">
							If the answer is "Yes" on line 1 or line 2, go to line 5a. Otherwise, skip lines 5a through 6b and enter the line 4b amount on line 7.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 6, Line 5a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5a</div>
						<div class="styLNDesc">
							Trust's accounting income for 2022. Attach statement
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CYAccountingIncomeAmt"/>
							</xsl:call-template>
							<span class="sty5227DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">5a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYAccountingIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="font-weight:bold;height:auto;">
							If the answer is "Yes" on line 1, go to line 5b. If the answer is "Yes" on line 2, skip line 5b and go to line 6a.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 6, Line 5b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Enter the smaller of line 4b or line 5a here and on line 7. Skip lines 6a and 6b
							<span class="sty5227DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">5b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CRUTOrCYAccountingIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 6, Line 6a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6a</div>
						<div class="styLNDesc">
							Total accumulated distribution deficiencies from previous years (see instructions)
							<span class="sty5227DotLn">........</span>
						</div>
						<div class="styLNRightNumBox">6a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotAccumDistriDefnPrevYrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 6, Line 6b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Add lines 4b and 6a
							<span class="sty5227DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">6b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCRUTAccumDistriDefnPYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="font-weight:bold;">
							If lines 6a and 6b are completed, enter the smaller of line 5a or line 6b on line 7.
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 6, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Required unitrust distribution for 2022
							<span class="sty5227DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnitrustDistrubtionRqrCYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 6, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:7.2mm;">
							Carryover of accumulated distribution deficiency (only for trusts that answered "Yes" on line 2). <br /> 
							Subtract line 7 from line 6b
							<span class="sty5227DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />8</div>
						<div class="styLNAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulatedDistriDefnCyovAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 6, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							If this is the final return, enter the initial FMV of all assets placed in trust by the donor
							<span class="sty5227DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InitialFMVAllAssetsInTrustAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 6, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="height:4.4mm;width:148mm;padding-top:0.7mm;">
							Did the trustee change the method of determining the FMV of the assets?
							<span class="sty5227DotLn">.............</span>
						</div>
						<div class="styLNDesc" style="height:4.4mm;width:30mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/AssetsFMVMethodChangeInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Assets FMV Method Change Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AssetsFMVMethodChangeInd"/>
									<xsl:with-param name="BackupName">F5227AssetsFMVMethodChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Assets FMV Method Change No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AssetsFMVMethodChangeInd"/>
									<xsl:with-param name="BackupName">F5227AssetsFMVMethodChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;">
							If "Yes," attach an explanation. 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AssetsFMVMethodChangeInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 6, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:4.4mm;width:148mm;padding-top:0.7mm;">
							Were any additional contributions received by the trust during 2022?
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNDesc" style="height:4.4mm;width:30mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalContriRcvdCYInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Additional contributions during current year Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AdditionalContriRcvdCYInd"/>
									<xsl:with-param name="BackupName">F5227AdditionalContriRcvdCYInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Additional contributions during current year No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AdditionalContriRcvdCYInd"/>
									<xsl:with-param name="BackupName">F5227AdditionalContriRcvdCYInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;">
							If "Yes," be sure to complete all columns of line 2 in Schedule A, Part V.
						</div>
					</div>
					<!-- Part 7 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part VII</div>
						<div class="styPartDesc" style="">
							Statements Regarding Activities
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							Are the requirements of section 508(e) satisfied either: <br />
							<ul style="padding-left:12px;margin-top:1px;margin-bottom:0px;">
								<li>By the language in the governing instrument; or </li>
								<li>
									By the state legislation that effectively amends the governing instrument so that no 
									mandatory directions that conflict with the state law remain in the governing instrument?
									<span class="sty5227DotLn">...................</span>
								</li>
							</ul>
						</div>
						<div class="styLNRightNumBox" style="border-left-width:0px;">&nbsp;</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm;">&nbsp;</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section508eRqrSatisfiedInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section508eRqrSatisfiedInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 7, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							Are you using this return only to report the income and assets of a segregated amount under section 4947(a)(2)(B)?
							<span class="sty5227DotLn">.</span>
						</div>
						<div class="styLNRightNumBoxNBB">2</div>
						<div class="styLNRightNumBoxNBB" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/RptIncmAstUnderSect4947a2BInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/RptIncmAstUnderSect4947a2BInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>5227</strong> (2022)</span>
					</div>
					<!-- Page 5 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 5227 (2022)
						<div style="float:right;">Page <strong>5</strong></div>
					</div>
					<!-- Part 8 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:0px solid black;">
						<div class="styPartName" style="width:15mm;">Part VIII</div>
						<div class="styPartDesc" style="">
							Statements Regarding Activities for Which Form 4720 May Be Required
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:154mm;font-weight:bold;">
							File Form 4720 if any item is checked in the "Yes" column (to the right), unless an exception applies.
						</div>
						<div class="styLNRightNumBox">&nbsp;</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
					</div>
					<!-- Part 8, Line 1 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							Self-dealing (section 4941): 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							During 2022, did the trust (either directly or indirectly): 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 1a1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;">
							<strong>(1) </strong> Engage in the sale or exchange, or leasing of property with a disqualified person?
							<span class="sty5227DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">1a(1)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/SaleOrExchDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/SaleOrExchDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 1a2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;">
							<strong>(2) </strong> Borrow money from, lend money to, or otherwise extend credit to (or accept it from) a disqualified person?
							<span class="sty5227DotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">1a(2)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/BrrwOrLendDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/BrrwOrLendDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 1a3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;">
							<strong>(3) </strong> Furnish goods, services, or facilities to (or accept them from) a disqualified person?
							<span class="sty5227DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">1a(3)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/FurnGoodsDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/FurnGoodsDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 1a4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;">
							<strong>(4) </strong> Pay compensation to, or pay or reimburse the expenses of, a disqualified person?
							<span class="sty5227DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">1a(4)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/PayCompDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/PayCompDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 1a5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							<strong>(5) </strong> Transfer any income or assets to a disqualified person (or make any of either available for the benefit or use <br />
							<span style="width:4.4mm;height;2px;"/> of a disqualified person)?
							<span class="sty5227DotLn">............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">1a(5)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TransferAstDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TransferAstDisqualifiedPrsnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 1a6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							<strong>(6) </strong> Agree to pay money or property to a government official? (<strong>Exception. </strong> Check "No" if the trust agreed to make a <br />
							<span style="width:4.4mm;height;2px;"/> grant to or to employ the official for a period after termination of government service, if terminating within 90 days.)
							<!--<span class="sty5227DotLn">.</span>-->
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">1a(6)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/PaymentToGovernmentOfficialInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/PaymentToGovernmentOfficialInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 1b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							If any answer is "Yes" to lines 1a(1) through (6), did <strong>any</strong> of the acts fail to qualify under the exceptions described 
							in Regulations sections 53.4941(d)-3 and 4, or in a current Notice regarding disaster assistance (see instructions)?
							<span class="sty5227DotLn">...</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">1b</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ActsFailToQlfyAsExceptionsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ActsFailToQlfyAsExceptionsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 1c -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							Organizations relying on a current Notice regarding disaster assistance, check here 
							<span class="sty5227DotLn" style="float:none;margin-left:1mm;">..........</span>&#9658;
							<input type="checkbox" class="styCkboxNM" style="" alt="Relying on Current Notice regarding Dissaster Assistancet Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/RelyingCurrentNtcDsstrAsstInd"/>
									<xsl:with-param name="BackupName">F5227RelyingCurrentNtcDsstrAsstInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 1d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							Did the trust engage in a prior year in any of the acts described in line 1a, other than excepted acts, that 
							were not corrected before January 1, 2022?
							<span class="sty5227DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">1d</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/UncorrectedPriorActsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/UncorrectedPriorActsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:154mm;">
							Does section 4947(b)(3)(A) or (B) apply? (see instructions)
							<span class="sty5227DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">2</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section4947b3AOrBApplyInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section4947b3AOrBApplyInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							If "Yes," check the "N/A" box in lines 3 and 4.
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 3a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="">3a</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							Taxes on excess business holdings (section 4943): 
							<input type="checkbox" class="styCkboxNM" style="margin-left:1.5mm;margin-right:3px;" alt="Taxes on excess business holdings not applicable">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TaxesExcessBusHoldingsNAInd"/>
									<xsl:with-param name="BackupName">F5227TaxesExcessBusHoldingsNAInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong>N/A</strong>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 3b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:154mm;">
							Did the trust hold more than a 2% direct or indirect interest in any business enterprise at any time during 2022?
							<span class="sty5227DotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">3b</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessHoldingsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessHoldingsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 3c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							If "Yes," did the trust have excess business holdings in 2022 as a result of <strong>(1)</strong> any purchase by the trust or disqualified 
							persons after May 26, 1969; <strong>(2)</strong> the lapse of the 5-year period (or longer period approved by the Commissioner under 
							section 4943(c)(7)) to dispose of holdings acquired by gift or bequest; or <strong>(3)</strong> the lapse of the 10-, 15-, or 20-year first 
							phase holding period?
							<span class="sty5227DotLn">...............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:9mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:9mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:9mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">3c</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessBusinessHoldingsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessBusinessHoldingsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							Use Form 4720, Schedule C, to determine if the trust had excess business holdings in 2022. 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 4a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="">4a</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							Taxes on investments that jeopardize charitable purposes (section 4944): 
							<input type="checkbox" class="styCkboxNM" style="margin-left:1.5mm;margin-right:3px;" alt="Taxes on investments that jeopardize charitable purposes not applicable">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TaxesJeopardizeInvstNAInd"/>
									<xsl:with-param name="BackupName">F5227TaxesJeopardizeInvstNAInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong>N/A</strong>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 4b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:154mm;">
							Did the trust invest during 2022 any amount in a manner that would jeopardize its charitable purpose?
							<span class="sty5227DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">4b</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/JeopardyInvestmentsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/JeopardyInvestmentsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 4c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							Did the trust make any investment in a prior year (but after December 31, 1969) that could jeopardize its charitable purpose that 
							had not been removed from jeopardy before January 1, 2022?
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">4c</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/UncorrectedPYJeopardyInvstInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/UncorrectedPYJeopardyInvstInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 5 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							Taxes on taxable expenditures (section 4945) and political expenditures (section 4955): 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							During 2022, did the trust pay or incur any amount to: 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 5a1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;">
							<strong>(1) </strong> Carry on propoganda, or otherwise attempt to influence legislation (section 4945(e))?
							<span class="sty5227DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">5a(1)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/InfluenceLegislationInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/InfluenceLegislationInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 5a2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							<span style="width:5.5mm;height:4mm;font-weight:bold;float:left;">(2) </span> 
							Influence the outcome of any specific public election (see section 4955); 
							or to carry on, directly or indirectly, <br /> any voter registration drive?
							<span class="sty5227DotLn">............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">5a(2)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/InfluenceElectionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/InfluenceElectionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 5a3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;">
							<strong>(3) </strong> Provide a grant to an individual for travel, study, or similar purposes?
							<span class="sty5227DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">5a(3)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/GrantsToIndividualsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/GrantsToIndividualsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 5a4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							<span style="width:5.5mm;height:4mm;font-weight:bold;float:left;">(4) </span> 
							Provide a grant to an organization other than a charitable, etc., organization described in section 509(a)(1), <br /> (2), or (3), or section 4940(d)(2)?
							<span class="sty5227DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">5a(4)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/GrantsToOrganizationsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/GrantsToOrganizationsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 5a5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							<span style="width:5.5mm;height:4mm;font-weight:bold;float:left;">(5) </span> 
							Provide for any purpose other than religious, charitable, scientific, literary, or educational, or for the <br /> 
							prevention of cruelty to children or animals?
							<span class="sty5227DotLn">......................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">5a(5)</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/NoncharitablePurposeInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/NoncharitablePurposeInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 5b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							If any answer is "Yes" to lines 5a(1) through (5), did <strong>any</strong> of the transactions fail to qualify under the exceptions <br />
							described in Regulations section 53.4945, or in a current Notice regarding disaster assistance (see instructions)?
							<span class="sty5227DotLn">..</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">5b</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TransactionsFailToQlfyAsExcInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/TransactionsFailToQlfyAsExcInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 5c -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							Organizations relying on a current Notice regarding disaster assistance, check here 
							<span class="sty5227DotLn" style="float:none;margin-left:1mm;">..........</span>&#9658;
							<input type="checkbox" class="styCkboxNM" style="" alt="Relying on Current Notice regarding Dissaster Assistancet Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/RelyingCurrentNtcDsstrAsst1Ind"/>
									<xsl:with-param name="BackupName">F5227RelyingCurrentNtcDsstrAsst1Ind</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.6mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 5d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:154mm;height:auto;">
							If the answer is "Yes" to line 5a(4), does the trust claim exemption from the tax because it maintained expenditure <br />
							responsibility for the grant? 
							<span class="sty5227DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">5d</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/MaintainedExpenditureRspnsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/MaintainedExpenditureRspnsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							If "Yes," attach the statement required by Regulations section 53.4945-5(d)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/MaintainedExpenditureRspnsInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 6 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							Personal benefit contracts (section 170(f)(10)): 
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 6a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc" style="width:154mm;">
							Did the trust, during the year, receive any funds, directly or indirectly, to pay premiums on a personal benefit contract?
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">6a</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/RcvFndsToPayPrsnlBnftCntrctInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/RcvFndsToPayPrsnlBnftCntrctInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 6b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:154mm;">
							Did the trust, during the year, pay premiums, directly or indirectly, on a personal benefit contract?
							<span class="sty5227DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">6b</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/PayPremiumsPrsnlBnftCntrctInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/PayPremiumsPrsnlBnftCntrctInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							If "Yes" to line 6b, file Form 8870 (see instructions).
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PayPremiumsPrsnlBnftCntrctInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 8, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:154mm;">
							<strong>Section 664 trusts: </strong> Did the trust have unrelated business taxable income during the year?
							<span class="sty5227DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="font-family:Arial;">7</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/UBTIInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/UBTIInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							If "Yes," file Form 4720.
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>5227</strong> (2022)</span>
					</div>
					<!-- Page 6 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 5227 (2022)
						<div style="float:right;">Page <strong>6</strong></div>
					</div>
					<!-- Part 9 -->
					<div class="styStdDiv" style="border-bottom:0px solid black;border-top:0px solid black;">
						<div class="styPartName" style="margin-top:1.2mm;">Part IX</div>
						<div class="styPartDesc" style="height:auto;">
							Questionnaire for Charitable Lead Trusts, Pooled Income Funds, and Charitable Remainder Trusts 
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDiv sty5227SectionTitle">Section A &mdash; All Trusts</div>
					<!-- Part 9, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:167mm;">
							Check this box if any of the split-interest trust's income interests expired during 2022
							<span class="sty5227DotLn">.............&#9658;</span>
						</div>
						<div class="styGenericDiv" style="text-align:center;width:8mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Split interest trust's income interest expired during current year">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SplitIntTrIncmIntExprDurCYInd"/>
									<xsl:with-param name="BackupName">F5227SplitIntTrIncmIntExprDurCYInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Part 9, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:167mm;">
							Check this box if all of the split-interest trust's income interests expired before 2022
							<span class="sty5227DotLn">.............&#9658;</span>
						</div>
						<div class="styGenericDiv" style="text-align:center;width:8mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="All split interest trust's income interest expired before current year">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SplitIntTrIncmIntExprBfrCYInd"/>
									<xsl:with-param name="BackupName">F5227SplitIntTrIncmIntExprBfrCYInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;">
							If line 2 is checked and this is <strong>not</strong> a final return, attach an explanation. 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SplitIntTrIncmIntExprBfrCYInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv sty5227SectionTitle">Section B &mdash; Charitable Lead Trusts</div>
					<!-- Part 9, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:7.2mm;width:148mm;">
							Does the governing instrument require income in excess of the required annuity or unitrust payments to be paid for charitable purposes?
							<span class="sty5227DotLn">.............................</span>
						</div>
						<div class="styLNDesc" style="height:7.2mm;width:30mm;padding-top:3mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessIncmPaidChrtblPrpsRqrInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Net Income with make-up Charitiable Remainder Unitrust Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ExcessIncmPaidChrtblPrpsRqrInd"/>
									<xsl:with-param name="BackupName">F5227ExcessIncmPaidChrtblPrpsRqrInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Net Income with make-up Charitiable Remainder Unitrust No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ExcessIncmPaidChrtblPrpsRqrInd"/>
									<xsl:with-param name="BackupName">F5227ExcessIncmPaidChrtblPrpsRqrInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Part 9, Line 4 -->
					<div class="styStdDiv" style="margin-top:3mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Enter the amount of any excess income required to be paid for charitable purposes for 2022
							<span class="sty5227DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessIncmRqrPaidChrtblPrpsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Enter the amount of annuity or unitrust payments required to be paid to charitable beneficiaries for 2022
							<span class="sty5227DotLn">.</span>
						</div>
						<div class="styLNRightNumBoxNBB">5</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AnntyUnitrPymtChrtblBenefAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv sty5227SectionTitle">Section C &mdash; Pooled Income Funds</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 9, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							Enter the amount of contributions received during 2022
							<span class="sty5227DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ContributionsReceivedCYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 9, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Enter the amount required to be distributed for 2022 to satisfy the remainder interest
							<span class="sty5227DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistriSatisfyRemainderIntCYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:auto;">
							Enter any amounts that were required to be distributed to the remainder beneficiary that remain <br /> undistributed
							<span class="sty5227DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />8</div>
						<div class="styLNAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedPooledFundsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 9, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Enter the amount of income required to be paid to the charitable remainder beneficiary for 2022
							<span class="sty5227DotLn">...</span>
						</div>
						<div class="styLNRightNumBoxNBB">9</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeRqrPaidBeneficiaryCYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv sty5227SectionTitle">Section D &mdash; Charitable Remainder Trusts</div>
					<!-- Part 9, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:167mm;height:auto;">
							Check this box if you are filing for a charitable remainder annuity trust or a charitable remainder unitrust whose 
							charitable interests involve only cemeteries or war veterans' posts
							<span class="sty5227DotLn">.........................&#9658;</span>
						</div>
						<div class="styGenericDiv" style="text-align:center;width:8mm;padding-top:3mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Involve Only Cemeteries Or War Veterans Posts">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CemeteriesOrWarVeteransPostInd"/>
									<xsl:with-param name="BackupName">F5227CemeteriesOrWarVeteransPostInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Part 9, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:167mm;height:auto;">
							Check this box if you are making an election under Regulations section 1.664-2(a)(1)(i)(a)(2) or 1.664-3(a)(1)(i)(g)(2) 
							to <br /> treat income generated from certain property distributions (other than cash) by the trust as occurring on the last day 
							of the <br /> tax year. (see instructions)
							<span class="sty5227DotLn">..............................&#9658;</span>
						</div>
						<div class="styGenericDiv" style="text-align:center;width:8mm;padding-top:6mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Election Under Specified Regulations section">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ElectUnderSpecifiedRegSectInd"/>
									<xsl:with-param name="BackupName">F5227ElectUnderSpecifiedRegSectInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Part 9, Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="height:7.2mm;width:148mm;">
							Are you making an election under Regulations section 1.1411-10(g) with respect to a controlled foreign corporation or a qualified electing fund? (see instructions)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ElectUnderRegSect1141110gInd"/>
							</xsl:call-template>
							<span class="sty5227DotLn">......................</span>
						</div>
						<div class="styLNDesc" style="height:7.2mm;width:30mm;padding-top:3mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/ElectUnderRegSect1141110gInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Election Under Regulations Section 1.1411 10 g Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ElectUnderRegSect1141110gInd"/>
									<xsl:with-param name="BackupName">F5227ElectUnderRegSect1141110gInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Election Under Regulations Section 1.1411 10 g No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ElectUnderRegSect1141110gInd"/>
									<xsl:with-param name="BackupName">F5227ElectUnderRegSect1141110gInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Part 9, Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="height:4.5mm;width:148mm;">
							Is this the initial return? If "Yes," attach a copy of the trust instrument
							<span class="sty5227DotLn">..............</span>
						</div>
						<div class="styLNDesc" style="height:4.5mm;width:30mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/InitSplitInterestTrustRetInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Initial Split Interest Trust Return Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InitSplitInterestTrustRetInd"/>
									<xsl:with-param name="BackupName">F5227InitSplitInterestTrustRetInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Initial Split Interest Trust Return No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InitSplitInterestTrustRetInd"/>
									<xsl:with-param name="BackupName">F5227InitSplitInterestTrustRetInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Part 9, Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="height:4.5mm;width:148mm;">
							Was the trust instrument amended during the year? If "Yes," attach a copy
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TrustInstrumentAmendedInd"/>
							</xsl:call-template>
							<span class="sty5227DotLn">............</span>
						</div>
						<div class="styLNDesc" style="height:4.5mm;width:30mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/TrustInstrumentAmendedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Trust Instrument Amended Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TrustInstrumentAmendedInd"/>
									<xsl:with-param name="BackupName">F5227TrustInstrumentAmendedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Trust Instrument Amended No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TrustInstrumentAmendedInd"/>
									<xsl:with-param name="BackupName">F5227TrustInstrumentAmendedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Part 9, Line 15a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15a</div>
						<div class="styLNDesc" style="height:4.5mm;width:148mm;">
							If this is the final return, were final distributions made according to the trust instrument?
							<span class="sty5227DotLn">........</span>
						</div>
						<div class="styLNDesc" style="height:4.5mm;width:30mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FinalDistributionsMadeInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Final Distributions Made Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FinalDistributionsMadeInd"/>
									<xsl:with-param name="BackupName">F5227FinalDistributionsMadeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Final Distributins Made No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FinalDistributionsMadeInd"/>
									<xsl:with-param name="BackupName">F5227FinalDistributionsMadeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Part 9, Line 15b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="height:4.5mm;width:148mm;">
							If "Yes," did you complete Part III, Section A, line 2?
							<span class="sty5227DotLn">....................</span>
						</div>
						<div class="styLNDesc" style="height:4.5mm;width:30mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/PrinDistriPayeeCurrTYCompInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Principal Distributed Current Yax Year Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PrinDistriPayeeCurrTYCompInd"/>
									<xsl:with-param name="BackupName">F5227PrinDistriPayeeCurrTYCompInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Principal Distributed Current Yax Year No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PrinDistriPayeeCurrTYCompInd"/>
									<xsl:with-param name="BackupName">F5227PrinDistriPayeeCurrTYCompInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<!-- Part 9, Line 15c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:63mm;">
							If either line 15a or 15b is "No," explain why &#9658;
						</div>
						<div class="styLNDesc" style="width:115mm;border-bottom:1px dashed black;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="border-bottom:1px dashed black;height:auto;width:178mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/DistriNotMadeOrCompExplnTxt"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:if test="not($FormData/DistriNotMadeOrCompExplnTxt)">
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="styLNDesc" style="border-bottom:1px dashed black;height:auto;width:178mm;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="styLNDesc" style="border-bottom:1px dashed black;height:auto;width:178mm;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="styLNDesc" style="border-bottom:1px dashed black;height:auto;width:178mm;">&nbsp;</div>
						</div>
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="styLNDesc" style="border-bottom:1px dashed black;height:auto;width:178mm;">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 9, Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="height:7.2mm;width:148mm;">
							At any time during calendar year 2022, did the trust have an interest in or a signature or other authority over a bank, securities, or other financial account in a foreign country?
							<span class="sty5227DotLn">..................</span>
						</div>
						<div class="styLNDesc" style="height:7.2mm;width:30mm;padding-top:3mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnAcctInterestAuthorityInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Interest or authority over foreign account Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnAcctInterestAuthorityInd"/>
									<xsl:with-param name="BackupName">F5227FrgnAcctInterestAuthorityInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Interest or authority over foreign account No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnAcctInterestAuthorityInd"/>
									<xsl:with-param name="BackupName">F5227FrgnAcctInterestAuthorityInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">See the instructions for exceptions and filing requirements for FinCEN Form 114.</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:73mm;">If "Yes," enter the name of the foreign country &#9658; </div>
						<div class="styLNDesc" style="width:90mm;border-bottom:1px dashed black;">
							<xsl:for-each select="$FormData/ForeignCountryCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
								<xsl:if test="position() != last()"><span style="width:7px;height:2px;"/></xsl:if>
							</xsl:for-each>
						</div>
						
					</div>
					<!-- Sign Here -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;margin-top:3mm;">
						<div class="styGenericDiv" style="width:23mm;height:22.5mm;font-size:12pt;font-weight:bold;padding-top:6mm;border-right:1px solid black;">
							Sign Here
						</div>
						<div class="styGenericDiv" style="width:164mm;font-size:6pt;padding:0.5mm;margin-bottom:1.5mm;">
							Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
							and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than trustee) 
							is based on all information of which preparer has any knowledge.<br />
						</div>
						<div class="styGenericDiv" style="width:164mm;">
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:118mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;vertical-align:bottom;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">PersonNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span>Signature of trustee or officer representing trustee</span>
							</div>
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:32mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">SignatureDt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span>Date</span>
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
						<span style="float:right;">Form <strong>5227</strong> (2022)</span>
					</div>
					<!-- Page 7 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 5227 (2022)
						<div style="float:right;">Page <strong>7</strong></div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styNameBox" style="width:140.2mm;">
							Full name of trust <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>Employer identification number</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="text-align:center;color:white;background-color:black;padding:2px;font-weight:bold;">NOT Open To Public Inspection</div>
					<div class="styStdDiv sty5227SectionTitle" style="font-size:9pt;">Schedule A &mdash; Distributions, Assets, and Donor Information</div>
					<!-- Schedule A, Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:0px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							Accumulation Schedule
							<span style="font-weight:normal;">(Section 664 trust only) (see instructions)</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:65mm;text-align:center;">
							Accumulations
						</div>
						<div class="styLNDesc" style="width:38mm;text-align:center;border-left:1px solid black;"><strong>(a) </strong> Ordinary income</div>
						<div class="styLNDesc" style="width:38mm;text-align:center;border-left:1px solid black;"><strong>(b) </strong> Capital gains (losses)</div>
						<div class="styLNDesc" style="width:38mm;text-align:center;border-left:1px solid black;"><strong>(c) </strong> Nontaxable income</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:65mm;text-align:center;height:8mm;padding-top:2mm;">
							Net Investment Income (NII) Classification
						</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Excluded <br /> Income</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Accumulated <br /> NII</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Excluded <br /> Income</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Accumulated <br /> NII</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Excluded <br /> Income</div>
						<div class="sty5227AmountBoxSmall" style="text-align:center;height:8mm;padding-top:1mm;border-bottom-width:0px;">Accumulated <br /> NII</div>
					</div>
					<!-- Part 1, Line 1 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:65mm;height:auto;">
							Total distributable income. Enter the amount from Part II, line 3
							<span class="sty5227DotLn">...........</span>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/OrdnryIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/OrdnryIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/CapGainLossExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/CapGainLossAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/NontxIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistributableIncomeGrp/NontxIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 2a -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="styLNDesc" style="width:65mm;height;auto;">
							Total distributions for 2022: 
							<span style="width:25mm;border-bottom:1px solid black;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CYTotalDistributionsAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty5227AmountBoxSmall" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBoxSmall" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBoxSmall" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBoxSmall" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBoxSmall" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5227AmountBoxSmall" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 2b -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:65mm;">
							2022 distributions from income
							<span class="sty5227DotLn">......</span>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDistributionsFromIncmGrp/OrdnryIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDistributionsFromIncmGrp/OrdnryIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDistributionsFromIncmGrp/CapGainLossExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDistributionsFromIncmGrp/CapGainLossAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDistributionsFromIncmGrp/NontxIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDistributionsFromIncmGrp/NontxIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 3 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:65mm;height:auto;">
							Undistributed income at end of tax year. Subtract line 2b from line 1
							<span class="sty5227DotLn">..........</span>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeEOYGrp/OrdnryIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeEOYGrp/OrdnryIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeEOYGrp/CapGainLossExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeEOYGrp/CapGainLossAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeEOYGrp/NontxIncmExcludedAmt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
						<div class="sty5227AmountBoxSmall" style="border-bottom-width:0px;height:7.2mm;padding-top:3.8mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UndistributedIncomeEOYGrp/NontxIncmAccumNIIPost2012Amt"/>
								<xsl:with-param name="MaxSize" select="14"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule A, Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							Simplified Net Investment Income Calculation
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:44.5mm;text-align:center;border-left:1px solid black;"><strong>(a) </strong> Accumulated NII</div>
						<div class="styLNDesc" style="width:44.5mm;text-align:center;border-left:1px solid black;"><strong>(b) </strong> Current Year NII</div>
						<div class="styLNDesc" style="width:44.5mm;text-align:center;border-left:1px solid black;"><strong>(c) </strong> Distributions</div>
						<div class="styLNDesc" style="width:44.5mm;text-align:center;border-left:1px solid black;"><strong>(d) </strong> Ending NII</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNAmountBoxNBB" style="width:44.5mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulatedNIIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:44.5mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentYearNIIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:44.5mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:44.5mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EndingNIIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule A, Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:0px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Current Distributions Schedule
							<span style="font-weight:normal;">(Section 664 trust only) (see instructions)</span>
						</div>
					</div>
					<xsl:variable name="DistSchCount" select="count($FormData/Sect664TrCurrentDistriSchGrp)"/>
					<xsl:variable name="SepDistSch" select="($Print = $Separated) and ($DistSchCount &gt; 3)"/>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<table style="display:table;border-collapse:collapse;width:187mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" style="width:75mm;font-weight:normal;">
										<strong>(a)</strong> <br /> Name of recipient
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;">
										<strong>(b)</strong> <br /> Identifying number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;font-weight:normal;border-right-width:0px;">
										<strong>(c)</strong> <br /> Percentage of total unitrust amount payable (if applicable)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($SepDistSch)">
									<xsl:for-each select="$FormData/Sect664TrCurrentDistriSchGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="RecipientNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RecipientNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="RecipientBusinessName/BusinessNameLine2Txt">
															<br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
												<span style="float:right;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="RecipientSSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="RecipientSSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="RecipientEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="TotUnitrustAmtPayablePct"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($DistSchCount &lt; 1) or $SepDistSch">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											1a
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											<xsl:if test="$SepDistSch">See Additional Data</xsl:if>
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($DistSchCount &lt; 2) or $SepDistSch">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											1b
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<table style="display:table;border-collapse:collapse;width:187mm;">
							<colgroup span="1"/>
							<colgroup span="1"/>
							<colgroup span="2"/>
							<colgroup span="1"/>
							<colgroup span="1"/>
							<colgroup span="1"/>
							<colgroup span="1"/>
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:33mm;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:22mm;font-weight:normal;">
										<strong>(d)</strong> <br /> Ordinary Income
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:auto;font-weight:normal;">
										Capital gains
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:22mm;font-weight:normal;">
										<strong>(g)</strong> <br /> Nontaxable income
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:22mm;font-weight:normal;">
										<strong>(h)</strong> <br /> Corpus
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:22mm;font-weight:normal;">
										<strong>(i)</strong> <br /> Add cols. <br /><strong>(d)</strong> through <strong>(h)</strong>
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:22mm;font-weight:normal;border-right-width:0px;">
										<strong>(j)</strong> <br /> Net investment income
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:22mm;font-weight:normal;">
										<strong>(e)</strong> Short-term
									</th>
									<th class="styTableCellHeader" scope="col" style="width:22mm;font-weight:normal;">
										<strong>(f)</strong> Long-term
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($SepDistSch)">
									<xsl:for-each select="$FormData/Sect664TrCurrentDistriSchGrp">
										<tr style="">
											<td class="styTableCellTextInherit" style="">
												<span style="width:8mm;text-align:center;font-weight:bold;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RowId"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OrdinaryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShortTermCapitalGainAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LongTermCapitalGainAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NontaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CorpusAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalDistributionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetInvestmentIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($DistSchCount &lt; 1) or $SepDistSch">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellTextInherit" style="">
											<span style="width:7mm;text-align:center;font-weight:bold;">1a</span>
										</td>
										<td class="styTableCellAmtInherit" style="text-align:left;"><xsl:if test="$SepDistSch">See addn'l data</xsl:if></td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="($DistSchCount &lt; 2) or $SepDistSch">
									<tr style="">
										<td class="styTableCellTextInherit" style="">
											<span style="width:8mm;text-align:center;font-weight:bold;">b</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<tr style="">
									<td class="styTableCellTextInherit" style="font-weight:bold;">
										<span style="width:8mm;text-align:left;padding-left:2.5mm;">2</span>
										<span style="font-family:Arial;">Attachment Total</span>
									</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="">
									<td class="styTableCellTextInherit" style="font-weight:bold;">
										<span style="width:8mm;text-align:left;padding-left:2.5mm;">3</span>
										<span>Total</span>
										<span class="sty5227DotLn" style="font-weight:normal;">...</span>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotSect664TrCurrDistriSchGrp/OrdinaryIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotSect664TrCurrDistriSchGrp/ShortTermCapitalGainAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotSect664TrCurrDistriSchGrp/LongTermCapitalGainAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotSect664TrCurrDistriSchGrp/NontaxableIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotSect664TrCurrDistriSchGrp/CorpusAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotSect664TrCurrDistriSchGrp/TotalDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotSect664TrCurrDistriSchGrp/NetInvestmentIncomeAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Schedule A, Part 3, Line 4 -->
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:175mm;height:auto;">
							If line 3, Total, column (i) does not agree with Part V, line 1b of Form 5227 for a CRAT or Part VI, line 7 of Form 5227 for a <br />
							CRUT, check here &#9658; 
							<input type="checkbox" class="styCkboxNM" style="margin:1px 1mm 0px 2mm;" alt="Total Does Not Agree">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DoesNotAgreeInd"/>
									<xsl:with-param name="BackupName">F5227DoesNotAgreeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							and attach an explanation. 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/DoesNotAgreeInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule A, Part 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">
							Current Distributions 
							<span style="font-weight:normal;">(charitable lead trusts or pool income funds only) (see instructions)</span>
						</div>
					</div>
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:146mm;">
							Enter the amount required to be paid to private beneficiaries for 2022
							<span class="sty5227DotLn" style="margin-right:-6px;">.............&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrivateBenefRqrPaidCYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule A, Part 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc">
							Assets and Donor Information
							<span style="font-weight:normal;">(Section 664 trust or charitable lead trust only)</span>
						</div>
					</div>
					<!-- Schedule A, Part 5, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:4.5mm;width:148mm;">
							Is this the initial return or were additional assets contributed to the trust in 2022?
							<span class="sty5227DotLn">...........</span>
						</div>
						<div class="styLNDesc" style="height:4.5mm;width:30mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/InitRetOrAddnlAstContriCYInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Initial Return or additional assets contributed Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InitRetOrAddnlAstContriCYInd"/>
									<xsl:with-param name="BackupName">F5227InitRetOrAddnlAstContriCYInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Initial Return or additional assets contributed No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InitRetOrAddnlAstContriCYInd"/>
									<xsl:with-param name="BackupName">F5227InitRetOrAddnlAstContriCYInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:154mm;font-weight:bold;">
							If "Yes," complete the schedule below.
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:154mm;font-weight:bold;">
							If "No," complete only column (a) of the schedule below.
						</div>
					</div>
					<xsl:variable name="DonationsCount" select="count($FormData/Sect664TrAssetsDonorGrp)"/>
					<xsl:variable name="SepDonations" select="($Print = $Separated) and ($DonationsCount &gt; 3)"/>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<table style="display:table;border-collapse:collapse;width:187mm;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" style="width:75mm;font-weight:normal;">
										<strong>(a)</strong> <br /> Name and address of donor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;">
										<strong>(b)</strong> <br /> Description of each asset donated
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(c)</strong> <br /> FMV of each <br /> asset on date of donation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23.0mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong> <br /> Date of donation
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($SepDonations)">
									<xsl:for-each select="$FormData/Sect664TrAssetsDonorGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												2<xsl:number value="position()" format="a"/>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="BusinessName/BusinessNameLine2Txt">
															<br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
												<br />
												<xsl:choose>
													<xsl:when test="ForeignAddress">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DonatedPropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AssetFMVDonationDateAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DonationDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($DonationsCount &lt; 1) or $SepDonations">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											2a
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											<xsl:if test="$SepDonations">See Additional Data</xsl:if>
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($DonationsCount &lt; 2) or $SepDonations">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											2b
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($DonationsCount &lt; 3) or $SepDonations">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											2c
										</td>
										<td class="styTableCellTextInherit"><br /><br />
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit">
											&nbsp;
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											&nbsp;
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:124mm;">
							<strong>Attachment total</strong>
							<span class="sty5227DotLn">........................</span>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;">&nbsp;</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:124mm;">
							<strong>Total</strong>
							<span class="sty5227DotLn" style="margin-right:-6px;">...........................&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAssetsFMVAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section A, Part 5, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="height:7.2mm;width:138mm;">
							For charitable remainder trusts: If this was the final year, was an early termination agreement signed by all parties to the trust?
							<span class="sty5227DotLn">...........................</span>
						</div>
						<div class="styLNDesc" style="height:7.2mm;width:40mm;padding-top:3mm;font-weight:bold;text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/EarlyTerminationAgrmtSignedCd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Early Termination Agreement Signed Yes">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EarlyTerminationAgrmtSignedCd"/>
									<xsl:with-param name="BackupName">F5227EarlyTerminationAgrmtSignedCd</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue">YES</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Early Termination Agreement Signed No">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EarlyTerminationAgrmtSignedCd"/>
									<xsl:with-param name="BackupName">F5227EarlyTerminationAgrmtSignedCd</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue">NO</xsl:with-param>
								</xsl:call-template>
							</input>
							No
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Early Termination Agreement Signed N/A">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EarlyTerminationAgrmtSignedCd"/>
									<xsl:with-param name="BackupName">F5227EarlyTerminationAgrmtSignedCd</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue">N/A</xsl:with-param>
								</xsl:call-template>
							</input>
							N/A
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:154mm;">
							If "Yes," attach a copy of the signed agreement.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/EarlyTerminationAgrmtSignedCd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>5227</strong> (2022)</span>
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
					<xsl:if test="$SepChar">
						<br /><br />
						<span class="styRepeatingDataTitle">Part III, Line 2 - Principal distributed during the current tax year for charitable purposes</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:6mm;">
										&nbsp;
									</th>
									<th class="styDepTblCell" scope="col" style="width:61mm;font-weight:normal;">
										(A) <br /> Payee's name and address
									</th>
									<th class="styDepTblCell" scope="col" style="width:22mm;font-weight:normal;">
										(B) <br /> Date of distribution
									</th>
									<th class="styDepTblCell" scope="col" style="width:70mm;font-weight:normal;">
										(C) <br /> Charitable purpose and description of assets distributed
									</th>
									<th class="styDepTblCell" scope="col" style="width:28.0mm;font-weight:normal;">
										Distributed amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/PrinDistributedPayeeCurrTYGrp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
											2<xsl:number value="position()" format="a"/>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="PersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
											<br />
											<xsl:choose>
												<xsl:when test="ForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DistributionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ChrtblPurposeAssetsDistriDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$SepSetAside">
						<br /><br />
						<span class="styRepeatingDataTitle">Part III, Line 7 - Distributions made during the tax year</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:6mm;">
										&nbsp;
									</th>
									<th class="styDepTblCell" scope="col" style="width:61mm;font-weight:normal;">
										(A) <br /> Payee's name and address
									</th>
									<th class="styDepTblCell" scope="col" style="width:22mm;font-weight:normal;">
										(B) <br /> Date of distribution
									</th>
									<th class="styDepTblCell" scope="col" style="width:70mm;font-weight:normal;">
										(C) <br /> Charitable purpose and description of assets distributed
									</th>
									<th class="styDepTblCell" scope="col" style="width:28.0mm;font-weight:normal;">
										Distributed amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/AccumIncmSetAsideDistriTYGrp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:top;">
											7<xsl:number value="position()" format="a"/>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="PersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
											<br />
											<xsl:choose>
												<xsl:when test="ForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DistributionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ChrtblPurposeAssetsDistriDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$SepDistSch">
						<br /><br />
						<span class="styRepeatingDataTitle">Schedule A, Part III, Line 1 - Current distributions schedule</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;">
										&nbsp;
									</th>
									<th class="styDepTblCell" scope="col" style="width:75mm;font-weight:normal;">
										<strong>(a)</strong> <br /> Name of recipient
									</th>
									<th class="styDepTblCell" scope="col" style="width:52mm;font-weight:normal;">
										<strong>(b)</strong> <br /> Identifying number
									</th>
									<th class="styDepTblCell" scope="col" style="width:52mm;font-weight:normal;border-right-width:0px;">
										<strong>(c)</strong> <br /> Percentage of total unitrust amount payable (if applicable)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Sect664TrCurrentDistriSchGrp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RowId"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="RecipientNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientNm"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="RecipientBusinessName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="RecipientSSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="RecipientSSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="RecipientEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="TotUnitrustAmtPayablePct"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:8mm;">
										&nbsp;
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:25.5mm;font-weight:normal;">
										<strong>(d)</strong> <br /> Ordinary Income
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:auto;font-weight:normal;">
										Capital gains
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:25.5mm;font-weight:normal;">
										<strong>(g)</strong> <br /> Nontaxable income
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:25.5mm;font-weight:normal;">
										<strong>(h)</strong> <br /> Corpus
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:25.5mm;font-weight:normal;">
										<strong>(i)</strong> <br /> Add cols. <br /><strong>(d)</strong> through <strong>(h)</strong>
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:25.5mm;font-weight:normal;border-right-width:0px;">
										<strong>(j)</strong> <br /> Net investment income
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:25.5mm;font-weight:normal;">
										<strong>(e)</strong> Short-term
									</th>
									<th class="styDepTblCell" scope="col" style="width:25.5mm;font-weight:normal;">
										<strong>(f)</strong> Long-term
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Sect664TrCurrentDistriSchGrp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<span style="width:8mm;text-align:center;font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowId"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OrdinaryIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShortTermCapitalGainAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LongTermCapitalGainAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NontaxableIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CorpusAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalDistributionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetInvestmentIncomeAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$SepDonations">
						<br /><br />
						<span class="styRepeatingDataTitle">Schedule A, Part V, Line 2 - Trust asset contributions</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;">
										&nbsp;
									</th>
									<th class="styDepTblCell" scope="col" style="width:75mm;font-weight:normal;">
										<strong>(a)</strong> <br /> Name and address of donor
									</th>
									<th class="styDepTblCell" scope="col" style="width:49mm;font-weight:normal;">
										<strong>(b)</strong> <br /> Description of each asset donated
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(c)</strong> <br /> FMV of each <br /> asset on date of donation
									</th>
									<th class="styDepTblCell" scope="col" style="width:23.0mm;font-weight:normal;">
										<strong>(d)</strong> <br /> Date of donation
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Sect664TrAssetsDonorGrp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											2<xsl:number value="position()" format="a"/>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="PersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
											<br />
											<xsl:choose>
												<xsl:when test="ForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DonatedPropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AssetFMVDonationDateAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DonationDt"/>
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
