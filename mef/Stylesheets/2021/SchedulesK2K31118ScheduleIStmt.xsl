<?xml version="1.0" encoding="UTF-8"?>
<!-- Last modified on 10/20/2009 by Sandy Cram  Updates made per WSP-091514OTH -->
<!-- Last modified on 6/28/2010 by Sandy Cram  Updates made per WSP-100548OTH -->
<!-- Last modified on 8/31/2010 by Kelly Hytrek Updates made per defect 26988 -->
<!-- Last modified on 9/1/2010 by Kelly Hytrek  Updates made per WSP-101975OTH -->
<!-- Last modified on 10/25/2010 by Kelly Hytrek  Updates made per defect 27667 -->
<!-- Last modified on 09/27/2012 by Kelly Hytrek  Updates made per defect 33777 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<!--<xsl:include href="IRS1118ScheduleIStyle.xsl"/>-->
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/SchedulesK2K31118ScheduleIStmt"/>
	<xsl:param name="DependencyData" select="$RtnDoc/SchedulesK2K31118ScheduleIStmt"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- /////////////////////////////////////////// -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Depdendency 1118 Schedule I"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!--<xsl:call-template name="IRS1118ScheduleIStyle"/>-->
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<!--BEGIN CATEGORY OF INCOME SECTION -->
				<div class="styBB" style="width:256mm;float:none;">
    Use a separate Schedule I (Form 1118) for each applicable category of income (see instructions).
    <br/>
					<!-- Lines a-c before Part I -->
					<div style="width:249mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">a</div>
						<div class="styLNDesc" style="width:200mm;height:4mm;">
                Separate Category (Enter code—see instructions.)
				<!-- dotted line -->
							<span class="styDotLn" style="float:none;padding-left:2mm">................................</span>
							<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
						</div>
						<span style="float:left;padding-right:0mm;">
							<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;padding-bottom:0px;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SeparateCategoryCd"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div style="width:249mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">b</div>
						<div class="styLNDesc" style="width:200mm;height:4mm;">
                If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)
				<!-- dotted line -->
							<span class="styDotLn" style="float:none;padding-left:2mm">................</span>
							<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
						</div>
						<span style="float:left;padding-right:0mm;">
							<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;padding-bottom:0px;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div style="width:249mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">c</div>
						<div class="styLNDesc" style="width:200mm;height:4mm;">
                If one of the RBT codes is entered on line a, enter the country code for the treaty country (see instructions)
				<!-- dotted line -->
							<span class="styDotLn" style="float:none;padding-left:2mm">............</span>
							<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
						</div>
						<span style="float:left;padding-right:0mm;">
							<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;padding-bottom:0px;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TreatyCountryCd"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
				</div>
				<!--END CATEGORY OF INCOME SECTION-->
				<!--Table Begins Here-->
				<!-- Part I-->
				<div class="styStdDivLS">
					<div class="styPartName" style="">Part I</div>
					<div class="styPartDesc" style="width:236mm;">
						Combined Foreign Oil and Gas Income and Taxes
					</div>
				</div>
				<!-- Part I table columns 1-7 -->
					<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;border:none;">
						<thead style="display:table-header-group;">
							<tr>
								<th class="styDepTblCell" style="width:8mm;height:14mm;background-color:lightgrey;text-align:center;" rowspan="2" scope="col">
									<span style="width:1px;"/>
								</th>
								<th class="styDepTblCell" style="width:25mm;height:14mm;text-align:center;padding-top:2mm;padding-left:2mm;
        padding-right:2mm" rowspan="2" scope="col">
									<b>1(a). </b>EIN or Reference ID
        </th>
								<th class="styDepTblCell" style="width:25mm;height:14mm;text-align:center;padding-top:2mm;padding-left:3mm;
        padding-right:3mm" rowspan="2" scope="col">
									<b>1(b). </b>Foreign country or U.S. possession
					  (enter two-letter code -- use a separate
					  line for each)
        </th>
								<th class="styDepTblCell" style="height:4mm;width:auto;font-size:7pt;font-weight:bold;border-right-width:0px;
			text-align:center;" colspan="6" scope="col">
          Gross Foreign Oil and Gas Income From Sources Outside the United States and its Possessions
								</th>
							</tr>
							<tr>
								<th class="styDepTblCell" style="width:33mm;text-align:center;height:10mm;" scope="col">
									<span class="styBoldText">2.</span> Gross foreign oil and gas extraction income</th>
								<th class="styDepTblCell" style="width:33mm;text-align:center;height:10mm" scope="col">
									<span class="styBoldText">3. </span> Gross foreign oil related income </th>
								<th class="styDepTblCell" style="width:33mm;text-align:center;height:10mm" scope="col">
									<span class="styBoldText">4. </span> Certain dividends from foreign corporations</th>
								<th class="styDepTblCell" style="width:33mm;text-align:center;height:10mm" scope="col">
									<span class="styBoldText">5. </span> Inclusions under sections 951(a)(1) and 951A</th>
								<th class="styDepTblCell" style="width:33mm;border-right-width:1px;text-align:center;height:10mm" scope="col">
									<span class="styBoldText">6.</span> Other</th>
								<th class="styDepTblCell" style="width:33mm;border-right-width:0px;text-align:center;height:10mm;" scope="col">
									<span class="styBoldText">7. </span> Total (add columns 2 <br/>through 6)</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody>
								<xsl:for-each select="$FormData/ForeignOilAndGasIncomeTaxes">
									<tr>
										<td class="styDepTblCell" style="width:6mm;font-weight:bold;text-align:center;" scope="row">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RowId"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:center;width:auto;word-break:break-all;">
											<xsl:choose>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:for-each select="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
														<xsl:if test="position() != last()"><br /></xsl:if>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styDepTblCell" style="text-align:center;width:30mm;width:auto;">
											<xsl:choose>
												<xsl:when test="(ForeignCountryOrUSPossessionCd)">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Section863bIncomeCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styDepTblCell" style="width:auto;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GroFrgnOilGasExtractionIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:auto;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GroForeignOilRelatedIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:auto;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsPaidFrgnCorpAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:auto;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InclusionsSect951a1Or951AAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:auto;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherGrossIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:auto;border-right-width:0px;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalGrossIncomeAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							<tr>
								<td class="styDepTblCell" style="width:auto;height:4mm;font-weight:bold;text-align:left;" colspan="3" scope="row">
           Totals <span style="font-weight:normal;">(add lines A through F)</span>
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/GroFrgnOilGasExtractionIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/GroForeignOilRelatedIncomeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/DividendsPaidFrgnCorpAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/InclusionsSect951a1Or951AAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/OtherGrossIncomeAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;border-right-width:0px;padding-right:2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/TotalGrossIncomeAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--</xsl:if>-->
						</tbody>
					</table>
				<!-- End First Table Code -->
				<div class="styBB" style="width:256mm;padding-left:5mm;float:none;margin-bottom:8mm;">* For section 863(b) income, use a single line (see instructions). </div>
				<!-- spacer line to accommodate the button -->
				<!-- Part I table columns 7-13 -->
					<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;border:none;">
						<thead style="display:table-header-group;">
							<tr style="border-top:1px solid black;">
								<th class="styDepTblCell" style="width:6mm;height:14mm;background-color:lightgrey;text-align:center;" rowspan="2" scope="col">
									<span style="width:1px;"/>
								</th>
								<th class="styDepTblCell" style="width:auto;height:4mm;font-weight:bold;text-align:center;" colspan="3" scope="col">
          Deductions
        </th>
								<th class="styDepTblCell" style="width:auto;height:4mm;font-weight:bold;text-align:center;border-bottom:0px" colspan="1" scope="col">
								</th>
								<th class="styDepTblCell" style="width:auto;height:4mm;font-weight:bold;border-right-width:0px;text-align:center;" colspan="2" scope="col">
          Foreign Oil and Gas Taxes
								</th>
							</tr>
							<tr>
								<th class="styDepTblCell" style="height:10mm;width:41mm;text-align:center;" scope="col">
									<span class="styBoldText">8. </span> Allocable deductions</th>
								<th class="styDepTblCell" style="height:10mm;width:41mm;text-align:center;" scope="col">
									<span class="styBoldText">9.</span> Apportioned deductions</th>
								<th class="styDepTblCell" style="height:10mm;width:41mm;text-align:center;" scope="col">
									<span class="styBoldText">10.</span> Total (add columns 8 and 9)</th>
								<th class="styDepTblCell" style="text-align:center;height:10mm;width:41mm;" scope="col">
									<b>11.</b> Taxable income (column 7 minus column 10)
                </th>
								<th class="styDepTblCell" style="height:10mm;width:41mm;text-align:center;" scope="col">
									<span class="styBoldText">12.</span> Paid or accrued</th>
								<!-- <th class="styDepTblCell" style="height:10mm;width:35mm;text-align:center;" scope="col">
                  <span class="styBoldText">13.</span> Deemed paid</th>-->
								<th class="styDepTblCell" style="height:10mm;width:41mm;border-right-width:0px;text-align:center;" scope="col">
									<span class="styBoldText">14.</span> Total (add columns 12 and 13)</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody style="">
								<xsl:for-each select="$FormData/ForeignOilAndGasIncomeTaxes">
									<tr>
										<td class="styDepTblCell" style="width:6mm;font-weight:bold;text-align:center" scope="row">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RowId"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="text-align:right;width:41mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DefinitelyAllocableDedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ApportionedShareDeductionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalAllocableDeductionsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxableIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell">
											<span style="float:left; clear:none">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasIncomeTaxes/OilGasExtractionTxsPaidAccrAmt"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OilGasExtractionTxsPaidAccrAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:45mm;border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalOilGasExtractionTaxesAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							<tr> 
								<td class="styDepTblCell" style="width:6mm;height:4mm;text-align:left;font-weight:bold;font-size:7pt" scope="row">
								 Totals 
								</td>
								<td class="styDepTblCell" style="text-align:right;width:auto;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/DefinitelyAllocableDedAmt"/>
								</xsl:call-template>  
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/ApportionedShareDeductionAmt"/>
								</xsl:call-template>  
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/TotalAllocableDeductionsAmt"/>
								</xsl:call-template>  
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/TaxableIncomeAmt"/>
								</xsl:call-template>  
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/OilGasExtractionTxsPaidAccrAmt"/>
								</xsl:call-template>  
								</td>
								<td class="styDepTblCell" style="width:auto;height:4mm;border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotForeignOilAndGasIncomeTaxes/TotalOilGasExtractionTaxesAmt"/>
								</xsl:call-template>  
								</td>
							</tr>
						</tbody>
					</table>
				
				<!-- part II header -->
				<div class="styStdIBDiv" style="border-top:1px solid black;border-bottom:1px solid black;margin-top:4mm;">
					<div class="styPartName">Part II</div>
					<div class="styPartDesc" style="width:173mm;">
						Reduction Under Section 907(a)
					</div>
				</div>
				<!-- part II line 1 -->
				<div class="styStdIBDiv" style="margin-top:4mm;margin-bottom:4mm;">
					<div class="styLNLeftNumBoxSD">1</div>
					<div class="styLNDesc">
						Combined foreign oil and gas income. (See the instructions for Part II line 1 below.)
            <span class="styDotLn" style="float:right;">........</span>
					</div>
					<div class="styLNAmountBox">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CombForeignOilAndGasIncomeAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- part III header -->
				<div class="styStdIBDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
					<div class="styPartName">Part III</div>
					<div class="styPartDesc">
						Foreign Oil and Gas Taxes Available For Use in the Current Tax Year
					</div>
				</div>
				<!-- part III line 2 -->
				<div class="styStdIBDiv" style="margin-top:4mm;margin-bottom:4mm;">
					<div class="styLNLeftNumBoxSD">2</div>
					<div class="styLNDesc" style="height:auto;">
						Enter the sum of any carryover of foreign oil and gas tax to the current year. Attach a schedule showing the computation in detail
						<span class="styDotLn" style="float:right;">...........................</span>
					</div>
					<div class="styLNAmountBox" style="height:7mm;"><br />
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotCYCarryoverFrgnOilAndTxAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<br/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
