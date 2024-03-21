<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
  <!ENTITY bull "&#8226;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8915FStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8915F" />
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
				<meta name="Description" content="IRS Form 8915-F" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle" />
						<xsl:call-template name="IRS8915FStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8915F">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:21mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:16pt;">8915-F</span> 
							<div class="" style="padding-top:.5mm;font-size:7pt;">(January 2023)</div>
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template><br />
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:21mm;">
							<span class="styFMT" style="font-size:12pt;">Qualified Disaster Retirement Plan <br />	Distributions and Repayments</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic;">www.irs.gov/Form8915F</span>
								for instructions and the latest information.<br />
								&#9658;Attach to Form 1040, 1040-SR, or 1040-NR.
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:21mm;border-left-width:2px;">  
							<div class="styOMB" style="height:auto;font-size:6pt;padding-top:4mm;padding-bottom:2mm;">OMB No. 1545-0074</div>
							<div style="margin-left:0mm;text-align:left;font-size:7pt;padding-top:1mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">915</span>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;border-bottom:1px solid black;">
						<div style="float:left;width:140mm;min-height:7mm;padding:0.5mm;border-right:1px solid black;">
							Name. If married, file a separate form for each spouse required to file Form 8915-F. See instructions.<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PersonNm"/>
							</xsl:call-template>
						</div>
						<div style="float:left;width:47mm;height:7mm;padding:0.5mm 0.5mm 0.5mm 1mm;">
							<strong>Your social security number</strong><br />
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="padding:0.5mm 0.2mm;line-height:150%;border-bottom:1px solid black;">
						<span style="font-weight:bold;font-style:italic">Before you begin (see instructions for details): </span><br />
						<div style="padding-left:1mm;width:100%;">
							&bull; Form 8915-F replaces Form 8915-E for 2021 and later years. Form 8915-E was used for coronavirus-related and other 2020 disaster distributions.<br />
							&bull; Form 8915-F is also used for 2021 and later disaster distributions. <br />
							&bull; See Appendix B in the instructions for the list of qualified disasters and their FEMA numbers for the year you check in item B next. <br />
							&bull; "This year" (as used on this form) is the year of the form you check in item A next. For example, if you check 2022, "this year" is 2022.
						</div>
					</div>
					<!-- Line A -->
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:187mm;font-weight:bold;float:none;">
							Complete items A and B below. Complete item C and check the box in item D for the coronavirus, as applicable.
						</div>
					</div>
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD">A</div>
						<div class="styLNDesc" style="width:90mm;">
							<strong>Tax year for which you are filing form </strong> (check only one box) 
						</div>
						<div class="styGenericDiv" style="width:89mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:1px;" alt="2021 Tax year box">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TaxYearFilingFormCd"/>
									<xsl:with-param name="BackupName">F8915FTaxYearFilingFormCd2021</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue" select="2021"/>
								</xsl:call-template>
							</input>
							2021
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;margin-right:1px;" alt="2022 Tax year box">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TaxYearFilingFormCd"/>
									<xsl:with-param name="BackupName">F8915FTaxYearFilingFormCd2022</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue" select="2022"/>
								</xsl:call-template>
							</input>
							2022
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;margin-right:1px;" alt="2023 Tax year box">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TaxYearFilingFormCd"/>
									<xsl:with-param name="BackupName">F8915FTaxYearFilingFormCd2023</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue" select="2023"/>
								</xsl:call-template>
							</input>
							2023
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;margin-right:1px;" alt="2024 Tax year box">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TaxYearFilingFormCd"/>
									<xsl:with-param name="BackupName">F8915FTaxYearFilingFormCd2024</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue" select="2024"/>
								</xsl:call-template>
							</input>
							2024
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;margin-right:1px;" alt="Other Tax year box">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxYearFilingFormInd"/>
									<xsl:with-param name="BackupName">F8915FOtherTaxYearFilingFormInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Other
							<span style="width:12mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxYearFilingFormInd/@otherTaxYrCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line B -->
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD">B</div>
						<div class="styLNDesc" style="width:90mm;">
							<strong>Calendar year in which disaster occurred </strong> (check only one box) 
						</div>
						<div class="styGenericDiv" style="width:89mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:1px;" alt="2020 disaster year box">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CalendarYrDisasterCd"/>
									<xsl:with-param name="BackupName">F8915FCalendarYrDisasterCd2020</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue" select="2020"/>
								</xsl:call-template>
							</input>
							2020
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;margin-right:1px;" alt="2021 disaster year box">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CalendarYrDisasterCd"/>
									<xsl:with-param name="BackupName">F8915FCalendarYrDisasterCd2021</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue" select="2021"/>
								</xsl:call-template>
							</input>
							2021
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;margin-right:1px;" alt="2022 disaster year box">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CalendarYrDisasterCd"/>
									<xsl:with-param name="BackupName">F8915FCalendarYrDisasterCd2022</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue" select="2022"/>
								</xsl:call-template>
							</input>
							2022
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;margin-right:1px;" alt="2023 disaster year box">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CalendarYrDisasterCd"/>
									<xsl:with-param name="BackupName">F8915FCalendarYrDisasterCd2023</xsl:with-param>
									<xsl:with-param name="DisplayedCheckboxValue" select="2023"/>
								</xsl:call-template>
							</input>
							2023
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;margin-right:1px;" alt="Other disaster year box">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherCalendarYrDisasterInd"/>
									<xsl:with-param name="BackupName">F8915FOtherCalendarYrDisasterInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Other
							<span style="width:12mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/OtherCalendarYrDisasterInd/@otherCalendarYrCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line C -->
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD" style="">C</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							<strong>FEMA number for each of your disasters for the year checked in item B above. </strong> 
							Use item D, <strong>not</strong> item C, for the coronavirus.
						</div>
					</div>
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD" style="">&nbsp;</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							<xsl:for-each select="$FormData/FEMADisasterDeclarationNum">
								<xsl:if test="position() mod 6 = 1">
									<xsl:variable name="pos" select="position()"/>
									<xsl:if test="$pos &gt; 1"><br /></xsl:if>
									<span style="width:6mm;text-align:right;">(<xsl:value-of select="$pos"/>)</span>
									<span style="width:22mm;border-bottom:1px solid black;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</span>
									<span style="width:8mm;text-align:right;">(<xsl:value-of select="$pos + 1"/>)</span>
									<span style="width:22mm;border-bottom:1px solid black;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/FEMADisasterDeclarationNum[$pos + 1]"/>
										</xsl:call-template>
									</span>
									<span style="width:8mm;text-align:right;">(<xsl:value-of select="$pos + 2"/>)</span>
									<span style="width:22mm;border-bottom:1px solid black;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/FEMADisasterDeclarationNum[$pos + 2]"/>
										</xsl:call-template>
									</span>
									<span style="width:8mm;text-align:right;">(<xsl:value-of select="$pos + 3"/>)</span>
									<span style="width:22mm;border-bottom:1px solid black;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/FEMADisasterDeclarationNum[$pos + 3]"/>
										</xsl:call-template>
									</span>
									<span style="width:8mm;text-align:right;">(<xsl:value-of select="$pos + 4"/>)</span>
									<span style="width:22mm;border-bottom:1px solid black;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/FEMADisasterDeclarationNum[$pos + 4]"/>
										</xsl:call-template>
									</span>
									<span style="width:8mm;text-align:right;">(<xsl:value-of select="$pos + 5"/>)</span>
									<span style="width:22mm;border-bottom:1px solid black;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/FEMADisasterDeclarationNum[$pos + 5]"/>
										</xsl:call-template>
									</span>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="count($FormData/FEMADisasterDeclarationNum) &lt; 1">
								(1) <span style="width:22mm;border-bottom:1px solid black;text-align:center;margin-right:2mm;">&nbsp;</span>
								(2) <span style="width:22mm;border-bottom:1px solid black;text-align:center;margin-right:2mm;">&nbsp;</span>
								(3) <span style="width:22mm;border-bottom:1px solid black;text-align:center;margin-right:2mm;">&nbsp;</span>
								(4) <span style="width:22mm;border-bottom:1px solid black;text-align:center;margin-right:2mm;">&nbsp;</span>
								(5) <span style="width:22mm;border-bottom:1px solid black;text-align:center;margin-right:2mm;">&nbsp;</span>
								(6) <span style="width:22mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
							</xsl:if>
						</div>
					</div>
					<!-- Line D -->
					<div class="styStdDiv" style="margin-top:2mm;">
						<div class="styLNLeftNumBoxSD" style="">D</div>
						<div class="styLNDesc" style="width:178mm;height:auto;">
							<strong>If your disaster is the coronavirus, check this box</strong>  
							<input type="checkbox" class="styCkboxNM" style="margin-left:2mm;" alt="Coronavirus Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CoronavirusInd"/>
									<xsl:with-param name="BackupName">F8915FCoronavirusInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Don't list the coronavirus in item C.
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;text-align:center;padding:2mm;font-size:9pt;">
						<strong>Which lines on this form should I use? </strong> See CHARTS 1 and 2 below.
					</div>
					<div class="styStdDiv" style="">
						<img alt="Flowchart 1 explaining eligibility to use this form relating to only coronavirus. See instructions for readable version." src="{$ImagePath}/8915F_Chart1.png" height="277" width="703"/>
					</div>
					<div class="styStdDiv" style="">
						<img alt="Flowchart 2 explaining eligibility to use this form for disasters. See instructions for readable version." src="{$ImagePath}/8915F_Chart2.png" height="322" width="704"/>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:14mm;">Cat. No. 75585Y</span>
						<span style="float:right;">Form <strong>8915-F</strong> (1-2023)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv">
						Form 8915-F (1-2023)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="height:auto;">
							Total Distributions From All Retirement Plans (Including IRAs) <span style="font-weight:normal;display:inline;">(see instructions) <br />
							Provide the information requested below for the disasters in item C earlier for which you are reporting qualified disaster distributions in this part.</span>
						</div>
					</div>
					<xsl:variable name="SepDisasters" select="($Print = $Separated) and (count($FormData/TotalDistriAllRetirePlansGrp/FEMADisasterGrp) &gt; 2)"/>
					<div class="styTableContainerNBB" id="DisasterTable">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:63mm;font-weight:normal;">Disaster FEMA number*</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;">Disaster beginning date*</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;border-right-width:0px;">Disaster ending date*</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($SepDisasters)">
									<xsl:for-each select="$FormData/TotalDistriAllRetirePlansGrp/FEMADisasterGrp">
										<tr>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FEMADisasterDeclarationNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DisasterBeginDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DisasterEndDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$SepDisasters or (count($FormData/TotalDistriAllRetirePlansGrp/FEMADisasterGrp) &lt; 1)">
									<tr>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/FEMADisasterGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$SepDisasters or (count($FormData/TotalDistriAllRetirePlansGrp/FEMADisasterGrp) &lt; 2)">
									<tr>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdIBDiv">
						<div class="styLNDesc" style="width:100%;padding-left:4mm;height:auto;">
							*See Appendix B at the end of the instructions for the FEMA number, and for disaster beginning and ending dates. If more than two <br />
							disasters, see instructions and check this box 
							<span class="sty8915FDotLn" style="float:none;">............................</span>
							<input type="checkbox" class="styCkboxNM" style="" alt="Multiple FEMA disasters Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/MultipleFEMADisastersInd"/>
									<xsl:with-param name="BackupName">F8915FMultipleFEMADisastersInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					
					<div class="styStdIBDiv" style="margin-top:3mm;">
						<div class="styLNDesc" style="height:18mm;width:126mm;">
							Date first distribution made this year  
							<span style="width:60mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/FirstDistributionDt"/>
								</xsl:call-template>
							</span>
							<br />
							Date last distribution made this year  
							<span style="width:60mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/LastDistributionDt"/>
								</xsl:call-template>
							</span>
							<br /><br />
							<span style="display:inline;font-weight:bold;font-style:italic;">
								Complete lines 1a through 1e first. If line 1e is zero, stop. Do <span style="text-decoration:underline;">not</span> complete Part I.
							</span>
						</div>
						<div class="sty8915FHeaderBox" style="height:18mm;font-weight:bold;">
							(a) <br /> Available distributions <br /> for this year <br /> <span style="font-weight:normal;">(see instructions)</span>
						</div>
						<div class="sty8915FHeaderBox" style="height:18mm;">
							<strong>(b) <br /> Qualified disaster distributions for the disasters in item C </strong> <br /> (see instructions)
						</div>
					</div>
					<!-- Part 1 Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty8915FDescBox" style="font-weight:bold;">
							Qualified disaster distribution limits (see instructions).
						</div>
						<div class="styLNRightNumBoxNBB" style="border-top:1px solid black;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:30mm;">&nbsp;</div>
					</div>
					<!-- Part 1 Line 1a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="sty8915FDescBox" style="height:auto;">
							Do the following: <br />
							<ul style="padding-left:12px;margin-top:1mm;margin-bottom:0px;">
								<li>Skip lines 1a through 1d. And on line 1e, enter $100,000 times the number of disasters you entered in item C earlier <strong>if:</strong>
									<ul style="padding-left:12px;">
										<li>You checked 2020 in item B earlier and either you didn't file 2020 Form 8915-E or you only reported the coronavirus disaster on 2020 Form 8915-E, <strong>or</strong></li>
										<li>You checked a year other than 2020 in item B and this is the first year you are filing a Form 8915-F for disasters for the year checked in item B.</li>
									</ul>
								</li>
								<li><strong>Otherwise, </strong> on line 1a, enter $100,000 times the number of different qualifed disasters you have reported in item C on prior-year 
										Forms 8915-F for disasters for the year you checked in item B. (Include, in your disaster number, if you checked 2020 in item B, qualifed disaster(s) 
										(other than the coronavirus) reported in Part I of 2020 Form 8915-E.) Also, complete lines 1b through 1e
										<span class="sty8915FDotLn">.......</span>
								</li>
							</ul>
						</div>
						<div class="styLNRightNumBox" style="height:39mm;padding-top:35mm;">1a</div>
						<div class="styLNAmountBox" style="width:30mm;height:39mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="width:30mm;height:39mm;padding-top:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/QualifiedDisasterLimitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 1b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty8915FDescBox" style="height:auto;">
							Enter the total qualified disaster distributions made to you in prior year(s) for all disasters 
							(except coronavirus) for the year you checked in item B
							<span class="sty8915FDotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />1b</div>
						<div class="styLNAmountBox" style="width:30mm;height:7.4mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="width:30mm;height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/PriorYrRptQlfyDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 1c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty8915FDescBox" style="">
							Subtract line 1b from line 1a
							<span class="sty8915FDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="">1c</div>
						<div class="styLNAmountBox" style="width:30mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/PriorYrRptDistriAllocationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 1d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="sty8915FDescBox" style="height:auto;">
							Enter $100,000 times the number of qualified disasters, for the year checked in <br /> item B, that you reported in item C 
							but didn't report in item C on a prior year's <br /> Form 8915-F, or in Part I of 2020 Form 8915-E if you checked 2020 in item B. <br />
							Don't count the coronavirus in the number of qualified disasters
							<span class="sty8915FDotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:13.5mm;"><br /><br /><br />1d</div>
						<div class="styLNAmountBox" style="width:30mm;height:13.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="width:30mm;height:13.5mm;"><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/PriorYrNotRptDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 1e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="sty8915FDescBox" style="height:auto;">
							<strong>Total available qualified disaster distribution amount for this year. </strong> 
							Enter the sum of lines 1c and 1d. 
							<strong>If the amount on line 1e is zero, do NOT complete Part I</strong>
							<!--<span class="sty8915FDotLn">......</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />1e</div>
						<div class="styLNAmountBox" style="width:30mm;height:7.4mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="width:30mm;height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/TotalCYAvailDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="">2</div>
						<div class="sty8915FDescBox" style="font-family:Arial;">
							Enter, in column (a), distributions from retirement plans (other than IRAs) made this year
							<span class="sty8915FDotLn" style="font-family:Verdana;">..</span>
						</div>
						<div class="styLNRightNumBox" style="">2</div>
						<div class="styLNAmountBox" style="width:30mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/DistriFromNotIRARetirePlanGrp/CYTotalDistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/DistriFromNotIRARetirePlanGrp/QualifiedDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="">3</div>
						<div class="sty8915FDescBox" style="font-family:Arial;">
							Enter, in column (a), distributions from traditional, SEP, and SIMPLE IRAs made this year
							<span class="sty8915FDotLn" style="font-family:Verdana;">..</span>
						</div>
						<div class="styLNRightNumBox" style="">3</div>
						<div class="styLNAmountBox" style="width:30mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/DistriFromTrdnSEPSIMPLEIRAGrp/CYTotalDistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/DistriFromTrdnSEPSIMPLEIRAGrp/QualifiedDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="">4</div>
						<div class="sty8915FDescBox" style="font-family:Arial;">
							Enter, in column (a), distributions from Roth IRAs made this year
							<span class="sty8915FDotLn" style="font-family:Verdana;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="">4</div>
						<div class="styLNAmountBox" style="width:30mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/DistributionsFromRothIRAGrp/CYTotalDistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/DistributionsFromRothIRAGrp/QualifiedDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="">5</div>
						<div class="sty8915FDescBox" style="height:auto;">
							Enter on line 5, column (a), the sum of lines 2 through 4 in column (a) reduced by the total distributions from 
							lines 2 through 4 in column (a) that aren't qualified disaster distributions.  <br />
							<ul style="padding-left:12px;margin-top:1mm;margin-bottom:0px;">
								<li>
									See instructions if the years checked in items A and B are the same; more than one disaster is listed in item C; 
									<strong>and</strong> the total on line 5, column (a) exceeds $100,000.
								</li>
								<li>
									<strong>Otherwise</strong>, enter on line 5, column (b), the smaller of the amount on line 5, column (a), or line 1e. 
									Then enter on lines 2 through 4 in column (b) the amounts from lines 2 through 4, respectively, in column (a) 
									<strong>allocated, if needed,</strong> by any reasonable method so that the sum of lines 2 through 4 in column (b) 
									equals the amount on line 5, column (b) 
									<span class="sty8915FDotLn">.................</span>
								</li>
							</ul>
						</div>
						<div class="styLNRightNumBox" style="height:33mm;padding-top:29mm;">5</div>
						<div class="styLNAmountBox" style="width:30mm;height:33mm;padding-top:29mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/TotalDistriAmtFromAllPlansGrp/CYTotalDistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:30mm;height:33mm;padding-top:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/TotalDistriAmtFromAllPlansGrp/QualifiedDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="">6</div>
						<div class="sty8915FDescBox" style="width:140mm;height:auto;">
							<strong>Total qualified disaster distributions. </strong> Enter the amount from line 5, column (b). The 10% additional tax 
							(25% for SIMPLE IRAs) for early withdrawals is waived for this amount. See Parts II and III, later, for the tax on this amount
							<span class="sty8915FDotLn" style="">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.4mm;"><br /><br />6</div>
						<div class="styLNAmountBox" style="width:30mm;height:10.4mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/LimitationDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="">7</div>
						<div class="sty8915FDescBox" style="width:140mm;height:auto;">
							<strong>Taxable amount. </strong> Enter excess of the sum of lines 2 through 4 in column (a) over the amount on line 6. <br />
							Report this excess as IRA and/or pension and annuity distributions, as applicable, in accordance with the <br /> instructions for 
							your tax return. All or part of the amount on line 7 may be eligible for the tax benefits in <br /> Part IV. See instructions
							<span class="sty8915FDotLn" style="">..........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:13.4mm;"><br /><br /><br />7</div>
						<div class="styLNAmountBoxNBB" style="width:30mm;height:13.4mm;"><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDistriAllRetirePlansGrp/TaxableExcessAllocationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>8915-F</strong> (1-2023)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDiv">
						Form 8915-F (1-2023)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="height:auto;">
							Qualified Disaster Distributions From Retirement Plans (Other Than IRAs) for the Coronavirus and Disaster(s) Listed in Item C
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="">
							Did you enter an amount on line 2, column (b)?
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/QlfyDsstrDistriNotIRAPlansInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" alt="Qualified Disaster Distributions from Non IRA Retirement No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/QlfyDsstrDistriNotIRAPlansInd"/>
									<xsl:with-param name="BackupName">F8915FQlfyDsstrDistriNotIRAPlansInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong>No. </strong> Skip lines 8 through 11, and go to line 12.
							<input type="checkbox" class="styCkboxNM" style="margin-left:6mm;margin-right:1mm;" alt="Qualified Disaster Distributions from Non IRA Retirement Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/QlfyDsstrDistriNotIRAPlansInd"/>
									<xsl:with-param name="BackupName">F8915FQlfyDsstrDistriNotIRAPlansInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong>Yes. </strong> Enter the amount from line 2, column (b)
							<span class="sty8915FDotLn">.</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/QlfyDistriOrAllocationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="">
							Enter the applicable cost of distributions, if any. See instructions
							<span class="sty8915FDotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="">9</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/DistributionsCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="height:auto;">
							Subtract line 9 from line 8. This is the taxable amount of your other-than-IRA retirement plan qualified disaster distributions
							<span class="sty8915FDotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />10</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/QlfyDistriMinusDistriCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:auto;">
							The entire taxable amount on line 10 will be spread over 3 years unless you elect to have it taxed in this year. 
							<strong>If you elect NOT to spread the taxable amount over 3 years, check this box </strong> 
							<input type="checkbox" class="styCkboxNM" style="margin:0px 4px;" alt="Opt Out Spread Three Years Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/OptOutSpreadThreeYrsInd"/>
									<xsl:with-param name="BackupName">F8915FNotIRARPOptOutSpreadThreeYrsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong> and enter the amount from line 10 (see instructions). Otherwise, enter the amount from line 10 divided by 3.0. </strong>
							You must check the box on this line if you check the box on line 22
							<span class="sty8915FDotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">11</div>
						<div class="styLNAmountBox" style="height:14mm;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/CYQlfySelectedDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the amount, if any, from Worksheet 2 in the instructions. This is your income for prior years from <br />
							other-than-IRA retirement plan qualified disaster distributions
							<span class="sty8915FDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />12</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/PriorYrSelectedDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="height:auto;">
							Add lines 11 and 12. This is your total income this year from other-than-IRA retirement plan qualified <br /> disaster distributions
							<span class="sty8915FDotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />13</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/SumPriorYrAndCYSelDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total repayment. </strong> Enter the amount, if any, from Worksheet 3. This is your total repayment for this year of <br />
							other-than-IRA retirement plan qualified disaster distributions
							<span class="sty8915FDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />14</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/TotalRepymtOtherThanIRAAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Amount subject to tax this year. </strong> Subtract line 14 from line 13. If zero or less, enter -0-. Include this <br />
							amount in the total on line 5b of this year's Form 1040, 1040-SR, or 1040-NR. See instructions
							<span class="sty8915FDotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.4mm;"><br />15</div>
						<div class="styLNAmountBoxNBB" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDsstrDistriNotIRAPlansGrp/CYTaxableDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="padding:2px 0px;border-top:2px solid black;">
						<span style="font-weight:bold;font-style:italic;">Before you begin: </span> 
						Complete this year's Form 8606, Nondeductible IRAs, if required.
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="height:auto;">
							Qualified Disaster Distributions From Traditional, SEP, SIMPLE, and Roth IRAs for the Coronavirus and Disaster(s) Listed in Item C
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="height:auto;">
							Did you enter an amount on line 3, column (b), or line 4, column (b)? <br />
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/QlfyDistriTrdnSEPSIMPLERothInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:4px;" alt="Qualified Disaster Distribution from IRA Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/QlfyDistriTrdnSEPSIMPLERothInd"/>
										<xsl:with-param name="BackupName">F8915FQlfyDistriTrdnSEPSIMPLERothInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>Yes. </strong> Go to line 17. 
								<input type="checkbox" class="styCkboxNM" style="margin-left:7mm;margin-right:4px;" alt="Qualified Disaster Distribution from IRA No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/QlfyDistriTrdnSEPSIMPLERothInd"/>
										<xsl:with-param name="BackupName">F8915FQlfyDistriTrdnSEPSIMPLERothInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>No. </strong> Skip lines 17 through 22, and go to line 23.
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;">&nbsp;</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="height:auto;">
							Did you receive a qualified disaster distribution from a traditional, SEP, SIMPLE, or Roth IRA that is required <br /> 
							to be reported on this year's Form 8606? <br />
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/QlfyDistriRequiredRptF8606Ind"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:4px;" alt="Qualified Distribution Required 8606 Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/QlfyDistriRequiredRptF8606Ind"/>
										<xsl:with-param name="BackupName">F8915FQlfyDistriRequiredRptF8606Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>Yes. </strong> Go to line 18. 
								<input type="checkbox" class="styCkboxNM" style="margin-left:7mm;margin-right:4px;" alt="Qualified Distribution Required 8606 No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/QlfyDistriRequiredRptF8606Ind"/>
										<xsl:with-param name="BackupName">F8915FQlfyDistriRequiredRptF8606Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<strong>No. </strong> Skip lines 18 and 19, and go to line 20.
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:10.5mm;">&nbsp;</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the amount, if any, from this year's Form 8606, line 15b. But if you are entering amounts here and on other 
							Forms 8915-F for this year, only enter on line 18 the amount on Form 8606, line 15b, attributable to Form 8915-F 
							distributions for this form. See the instructions for Form 8606, line 15b
							<span class="sty8915FDotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.5mm;"><br /><br />18</div>
						<div class="styLNAmountBox" style="height:10.5mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/NondedIRAQlfyDisasterDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the amount, if any, from this year's Form 8606, line 25b. But if you are entering amounts here and on other 
							Forms 8915-F for this year, only enter on line 19 the amount on Form 8606, line 25b, attributable to Form 8915-F 
							distributions for this form. See the instructions for Form 8606, line 25b
							<span class="sty8915FDotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.5mm;"><br /><br />19</div>
						<div class="styLNAmountBox" style="height:10.5mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/RothIRAQlfyDisasterDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the amount from line 3, column (b), if any. Don't include on line 20 any amounts reported on Form 8606
							<span class="sty8915FDotLn">................................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br />20</div>
						<div class="styLNAmountBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/QlfyDistriOrAllocationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="">
							Add lines 18, 19, and 20. This is the taxable amount of your IRA qualified disaster distributions
							<span class="sty8915FDotLn">....</span>
						</div>
						<div class="styLNRightNumBox" style="">21</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/SumForm8606AndDistriAllocnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="height:auto;">
							The entire taxable amount on line 21 will be spread over 3 years unless you elect to have it taxed in this year. 
							<strong>If you elect NOT to spread the taxable amount over 3 years, check this box </strong> 
							<input type="checkbox" class="styCkboxNM" style="margin:0px 4px;" alt="Opt Out Spread Three Years Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/OptOutSpreadThreeYrsInd"/>
									<xsl:with-param name="BackupName">F8915FIRARPOptOutSpreadThreeYrsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong> and enter the amount from line 21 (see instructions). Otherwise, enter the amount from line 21 divided by 3.0. </strong>
							You must check the box on this line if you check the box on line 11
							<span class="sty8915FDotLn">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">22</div>
						<div class="styLNAmountBox" style="height:14mm;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/CYQlfySelectedDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the amount, if any, from Worksheet 4 in the instructions. This is your income for prior years from <br />
							IRA qualified disaster distributions
							<span class="sty8915FDotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />23</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/PriorYrSelectedDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="">
							Add lines 22 and 23. This is your total income this year from IRA qualified disaster distributions
							<span class="sty8915FDotLn">....</span>
						</div>
						<div class="styLNRightNumBox" style="">24</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/SumPriorYrAndCYSelDistriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total repayment. </strong> Enter the amount, if any, from Worksheet 5. This is your total repayment for this year of <br />
							IRA qualified disaster distributions
							<span class="sty8915FDotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />25</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/TotalRepymtIRARetirePlanAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Amount subject to tax. </strong> Subtract line 25 from line 24. If zero or less, enter -0-. Include this amount <br />
							in the total on line 4b of this year's Form 1040, 1040-SR, or 1040-NR. See instructions
							<span class="sty8915FDotLn">.......</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.4mm;"><br />26</div>
						<div class="styLNAmountBoxNBB" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyDistriTrdnSEPSIMPLERothGrp/CYTaxableDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>8915-F</strong> (1-2023)</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDiv">
						Form 8915-F (1-2023)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></span>
					</div>
					<div class="styStdDiv" style="padding:2px 0px;border-top:2px solid black;">
						<span style="font-weight:bold;font-style:italic;">Before you begin: </span> 
						Complete this year's Form 8606, Nondeductible IRAs, if required.
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="height:auto;">
							Qualified Distributions for the Purchase or Construction of a Main Home in the Area of Disaster(s) <br /> Listed in Item C<br />
							<span style="display:inline;font-size:7pt;font-weight:normal;">
								<strong>Caution: </strong> Complete Part IV if, this year, you received a qualified distribution (as defined in the instructions) 
								for a disaster listed in item C earlier. If you repay the distribution, in whole or in part, after this year, see the instructions. 
								For the applicability of Part IV to other years for disasters listed in item C, see the instructions.
							</span>
						</div>
					</div>
					<xsl:variable name="SepHouse" select="($Print = $Separated) and (count($FormData/MainHomeQlfyDistributionsGrp/FEMADisasterGrp) &gt; 1)"/>
					<div class="styTableContainerNBB" id="HouseTable">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:63mm;font-weight:normal;">Disaster FEMA number*</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;">Disaster beginning date*</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;border-right-width:0px;">Disaster ending date*</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($SepHouse)">
									<xsl:for-each select="$FormData/MainHomeQlfyDistributionsGrp/FEMADisasterGrp">
										<tr>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FEMADisasterDeclarationNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DisasterBeginDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DisasterEndDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$SepHouse or (count($FormData/MainHomeQlfyDistributionsGrp/FEMADisasterGrp) &lt; 1)">
									<tr>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/FEMADisasterGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdIBDiv" style="padding:0.5mm 0px;">
						*See Appendix B at the end of the instructions for the FEMA number, and for disaster beginning and end dates.
					</div>
					<div class="styStdIBDiv" style="margin-top:2mm;margin-bottom:2mm;padding:0.5mm 0px;">
						Date first distribution received this year  
						<span style="width:36mm;border-bottom:1px solid black;text-align:center;margin-right:4mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/FirstDistributionDt"/>
							</xsl:call-template>
						</span>
						Date last distribution received this year  
						<span style="width:36mm;border-bottom:1px solid black;text-align:center;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/LastDistributionDt"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Line 27 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc" style="height:auto;">
							Did you receive a qualified distribution from a traditional, SEP, SIMPLE, or Roth IRA that is required <br /> 
							to be reported on this year's Form 8606? <br />
							<span class="styGenericDiv" style="width:4.5mm;height:5mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/QlfyDistriRequiredRptF8606Ind"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:4px;" alt="Qualified Distribution Required 8606 Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/QlfyDistriRequiredRptF8606Ind"/>
										<xsl:with-param name="BackupName">F8915FHomeQlfyDistriRequiredRptF8606Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styGenericDiv" style="width:133mm;">
								<strong>Yes. </strong> Complete lines 28 through 32 only if you also had qualified distributions not required to be reported on this year's Form 8606; otherwise, stop here.
							</span>
							<br />
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/QlfyDistriRequiredRptF8606Ind"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-top:1mm;margin-right:5px;" alt="Qualified Distribution Required 8606 No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/QlfyDistriRequiredRptF8606Ind"/>
										<xsl:with-param name="BackupName">F8915FHomeQlfyDistriRequiredRptF8606Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<strong>No. </strong> Go to line 28.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:17.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:17.5mm;">&nbsp;</div>
					</div>
					<!-- Line 28 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the total amount of qualified distributions you received this year for the purchase or construction of a 
							main home. Don't include any amounts reported on this year's Form 8606. Also, don't include any 
							distributions you reported on line 8 or 20, or on other Forms 8915 for this year, if any
							<span class="sty8915FDotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.5mm;"><br /><br />28</div>
						<div class="styLNAmountBox" style="height:10.5mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/QlfyCYDistriRcvdMainHomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 29 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc" style="">
							Enter the applicable cost of distributions, if any. See instructions
							<span class="sty8915FDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="">29</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/DistributionsCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 30 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">30</div>
						<div class="styLNDesc" style="">
							Subtract line 29 from line 28
							<span class="sty8915FDotLn">........................</span>
						</div>
						<div class="styLNRightNumBox" style="">30</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/QlfyDistriMinusDistriCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 31 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">31</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the total amount of any repayments you made. See instructions for allowable repayments. <br />
							Don't include any repayments treated as rollovers on this year's Form 8606. See instructions
							<span class="sty8915FDotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br />31</div>
						<div class="styLNAmountBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/TotalRepaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1 Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="">32</div>
						<div class="styLNDesc" style="height:auto;">
							<span class="styGenericDiv" style="width:124mm;">
								<strong>Taxable amount. </strong> Subtract line 31 from line 30. If the distribution is: <br />
								<ul style="padding-left:12px;margin-top:0.5mm;margin-bottom:0px;">
									<li>
										From an IRA, include this amount in the total on line 4b of this year's Form 1040, 1040-SR, or 1040-NR.
									</li>
									<li>
										From a retirement plan (other than an IRA), include this amount in the total on line 5b of this year's Form 1040, 1040-SR, or 1040-NR.
									</li>
								</ul>
								<strong>Note: </strong> You may be subject to an additional tax on the amount on line 32. See instructions.
							</span>
							<span class="styGenericDiv" style="width:4mm;">
								<img alt="Curly bracket" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" height="71" width="7"/>
							</span>
							<span class="sty8915FDotLn" style="padding-top:7.8mm;">
								..
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:13mm;padding-top:9mm;">32</div>
						<div class="styLNAmountBox" style="height:13mm;padding-top:9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MainHomeQlfyDistributionsGrp/MainHomeQlfyTxblDsstrDistriAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;width:40mm;height:8mm;">&nbsp;</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>8915-F</strong> (1-2023)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<xsl:if test="$SepDisasters">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part I - Item C Disasters with Qualified Disaster Distributions</span><br />
						<table class="styDepTbl" style="font-size:7pt;width:187mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:63mm;font-weight:normal;">Disaster FEMA number*</th>
									<th class="styDepTblCell" scope="col" style="width:62mm;font-weight:normal;">Disaster beginning date*</th>
									<th class="styDepTblCell" scope="col" style="width:62mm;font-weight:normal;">Disaster ending date*</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TotalDistriAllRetirePlansGrp/FEMADisasterGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FEMADisasterDeclarationNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DisasterBeginDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DisasterEndDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$SepHouse">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part IV - Disasters Related to Qualified Distributions for Main Home</span><br />
						<table class="styDepTbl" style="font-size:7pt;width:187mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:63mm;font-weight:normal;">Disaster FEMA number</th>
									<th class="styDepTblCell" scope="col" style="width:62mm;font-weight:normal;">Disaster beginning date</th>
									<th class="styDepTblCell" scope="col" style="width:62mm;font-weight:normal;">Disaster ending date</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/MainHomeQlfyDistributionsGrp/FEMADisasterGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FEMADisasterDeclarationNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DisasterBeginDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DisasterEndDt"/>
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
