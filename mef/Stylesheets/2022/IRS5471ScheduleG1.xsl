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
	<xsl:include href="IRS5471ScheduleG1Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS5471ScheduleG1" />
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
				<meta name="Description" content="IRS Schedule G-1 Form 5471" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5471ScheduleG1Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form5471ScheduleG1">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:18.3mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE G-1<br />(Form 5471)</span> 
							<br />
							(December 2021)
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
						<div class="styFTBox" style="width:127mm;height:18.3mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;">
								Cost Sharing Arrangement
							</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 5471.
							</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form5471</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:18.3mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:150.2mm;">
							Name of person filing Form 5471 <br />
							<xsl:choose>
								<xsl:when test="$FormData/BusinessName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PersonNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:36mm;padding-left:1mm;font-weight:normal;">
							<strong>Identifying number</strong> <br />
							<xsl:choose>
								<xsl:when test="$FormData/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styNameBox" style="width:110.2mm;height:9mm;">
							Name of foreign corporation <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignCorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignCorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:30mm;height:9mm;padding-left:2px;">
							EIN (if any) <br />
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignCorporationEIN"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;height:9mm;padding-left:1mm;font-weight:normal;word-break:break-all">
							<strong>Reference ID number</strong> (see instructions)<br />
							<xsl:choose>
								<xsl:when test="count($FormData/ForeignEntityIdentificationGrp) &gt; 1">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp"/>
										<xsl:with-param name="Desc">Entity Information - Foreign Entity Identification</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;padding:3px 2px;">
						<strong>Important. </strong> Complete a separate Schedule G-1 for each cost sharing arrangement (CSA) in which the foreign corporation 
						was a participant during the tax year. Report all amounts in U.S. dollars. See instructions.
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							Provide a brief description of the CSA with repect to which this Schedule G-1 is being completed 
							<span style="width:58mm;border-bottom:1px solid black;">&nbsp;</span>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:100%;border-bottom:1px solid black;height:auto;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CostSharingArrangementDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						&nbsp;
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						&nbsp;
					</div>
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:162mm;">
							&nbsp;
						</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
 					</div>
 					<!-- Line 2 -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:162mm;">
							During the course of the tax year, did the foreign corporation become a participant in the CSA?
							<span class="sty5471SG1DotLn">..........</span>
						</div>
						<div class="sty5471SG1YesNoBox">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnCorpBecamePartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Foreign corporation became participant CSA Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnCorpBecamePartcpCostShrInd"/>
									<xsl:with-param name="BackupName">F5471G1FrgnCorpBecamePartcpCostShrInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="sty5471SG1YesNoBox">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnCorpBecamePartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Foreign corporation became participant CSA No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnCorpBecamePartcpCostShrInd"/>
									<xsl:with-param name="BackupName">F5471G1FrgnCorpBecamePartcpCostShrInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
 					</div>
 					<!-- Line 3 -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:162mm;">
							Was the CSA in effect before January 5, 2009?
							<span class="sty5471SG1DotLn">.........................</span>
						</div>
						<div class="sty5471SG1YesNoBox">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/PartcpCostShrPriorSpcfdDateInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="CSA prior to specified date Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartcpCostShrPriorSpcfdDateInd"/>
									<xsl:with-param name="BackupName">F5471G1PartcpCostShrPriorSpcfdDateInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="sty5471SG1YesNoBox">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/PartcpCostShrPriorSpcfdDateInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="CSA prior to specified date No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartcpCostShrPriorSpcfdDateInd"/>
									<xsl:with-param name="BackupName">F5471G1PartcpCostShrPriorSpcfdDateInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
 					</div>
 					<!-- Line 4 -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:162mm;">
							What was the foreign corporation's share of reasonably anticipated benefits for the CSA during the tax year?
							<span style="float:right;">
								&#9658;
								<span style="width:16mm;border-bottom:1px solid black;text-align:right;padding-right:2px;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPartcpShrBnftCSAPct"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="sty5471SG1YesNoBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5471SG1YesNoBox" style="background-color:lightgrey;">&nbsp;</div>
 					</div>
 					<!-- Line 5a -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5a</div>
						<div class="styLNDesc" style="width:162mm;font-family:Arial;">
							Did a U.S. taxpayer make any platform contributions (as defined in Regulations section 1.482-7(c)) to the CSA during the tax year?
							<span class="sty5471SG1DotLn" style="font-family:Verdana;">....</span>
						</div>
						<div class="sty5471SG1YesNoBox">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/PlatformContributionInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Platform contribution Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PlatformContributionInd"/>
									<xsl:with-param name="BackupName">F5471G1PlatformContributionInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="sty5471SG1YesNoBox">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/PlatformContributionInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Platform contribution No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PlatformContributionInd"/>
									<xsl:with-param name="BackupName">F5471G1PlatformContributionInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
 					</div>
 					<!-- Line 5b -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							If the answer to question 5a is "Yes," enter the present value of the platform contributions in U.S. dollars
							&#9658;$
							<span style="width:25mm;font-family:Arial;border-bottom:1px solid black;text-align:right;padding-right:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PlatformContributionAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty5471SG1YesNoBoxNBB" style="height:4.5mm;background-color:lightgrey;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PlatformContributionAmt"/>
							</xsl:call-template>&nbsp;
						</div>
						<div class="sty5471SG1YesNoBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
 					</div>
 					<!-- Line 5c -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							If the answer to question 5a is "Yes," check the box for the method under Regulations 1.482-7(g) used to 
							determine the price of the platform contribution transaction(s) <br />
							<input type="checkbox" class="styCkboxNM" alt="Comparable Uncontrolled Transaction method">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ComparableUncontrolledTransInd"/>
									<xsl:with-param name="BackupName">F5471G1ComparableUncontrolledTransInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:70mm;padding-left:3px;">Comparable uncontrolled transaction method</span>
							<input type="checkbox" class="styCkboxNM" alt="Income method">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeMethodInd"/>
									<xsl:with-param name="BackupName">F5471G1IncomeMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:45mm;padding-left:3px;">Income method</span>
							<input type="checkbox" class="styCkboxNM" alt="Acquisition price method">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AcquisitionPriceMethodInd"/>
									<xsl:with-param name="BackupName">F5471G1AcquisitionPriceMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Acquisition price method
							<br />
							<input type="checkbox" class="styCkboxNM" alt="Market capitalization method">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MarketCapitalizationMethodInd"/>
									<xsl:with-param name="BackupName">F5471G1MarketCapitalizationMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:70mm;padding-left:3px;">Market capitalization method</span>
							<input type="checkbox" class="styCkboxNM" alt="Residual profit split method">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ResidualProfitSplitMethodInd"/>
									<xsl:with-param name="BackupName">F5471G1ResidualProfitSplitMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:45mm;padding-left:3px;">Residual profit split method</span>
							<input type="checkbox" class="styCkboxNM" alt="Unspecified method">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/UnspecifiedMethodsInd"/>
									<xsl:with-param name="BackupName">F5471G1UnspecifiedMethodsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Unspecified method
						</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;height:15mm;">&nbsp;</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;height:15mm;">&nbsp;</div>
 					</div>
 					<!-- Line 6a -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="">6a</div>
						<div class="styLNDesc" style="width:162mm;">
							Enter the total amount of stock-based compensation deductions claimed by the filer for the tax year
							<span style="float:right;">
								&#9658;$
								<span style="width:27mm;border-bottom:1px solid black;text-align:right;padding-right:2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/StockBasedCompDedClaimedAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
 					</div>
 					<!-- Line 6b -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							Enter the total amount of deductions for the tax year for stock-based compensation that was granted during the term of <br /> 
							the CSA and, at the date of the grant is directly identified with, or reasonably allocable to, the intangible development <br /> 
							activity under the CSA
							<span style="float:right;">
								<span class="sty5471SG1DotLn" style="float:none;padding-right:0px;padding-left:3px;margin-right:-4px;">........................&#9658;</span>
								$
								<span style="width:27mm;border-bottom:1px solid black;text-align:right;padding-right:2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CompClmTrtdAsIntngblDevAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;height:10.5mm;">&nbsp;</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;height:10.5mm;">&nbsp;</div>
 					</div>
 					<!-- Line 6c -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							Was there any stock-based compensation granted during the term of the CSA to individuals who performed functions in <br /> 
							business activities that generate cost shared intangibles that was not treated as directly identified with, or reasonably <br />
							allocable to, the intangible development activity?
							<span class="sty5471SG1DotLn" style="">........................</span>
						</div>
						<div class="sty5471SG1YesNoBox" style="background-color:lightgrey;height:6.5mm;">&nbsp;</div>
						<div class="sty5471SG1YesNoBox" style="background-color:lightgrey;height:6.5mm;">&nbsp;</div>
						<div class="sty5471SG1YesNoBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CompClmNotTrtdAsIntngblDevInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Stock compensation not treated as intangible development Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CompClmNotTrtdAsIntngblDevInd"/>
									<xsl:with-param name="BackupName">F5471G1CompClmNotTrtdAsIntngblDevInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="sty5471SG1YesNoBox" style="height:4.2mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CompClmNotTrtdAsIntngblDevInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Stock compensation not treated as intangible development No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CompClmNotTrtdAsIntngblDevInd"/>
									<xsl:with-param name="BackupName">F5471G1CompClmNotTrtdAsIntngblDevInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
 					</div>
 					<!-- Line 7a -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="">7a</div>
						<div class="styLNDesc" style="width:162mm;">
							For the tax year, enter the total amount of intangible development costs for the CSA
							<span style="float:right;">
								<span class="sty5471SG1DotLn" style="float:none;padding-right:0px;padding-left:3px;margin-right:-4px;">.....&#9658;</span>
								$
								<span style="width:27mm;border-bottom:1px solid black;text-align:right;padding-right:2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IntngblDevCostsAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
 					</div>
 					<!-- Line 7b -->
 					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:162mm;height:auto;">
							For the tax year, enter the amount of intangible development costs allocable to the foreign corporation based on the 
							foreign corporation's reasonably anticipated benefits share
							<span style="float:right;">
								<span class="sty5471SG1DotLn" style="float:none;padding-right:0px;padding-left:3px;margin-right:-4px;">...............&#9658;</span>
								$
								<span style="width:27mm;border-bottom:1px solid black;text-align:right;padding-right:2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IntngblDevCostsPartcpShrAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;height:7.5mm;">&nbsp;</div>
						<div class="sty5471SG1YesNoBoxNBB" style="background-color:lightgrey;height:7.5mm;">&nbsp;</div>
 					</div>
 					
 					<div class="styStdDiv" style="border-top:2px solid black;font-weight:bold;">
						For Paperwork Reduction Act Notice, see instructions. 
						<span style="margin-left:15mm;font-weight:normal;">Cat. No. 33569U</span>
						<span style="float:right;">Schedule G-1 (Form 5471) (12-2021)</span>
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
					<!-- Reference ID Number -->
					<xsl:if test="(count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
						<br />
						<br />
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
										Reference ID number (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ForeignEntityIdentificationGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</span>
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
