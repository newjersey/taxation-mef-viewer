<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120FSchedulePStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest   -->
	<xsl:param name="FormData" select="$RtnDoc/IRS1120FScheduleP"/>
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
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Form IRS1120FScheduleP"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- PRINT statement-->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120FSchedulePStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form1120FScheduleP">
					<!-- BEGIN WARNING LINE -->
					<div class="styGenericDiv" style="width:187mm;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<!-- END WARNING LINE -->
					<!--Begin Header-->
					<div class="styBB" style="width: 187mm">
						<!-- Form Name -->
						<div class="styFNBox" style="height: 18mm;width:28mm;">
							<span class="styFormNumber" style="font-size:10pt;">SCHEDULE P</span>
							<br/>
							<span class="styFormNumber" style="font-size:10pt;">(Form 1120-F)
				  <br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</span>
							<div class="styAgency" style="padding-top:4mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<!-- Form Title Box -->
						<div class="styFTBox" style="height: 18mm;width:131mm;padding-top:3mm;">
							<!-- Form Title -->
							<span class="styMainTitle" style="padding-top:1mm;">List of Foreign Partner Interests in Partnerships</span>
							<span style="font-weight:bold;padding-top:2mm;">
								<img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>Attach to Form 1120-F.
				  <br/>
								<img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>
								<b> Go to </b>
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1120F" title="Link to irs.gov">
									<i>www.irs.gov/Form1120F</i>
									<b> for instructions and the latest information.</b>
								</a>
							</span>
						</div>
						<!-- Tax Year Box -->
						<div class="styTYBox" style="height: 18mm;width:28mm;">
							<!-- OMB No. -->
							<div class="styOMB" style="text-align:center;">OMB No. 1545-0123</div>
							<!-- Tax Year -->
							<div class="styTY" style="text-align: center; padding-top: 1.8mm">
				  20<span class="styTYColor">22</span>
							</div>
						</div>
					</div>
					<!-- Name and Address -->
					<!--End header-->
					<xsl:variable name="DistributiveShareTreatedAsECIID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
						</xsl:call-template>
					</xsl:variable>
					<!--Begin Name/EIN-->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
				Name of corporation (foreign partner)
				<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
							<span style="font-size:6pt; font-weight:bold">Employer identification number (EIN)</span>
							<br/>
							<br/>
							<xsl:choose>
								<xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="normalize-space($FormData/MissingEINReasonCd) != ''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="($RtnHdrData/Filer/EIN)">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--End Name/EIN-->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<!-- Begin Part I -->
						<div class="sty1120FSchPSectionTitle" style="border-top-width:0px;border-bottom-width:1px;width:187mm;">
							<div class="styPartName" style="height:4mm;">Part I</div>
							<div class="styPartDesc" style="width:167mm;">
					List of Foreign Partner Interests in Partnerships
				  </div>
							<div style="height:4mm;float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'OFCctn' "/>
									<xsl:with-param name="imageID" select=" 'OFCimg' "/>
									<xsl:with-param name="buttonID" select=" 'OFCbtn' "/>
								</xsl:call-template>
							</div>
						</div>
						<!-- button display logic -->
						<!-- begin Part I Table -->
						<div id="OFCctn">
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="($Print = $Separated)">styGenericDiv</xsl:when>
									<xsl:otherwise>styTableContainer</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="style">
								<xsl:choose>
									<xsl:when test="($Print = $Separated)">height:auto;clear:all;</xsl:when>
									<xsl:otherwise>height:auto;</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<!-- begin print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end print logic -->
							<table class="styTable" cellspacing="0" style="font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:5mm;border-right:0;"/>
										<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;text-align:left;">
											<b>(a) </b>Name of partnership</th>
										<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;">
											<b>(b) </b>Address</th>
										<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
											<b>(c) </b>EIN</th>
										<th class="styTableCellHeader" scope="col" style="width:44mm;height:22mm;border-right:0;text-align:left;padding-left:2mm;font-weight:normal;">
											<b>(d) </b>For each partnership interest, is the foreign corporation?s distributive share ECI, or treated as ECI, 
							in whole or in part, with a U.S. trade or business determined under section 875 (see instructions)?
						  </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($FormData/ForeignPartnerInformationGrp) &lt;= 4) ">
										<xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
											<tr>
												<td class="styTableCell">
													<xsl:attribute name="style">
														<xsl:choose>
															<xsl:when test="(position() = last()) and (count($FormData/ForeignPartnerInformationGrp) &gt;4)">width:5mm;border-right:0;border-bottom:0;</xsl:when>
															<xsl:otherwise>width:5mm;border-right:0;</xsl:otherwise>
														</xsl:choose>
													</xsl:attribute>
													<span class="styLNLeftNumBoxSD" style="width:5mm;height:12mm;">
														<xsl:number format="A" value="position()"/>
													</span>
												</td>
												<!--Name-->
												<td class="styTableCell">
													<xsl:attribute name="style">
														<xsl:choose>
															<xsl:when test="(position() = last()) and (count($FormData/ForeignPartnerInformationGrp) &gt;4)">
																height:12mm;text-align:left;border-bottom:0;vertical-align:top;
															</xsl:when>
															<xsl:otherwise>height:12mm;text-align:left;vertical-align:top;</xsl:otherwise>
														</xsl:choose>
													</xsl:attribute>
													<xsl:choose>
														<xsl:when test="PartnerPersonNm">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PartnerPersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="PartnerBusinessName/BusinessNameLine1Txt">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="PartnerBusinessName/BusinessNameLine2Txt">
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:when>
													</xsl:choose>
												</td>
												<!--Address-->
												<td class="styTableCell">
													<xsl:attribute name="style">
														<xsl:choose>
															<xsl:when test="(position() = last()) and (count($FormData/ForeignPartnerInformationGrp) &gt;4)">
																height:12mm;text-align:left;vertical-align:top;border-bottom:0;
															</xsl:when>
															<xsl:otherwise>height:12mm;text-align:left;vertical-align:top;</xsl:otherwise>
														</xsl:choose>
													</xsl:attribute>
													<xsl:choose>
														<xsl:when test="PartnerUSAddress">
															<xsl:call-template name="PopulateUSAddressTemplate">
																<xsl:with-param name="TargetNode" select="PartnerUSAddress"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="PartnerForeignAddress">
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="PartnerForeignAddress"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
												</td>
												<!--EIN-->
												<td class="styTableCell">
													<xsl:attribute name="style">
														<xsl:choose>
															<xsl:when test="(position() = last()) and (count($FormData/ForeignPartnerInformationGrp) &gt;4)">text-align:center;vertical-align:middle;border-bottom:0;</xsl:when>
															<xsl:otherwise>text-align:center;vertical-align:middle;</xsl:otherwise>
														</xsl:choose>
													</xsl:attribute>
													<xsl:choose>
														<xsl:when test="PartnerEIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="PartnerEIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<!--Foreign Corp -->
												<td class="styTableCell">
													<xsl:attribute name="style">
														<xsl:choose>
															<xsl:when test="(position() = last()) and (count($FormData/ForeignPartnerInformationGrp) &gt;4)">
                            border-right:0;height:12mm;text-align:center;vertical-align:middle;border-bottom:0;</xsl:when>
															<xsl:otherwise>border-right:0;height:12mm;text-align:center;vertical-align:middle;</xsl:otherwise>
														</xsl:choose>
													</xsl:attribute>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
													</xsl:call-template>
													<!-- per IBM to add PopulateSpan to boolean (yes/no) checkbox -->
													<input type="checkbox" class="styCkbox" alt="Distributive Share Treated As ECI Yes Box" name="checkbox">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
															<xsl:with-param name="BackupName">Distributive Share Treated As ECI Yes Box<xsl:value-of select="position()"/>
															</xsl:with-param>
														</xsl:call-template>
														<!--  <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
													</input>
													<label>
														<xsl:call-template name="PopulateLabelYes">
															<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
															<xsl:with-param name="BackupName">Distributive Share Treated As ECI Yes Label<xsl:value-of select="position()"/>
															</xsl:with-param>
														</xsl:call-template>
														<!--xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
													</label>
													<span style="width:2mm;"/>
													<b>Yes</b>
													<span style="width:5mm"/>
													<input type="checkbox" class="styCkbox" alt="Distributive Share Treated As ECI No Box" name="checkbox">
														<xsl:call-template name="PopulateNoCheckbox">
															<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
															<xsl:with-param name="BackupName">Distributive Share Treated As ECI No Box<xsl:value-of select="position()"/>
															</xsl:with-param>
														</xsl:call-template>
														<!--<xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[1]')"/></xsl:attribute>-->
													</input>
													<label>
														<xsl:call-template name="PopulateLabelNo">
															<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
															<xsl:with-param name="BackupName">Distributive Share Treated As ECI No Label<xsl:value-of select="position()"/>
															</xsl:with-param>
														</xsl:call-template>
														<!--<xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[1]')"/></xsl:attribute>-->
														<span style="width:2mm"/>
														<b>No</b>
													</label>
													<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ for inline table  -->
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- begin Part I empty table format -->
									<xsl:if test="count($FormData/ForeignPartnerInformationGrp)&lt; 1 or ((count($FormData/ForeignPartnerInformationGrp) &gt; 4) and ($Print = $Separated))">
										<tr style="height:8mm;">
											<td class="styTableCell" style="width:5mm;border-right:0;vertical-align:top;">
												<b>A</b>
											</td>
											<td class="styTableCell" style="text-align:left;padding-left:2mm;">
												<xsl:if test="((count($FormData/ForeignPartnerInformationGrp) &gt; 4) and ($Print = $Separated))">
													<xsl:choose>
														<xsl:when test="$FormData/ForeignPartnerInformationGrp/PartnerPersonNm">
															<xsl:call-template name="PopulateAdditionalDataTableMessage">
																<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerPersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="$FormData/ForeignPartnerInformationGrp/PartnerBusinessName/BusinessNameLine1Txt">
															<xsl:call-template name="PopulateAdditionalDataTableMessage">
																<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
												</xsl:if>
											</td>
											<td class="styTableCell"/>
											<td class="styTableCell"/>
											<td class="styTableCell" style="border-right:0;text-align:center;vertical-align:bottom;">
												<input type="checkbox" class="styCkbox"  alt="Distributive Share Treated As ECI A Yes Box">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI A Yes Box</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:2mm"/>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI A Yes Label</xsl:with-param>
													</xsl:call-template>
													<b>Yes</b>
												</label>
												<span style="width:7mm"/>
												<input type="checkbox" class="styCkbox"  alt="Distributive Share Treated As ECI A No Box">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI A No Box</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm"/>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI A No Label</xsl:with-param>
													</xsl:call-template>
													<b>No</b>
												</label>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/ForeignPartnerInformationGrp)&lt; 2  or ((count($FormData/ForeignPartnerInformationGrp) &gt; 4) and ($Print = $Separated))">
										<tr style="height:8mm;">
											<td class="styTableCell" style="width:5mm;border-right:0;vertical-align:top;">
												<b>B</b>
											</td>
											<td class="styTableCell"/>
											<td class="styTableCell"/>
											<td class="styTableCell"/>
											<td class="styTableCell" style="border-right:0;text-align:center;vertical-align:bottom;">
												<input type="checkbox" class="styCkbox"  alt="Distributive Share Treated As ECI D Yes Box">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI B Yes Box</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:2mm"/>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI B Yes Label</xsl:with-param>
													</xsl:call-template>
													<b>Yes</b>
												</label>
												<span style="width:7mm"/>
												<input type="checkbox" class="styCkbox"  alt="Distributive Share Treated As ECI B No Box">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI B No Box</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm"/>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI B No Label</xsl:with-param>
													</xsl:call-template>
													<b>No</b>
												</label>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/ForeignPartnerInformationGrp)&lt; 3 or ((count($FormData/ForeignPartnerInformationGrp) &gt; 4) and ($Print = $Separated))">
										<tr style="height:8mm;">
											<td class="styTableCell" style="width:5mm;border-right:0;vertical-align:top;">
												<b>C</b>
											</td>
											<td class="styTableCell"/>
											<td class="styTableCell"/>
											<td class="styTableCell"/>
											<td class="styTableCell" style="border-right:0;text-align:center;vertical-align:bottom;">
												<input type="checkbox" class="styCkbox"  alt="Distributive Share Treated As ECI C Yes Box">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI C Yes Box</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:2mm"/>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI C Yes Label</xsl:with-param>
													</xsl:call-template>
													<b>Yes</b>
												</label>
												<span style="width:7mm"/>
												<input type="checkbox" class="styCkbox"  alt="Distributive Share Treated As ECI C No Box">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI C No Box</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm"/>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI C No Label</xsl:with-param>
													</xsl:call-template>
													<b>No</b>
												</label>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/ForeignPartnerInformationGrp)&lt; 4 or ((count($FormData/ForeignPartnerInformationGrp) &gt; 4) and ($Print = $Separated))">
										<tr style="height:8mm;">
											<td class="styTableCell" style="width:5mm;border-right:0;vertical-align:top;">
												<b>D</b>
											</td>
											<td class="styTableCell"/>
											<td class="styTableCell"/>
											<td class="styTableCell"/>
											<td class="styTableCell" style="border-right:0;text-align:center;vertical-align:bottom;">
												<input type="checkbox" class="styCkbox"  alt="Distributive Share Treated As ECI D Yes Box">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI D Yes Box</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:2mm"/>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI D Yes Label</xsl:with-param>
													</xsl:call-template>
													<b>Yes</b>
												</label>
												<span style="width:7mm"/>
												<input type="checkbox" class="styCkbox"  alt="Distributive Share Treated As ECI D No Box">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI D No Box</xsl:with-param>
													</xsl:call-template>
												</input>
												<span style="width:1mm"/>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
														<xsl:with-param name="BackupName">Distributive Share Treated As ECI D No Label</xsl:with-param>
													</xsl:call-template>
													<b>No</b>
												</label>
											</td>
										</tr>
									</xsl:if>
									<!-- end Part I empty table format -->
								</tbody>
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select=" 'OFCctn' "/>
							<xsl:with-param name="imageID" select=" 'OFCimg' "/>
							<xsl:with-param name="buttonID" select=" 'OFCbtn' "/>
						</xsl:call-template>
						<!-- End Part I table -->
						<!-- End Part I -->
						<div class="styNBB" style="width:187mm;clear:all;font-size:8pt;">
							<b>Note: </b>
							<span style="padding-left:2mm;">
					  If the corporation has more than 4 partnership interests, continue on separate page. See instructions.
					</span>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styBB" style="width:187mm;border-top-width:1px;float:none;">
							<div class="styPartName" style="height:4mm;">Part II</div>
							<div class="styPartDesc" style="width:164mm;">
              Summary of Foreign Partner Income and Expenses From Schedule K-3 (Form 1065)
            </div>
						</div>
						<!-- END Part II Title -->
						<!-- Begin Part II Table -->
						<!-- Display Data -->
						<table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt;">
							<tbody>
								<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/ForeignPartnerInformationGrp) &lt; 5)">
									<!--For each table with 4 items do the following-->
									<xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
										<xsl:if test="position() mod 4 = 1">
											<!--Table Header-->
											<tr>
												<td colspan="2" class="styTableCellHeader" style="width:57mm;border:none;"/>
												<td colspan="5" class="styTableCellHeader" style="width:130mm;border:none;font-weight:bold;font-size:8pt;">Schedules K-3</td>
											</tr>
											<tr>
												<td colspan="2" class="styTableCellHeader" style="font-weight:bold;border-bottom:0;"/>
												<xsl:call-template name="CreateTableHeaderCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
												</xsl:call-template>
												<td class="styTableCellHeader" style="width:26mm;border-top-width:1px;border-right:0;">
													<b>Total</b>
												</td>
											</tr>
											<!--Line 1-->
											<tr>
												<td class="styLNLeftNumBox" style="padding-left:2.5mm;">1</td>
												<td class="styTableCellText" scope="row" style="padding-top:0.5mm;padding-left:0;width:49mm;border-bottom:none;">
													<b>Total gross income.</b>  Enter the amount from Schedule K-3, Part X, Section 1, line 21,  column (a).
												<span class="styDotLn" style="float:right;">..</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalGrossIncomeAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalGrossIncomeAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 2-->
											<tr>
												<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">2</td>
												<td class="styTableCellText" scope="row" style="padding-top:2mm;padding-left:0;width:49mm;border-bottom:none;">
													<b>Gross ECI - Partnership determination.</b> Enter the sum of  Schedule K-3, Part X, Section 1, line 21, column (c) plus column (d). 
					          <span class="styDotLn" style="float:right;">..</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/GrossECIPrtshpDeterminationAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/GrossECIPrtshpDeterminationAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 3-->
											<tr>
												<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">3</td>
												<td class="styTableCellText" scope="row" style="padding-left:0;padding-top:2mm;width:49mm;border-bottom:none;">
													<b>Gross ECI - Partner determination.</b>  Enter all applicable amounts from Schedule K-3, Part X,
					           Section 1, column (b) (see instructions).
					          <span class="styDotLn" style="float:right;">..</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/GrossECIPrtnrDeterminationAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/GrossECIPrtnrDeterminationAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 4-->
											<tr>
												<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">4</td>
												<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
													<b>Total deductions and losses.</b>  Enter the amount from Schedule K-3, Part X, Section 2, line 24, column (a). 
					          <span class="styDotLn" style="float:right;">..</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalDeductionsAndLossesAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalDeductionsAndLossesAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 5-->
											<tr>
												<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">5</td>
												<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
													<b>Total deductions and losses deductible against gross ECI - Partnership determination</b>.  Enter the sum of Schedule K-3, Part X, Section 2, line 24, column (c) plus column (d).  
					          <span class="styDotLn" style="float:right;">........</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalDedLossECIPartnershipAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalDedLossECIPartnershipAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 6-->
											<tr>
												<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">6</td>
												<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
													<b>Total deductions and losses deductible against gross ECI - Partner determination</b>.  Enter all applicable amounts from Schedule K-3, Part X, Section 2, column (b) (see instructions).
					          <span class="styDotLn" style="float:right;">.......</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalDedLossECIPartnerAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select=" $FormData/TotalGrp/TotalDedLossECIPartnerAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 7-->
											<tr>
												<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">7</td>
												<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
					          Interest expense directly allocable under Regulations section 1.882-5(a)(1)(ii)(B). 
					          (<b>Note:</b> Include the line 7 total on  Schedule I, line 22.)  
					          <span class="styDotLn" style="float:right;">...</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseAllocableAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseAllocableAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 8-->
											<tr>
												<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:3mm;height:25mm;border-bottom:1px solid black;">8</td>
												<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:1px solid black;padding-top:2mm;">
					          Interest expense on U.S.-booked liabilities as described under Regulations section 1.882-5(d)(2)(vii).  Enter the amount from Schedule K-3, Part X, Section 2, line 7, column (b).  Include the line 8 total on Schedule I, line 9, column (b). 
					          <span class="styDotLn" style="float:right;">......</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseUSBookedLiabAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseUSBookedLiabAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<!-- Part II, Line 1 to 8 when table is empty -->
								<xsl:if test="($Print = $Separated and count($FormData/ForeignPartnerInformationGrp) &gt; 4) or count($FormData/ForeignPartnerInformationGrp) = 0">
									<!--Table Header-->
									<tr>
										<td colspan="2" class="styTableCellHeader" style="width:57mm;border:none;"/>
										<td colspan="5" class="styTableCellHeader" style="width:130mm;border:none;font-weight:bold;font-size:8pt;">Schedules K-3</td>
									</tr>
									<tr>
										<td colspan="2" class="styTableCellHeader" style="width:57mm;border-bottom:0;"/>
										<xsl:call-template name="CreateTableHeaderCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
										</xsl:call-template>
										<td class="styTableCellHeader" style="width:26mm;border-top-width:1px;border-right:0;">
											<b>Total</b>
										</td>
									</tr>
									<!--Line 1-->
									<tr>
										<td class="styLNLeftNumBox" style="padding-left:2.5mm;">1</td>
										<td class="styTableCellText" scope="row" style="padding-top:0.5mm;padding-left:0;width:49mm;border-bottom:none;">
											<b>Total gross income.</b>  Enter the amount from Schedule K-3, Part X, Section 1, line 21,  column (a).
					          <span class="styDotLn" style="float:right;">..</span>
										</td>
										<xsl:choose>
											<xsl:when test="count($FormData/ForeignPartnerInformationGrp) = 0">
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="1"/>
													<xsl:with-param name="Stop" select="5"/>
													<xsl:with-param name="TargetNode" select="none"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="2" class="styTableCell" style="width:52mm;text-align:center">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalGrossIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:26mm;">
													<span style="width:1px"/>
												</td>
												<td class="styTableCell" style="width:26mm;">
													<span style="width:1px"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styTableCell" style="width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 2-->
									<tr>
										<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">2</td>
										<td class="styTableCellText" scope="row" style="padding-top:2mm;padding-left:0;width:49mm;border-bottom:none;">
											<b>Gross ECI - Partnership determination.</b> Enter the sum of  Schedule K-3, Part X, Section 1, line 21, column (c) plus column (d). 
					          <span class="styDotLn" style="float:right;">..</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 3-->
									<tr>
										<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">3</td>
										<td class="styTableCellText" scope="row" style="padding-left:0;padding-top:2mm;width:49mm;border-bottom:none;">
											<b>Gross ECI - Partner determination.</b>  Enter all applicable amounts from Schedule K-3, Part X,
					           Section 1, column (b) (see instructions).
					          <span class="styDotLn" style="float:right;">..</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 4-->
									<tr>
										<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">4</td>
										<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
											<b>Total deductions and losses.</b>  Enter the amount from Schedule K-3, Part X, Section 2, line 24, column (a). 
					          <span class="styDotLn" style="float:right;">..</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 5-->
									<tr>
										<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">5</td>
										<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
											<b>Total deductions and losses deductible against gross ECI - Partnership determination</b>.  Enter the sum of Schedule K-3, Part X, Section 2, line 24, column (c) plus column (d).  
					          <span class="styDotLn" style="float:right;">........</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 6-->
									<tr>
										<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">6</td>
										<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
											<b>Total deductions and losses deductible against gross ECI - Partner determination</b>.  Enter all applicable amounts from Schedule K-3, Part X, Section 2, column (b) (see instructions).
					          <span class="styDotLn" style="float:right;">........</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 7-->
									<tr>
										<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">7</td>
										<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
					          Interest expense directly allocable under Regulations section 1.882-5(a)(1)(ii)(B). 
					          (<b>Note:</b> Include the line 7 total on  Schedule I, line 22.)  
					          <span class="styDotLn" style="float:right;">...</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 8-->
									<tr>
										<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:3mm;border-bottom:1px solid black;height:25mm;">8</td>
										<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:1px solid black;padding-top:2mm;">
					          Interest expense on U.S.-booked liabilities as described under Regulations section 1.882-5(d)(2)(vii).  Enter the amount from Schedule K-3, Part X, Section 2, line 7, column (b).  Include the line 8 total on Schedule I, line 9, column (b). 
					          <span class="styDotLn" style="float:right;">......</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- page break and footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm">
						<div style="float:left;">
							<span class="styBoldText" style="width:106mm">For Paperwork Reduction Act Notice, see the Instructions for Form 1120-F.</span>
						</div>
						<span style="width:10mm"/>
						<span style="font-size:6pt">Cat. No. 49677Z</span>
						<span style="font-weight:bold;float:right;">Schedule P (Form 1120-F) 2022</span>
					</div>
					<!-- end page break and footer  
				  <p class="pageEnd"/>
				  -->
					<!-- Begin Page 2 -->
					<div style="width:187mm">
						<span style="font-weigh:normal;float:left;">Schedule P (Form 1120-F) 2022</span>
						<span style="width:138mm;"/>Page <b>2</b>
						<!-- Begin Part III Title -->
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartName" style="height:3.5mm;">Part III</div>
							<div class="styPartDesc" style="width:172mm;padding-left:1mm;height:3.5mm;">
                Foreign Partner's Average Outside Basis Under Regulations sections 1.882-5(b) and 1.884-1(d)(3)
              </div>
						</div>
						<!-- END Part III Title -->
						<!-- Begin Part III Table -->
						<table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt;">
							<tbody>
								<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/ForeignPartnerInformationGrp) &lt; 5)">
									<!--For each table with 4 items do the following-->
									<xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
										<xsl:if test="position() mod 4 = 1">
											<!--Table Header-->
											<!--Table Header-->
											<tr>
												<td colspan="2" class="styTableCellHeader" style="border:none;width:57mm;"/>
												<td colspan="5" class="styTableCellHeader" style="width:130mm;border:none;font-weight:bold;font-size:8pt;">Schedules K-3</td>
											</tr>
											<tr>
												<td colspan="2" class="styTableCellHeader" style="border-bottom:0;"/>
												<xsl:call-template name="CreateTableHeaderCells">
													<xsl:with-param name="Start" select="1"/>
													<xsl:with-param name="Stop" select="5"/>
												</xsl:call-template>
												<td class="styTableCellHeader" style="width:26mm;border-top-width:1px;border-right:0;">
													<b>Total</b>
												</td>
											</tr>
											<!--Line 9-->
											<tr>
												<td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;padding-top:3mm;">9</td>
												<td class="styTableCellText" scope="row" style="padding-top:2mm;height:7mm;padding-left:0;width:49mm;border-bottom:none;">
													Section 705 outside basis
													<span class="styDotLn" style="float:right;">....</span>
												</td>
												<xsl:call-template name="CreateTableCellsLine9">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/Section705OutsideBasisAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="width:26mm;border-right:none;vertical-align:bottom;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/Section705OutsideBasisAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 10a-->
											<tr>
												<td valign="top" class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1mm;">10a</td>
												<td class="styTableCellText" scope="row" style="padding-top:1mm;width:49mm;border-bottom:none;">
					        Partner&#8217;s liabilities included in outside basis under section 752 that give rise
					        to directly allocable interest expense under Regulations section  1.882-5(a)(1)(ii)(B) 
	                <span class="styDotLn" style="float:right;">.........</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerLiabSect18825a1iiBAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerLiabSect18825a1iiBAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 10b-->
											<tr>
												<td valign="top" class="styLNLeftNumBox" style="padding-top:2mm;padding-left:4mm;">b</td>
												<td class="styTableCellText" scope="row" style="padding-top:2mm;width:49mm;border-bottom:none;">
						      All other liabilities included in partner&#8217;s outside basis under section 752
						      <span class="styDotLn" style="float:right;">..</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherLiabilitiesIncludedAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherLiabilitiesIncludedAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 10c-->
											<tr>
												<td valign="top" class="styLNLeftNumBox" style="padding-top:0.5mm;padding-left:4mm;">c</td>
												<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;">
					            Add lines 10a and 10b 
					            <span class="styDotLn" style="float:right;">.....</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalLiabilitiesSection752Amt"/>
												</xsl:call-template>
												<td class="styTableCell" style="width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalLiabilitiesSection752Amt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 10d-->
											<tr>
												<td valign="top" class="styLNLeftNumBox" style="padding-top:0.5mm;padding-left:4mm;">d</td>
												<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;">
					            Subtract line 10c from line 9 
					            <span class="styDotLn" style="float:right;">...</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OutsideBasisLessSect752LiabAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OutsideBasisLessSect752LiabAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 11-->
											<tr>
												<td valign="top" class="styLNLeftNumBox" style="padding-top:0;">11</td>
												<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;">
					            Partner&#8217;s liabilities under Regulations  section 1.884-1(d)(3)(vi). 
					            (<b>Note: </b> Enter the  line 11 total on Schedule I, line 8, column (b) that
					            represents U.S. booked liabilities under Regulations section 1.882-5(d).) 
					            <span class="styDotLn" style="float:right;">.....</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerLiabSect18841d3viAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerLiabSect18841d3viAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 12-->
											<tr>
												<td valign="top" class="styLNLeftNumBox" style="padding-top:2mm;">12</td>
												<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:2mm;">
													<b>Partner&#8217;s outside basis under Regulations section 1.884-1(d)(3)(vi).</b>
					              Add lines 10d  and 11  
					              <span class="styDotLn" style="float:right;">...</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerBasisSect18841d3viAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerBasisSect18841d3viAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 13-->
											<tr>
												<td valign="top" class="styLNLeftNumBox" style="padding-top:2mm">13</td>
												<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:2mm;">
					              Partner&#8217;s outside basis allocable to ECI under Regulations section 
					              1.884-1(d)(3)(i) and 1.882-5. (<b>Note: </b>The line 13 total should generally be entered on Schedule I, line 5, column (b).  
					              However, see the instructions for Schedule I, line 5, column (b) before entering an amount on that line.)   
					              <span class="styDotLn" style="float:right;">.</span>
												</td>
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerOutsideBssAllcblECIAmt"/>
												</xsl:call-template>
												<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
													<xsl:choose>
														<xsl:when test="position() = 1 ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerOutsideBssAllcblECIAmt"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!--Line 14-->
											<tr>
												<td valign="top" class="styLNLeftNumBox" style="padding-left:1mm;padding-top:2mm;border-bottom:1px solid black;height:15mm;">14</td>
												<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:1mm;border-bottom:1px solid black;">
                  Check either the "income" box or the "asset" box to indicate the allocation method used on line 13  (see instructions)  
			            <span class="styDotLn" style="float:right;">........</span>
												</td>
												<xsl:call-template name="CreateTable14">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+4"/>
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/AllocationMethodUsedCd"/>
												</xsl:call-template>
												<td class="sty1120FSchPTableCellAmountShaded" style="width:26mm;border-bottom-width:1px">
													<span style="width:1px"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($Print = $Separated and count($FormData/ForeignPartnerInformationGrp) &gt; 4) or count($FormData/ForeignPartnerInformationGrp) = 0">
									<!--Table Header-->
									<tr>
										<td colspan="2" class="styTableCellHeader" style="border:none;width:57mm;"/>
										<td colspan="5" class="styTableCellHeader" style="width:130mm;border:none;font-weight:bold;font-size:8pt;">Schedules K-3</td>
									</tr>
									<tr>
										<td colspan="2" class="styTableCellHeader" style="border-bottom:0;"/>
										<xsl:call-template name="CreateTableHeaderCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
										</xsl:call-template>
										<td class="styTableCellHeader" style="width:26mm;border-top-width:1px;border-right:0;">
											<b>Total</b>
										</td>
									</tr>
									<!--Line 9 Print is Separated no data (display) -->
									<tr>
										<td class="styLNLeftNumBox" style="padding-left:2.5mm;">9</td>
										<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;">
					        Section 705 outside basis 					           
					        <span class="styDotLn" style="float:right;">....</span>
										</td>
										<xsl:choose>
											<xsl:when test="count($FormData/ForeignPartnerInformationGrp) = 0">
												<xsl:call-template name="CreateTableCells">
													<xsl:with-param name="Start" select="1"/>
													<xsl:with-param name="Stop" select="5"/>
													<xsl:with-param name="TargetNode" select="none"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="2" class="styTableCell" style="width:52mm;text-align:center">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/Section705OutsideBasisAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:26mm;">
													<span style="width:1px"/>
												</td>
												<td class="styTableCell" style="width:26mm;">
													<span style="width:1px"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styTableCell" style="width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 10a-->
									<tr>
										<td valign="top" class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1mm;">10a</td>
										<td class="styTableCellText" scope="row" style="padding-top:1mm;width:49mm;border-bottom:none;">
					        Partner&#8217;s liabilities included in outside basis under section 752 that give rise
					        to directly allocable interest expense under Regulations section  1.882-5(a)(1)(ii)(B) 
	                <span class="styDotLn" style="float:right;">.........</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 10b-->
									<tr>
										<td valign="top" class="styLNLeftNumBox" style="padding-top:2mm;padding-left:4mm;">b</td>
										<td class="styTableCellText" scope="row" style="padding-top:2mm;width:49mm;border-bottom:none;">
						      All other liabilities included in partner&#8217;s outside basis under section 752
						      <span class="styDotLn" style="float:right;">..</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 10c-->
									<tr>
										<td valign="top" class="styLNLeftNumBox" style="padding-top:1.5mm;padding-left:4mm;">c</td>
										<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;">
					            Add lines 10a and 10b 
					            <span class="styDotLn" style="float:right;">.....</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 10d-->
									<tr>
										<td valign="top" class="styLNLeftNumBox" style="padding-top:1.5mm;padding-left:4mm;">d</td>
										<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;">
					            Subtract line 10c from line 9 
					            <span class="styDotLn" style="float:right;">...</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 11-->
									<tr>
										<td valign="top" class="styLNLeftNumBox" style="padding-top:0;">11</td>
										<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;">
					            Partner&#8217;s liabilities under Regulations  section 1.884-1(d)(3)(vi). 
					            (<b>Note: </b> Enter the  line 11 total on Schedule I, line 8, column (b) that
					            represents U.S. booked liabilities under Regulations section 1.882-5(d).) 
					            <span class="styDotLn" style="float:right;">.....</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="width:26mm;border-right:none;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!--Line 12-->
									<tr>
										<td valign="top" class="styLNLeftNumBox" style="padding-top:2mm;">12</td>
										<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:2mm;">
											<b>Partner&#8217;s outside basis under Regulations section 1.884-1(d)(3)(vi).</b>
					              Add lines 10d  and 11  
					              <span class="styDotLn" style="float:right;">...</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 13-->
									<tr>
										<td valign="top" class="styLNLeftNumBox" style="padding-top:2mm">13</td>
										<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:2mm;">
					              Partner&#8217;s outside basis allocable to ECI under Regulations section 
					              1.884-1(d)(3)(i) and 1.882-5. (<b>Note: </b>The line 13 total should generally be entered on Schedule I, line 5, column (b).  
					              However, see the instructions for Schedule I, line 5, column (b) before entering an amount on that line.)   
					              <span class="styDotLn" style="float:right;">.</span>
										</td>
										<xsl:call-template name="CreateTableCells">
											<xsl:with-param name="Start" select="1"/>
											<xsl:with-param name="Stop" select="5"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
										<td class="styTableCell" style="width:26mm;border-right:none;">
											<span style="width:1px"/>
										</td>
									</tr>
									<!--Line 14-->
									<tr>
										<td valign="top" class="styLNLeftNumBox" style="padding-left:1mm;padding-top:3mm;border-bottom:1px solid black;height:17mm;">14</td>
										<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:1mm;border-bottom:1px solid black;">
                  Check either the "income" box or the "asset" box to indicate the allocation method used on line 13  (see instructions)  
			            <span class="styDotLn" style="float:right;">........</span>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:left;padding-left:4mm;vertical-align:middle;border-bottom-width:1px;">
											<input type="checkbox" alt="Income Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Income Allocation Method Indicate Box</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Income Allocation Method Indicate Label</xsl:with-param>
												</xsl:call-template>
														Income
													</label>
											<br/>
											<!-- begin check box for Asset -->
											<input type="checkbox" alt="Asset Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Asset Allocation Method Indicate Box</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Asset Allocation Method Indicate Label</xsl:with-param>
												</xsl:call-template>
												Asset
											</label>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:left;padding-left:4mm;vertical-align:middle;border-bottom-width:1px;">
											<input type="checkbox" alt="Income Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Income Allocation Method Indicate Box</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Income Allocation Method Indicate Label</xsl:with-param>
												</xsl:call-template>
														Income
													</label>
											<br/>
											<!-- begin check box for Asset -->
											<input type="checkbox" alt="Asset Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Asset Allocation Method Indicate Box</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Asset Allocation Method Indicate Label</xsl:with-param>
												</xsl:call-template>
												Asset
											</label>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:left;padding-left:4mm;vertical-align:middle;border-bottom-width:1px;">
											<input type="checkbox" alt="Income Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Income Allocation Method Indicate Box</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Income Allocation Method Indicate Label</xsl:with-param>
												</xsl:call-template>
														Income
													</label>
											<br/>
											<!-- begin check box for Asset -->
											<input type="checkbox" alt="Asset Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Asset Allocation Method Indicate Box</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Asset Allocation Method Indicate Label</xsl:with-param>
												</xsl:call-template>
												Asset
											</label>
										</td>
										<td class="styTableCell" style="width:26mm;text-align:left;padding-left:4mm;vertical-align:middle;border-bottom-width:1px;">
											<input type="checkbox" alt="Income Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Income Allocation Method Indicate Box</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Income Allocation Method Indicate Label</xsl:with-param>
												</xsl:call-template>
														Income
													</label>
											<br/>
											<!-- begin check box for Asset -->
											<input type="checkbox" alt="Asset Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Asset Allocation Method Indicate Box</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/None"/>
													<xsl:with-param name="BackupName">Asset Allocation Method Indicate Label</xsl:with-param>
												</xsl:call-template>
												Asset
											</label>
										</td>
										<td class="sty1120FSchPTableCellAmountShaded" style="width:26mm;border-bottom-width:1px">
											<span style="width:1px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- page break and footer-->
					<div style="width:187mm;padding-top:0.5mm;">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>
							<span class="styBoldText">Schedule P (Form 1120-F) 2022</span>
						</div>
					</div>
					<div class="pageEnd"/>
					<div class="styBB" style="width:187mm">
						<span style="font-weigh:normal;float:left;">Schedule P (Form 1120-F) (2022)</span>
						<span style="width:136mm;"/>Page <b>3</b>
					</div>
					<!--Begin Name/EIN-->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
				Name of corporation (foreign partner)
				<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
							<span style="font-size:6pt; font-weight:bold">Employer identification number (EIN)</span>
							<br/>
							<br/>
							<xsl:choose>
								<xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="normalize-space($FormData/MissingEINReasonCd) != ''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="($RtnHdrData/Filer/EIN)">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--End Name/EIN-->
					<!-- ******************************************************************* -->
					<!-- ************************** PART IV START ************************** -->
					<!-- ******************************************************************* -->
					<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
						<!-- Begin Part IV -->
						<div class="sty1120FSchPSectionTitle" style="border-top-width:0px;border-bottom-width:1px;width:187mm;">
							<div class="styPartName" style="height:4mm;width:14mm;">Part IV</div>
							<div class="styPartDesc" style="width:167mm;">
					Foreign Partner Interests in Partnerships Transferred During Tax Year
				  </div>
							<div style="height:4mm;float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'PTIVctn' "/>
									<xsl:with-param name="imageID" select=" 'PTIVimg' "/>
									<xsl:with-param name="buttonID" select=" 'PTIVbtn' "/>
								</xsl:call-template>
							</div>
						</div>
						<!-- button display logic -->
						<!-- begin Part IV Table -->
						<div id="PTIVctn">
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="($Print = $Separated)">styGenericDiv</xsl:when>
									<xsl:otherwise>styTableContainer</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:attribute name="style">
								<xsl:choose>
									<xsl:when test="($Print = $Separated)">border-bottom:0;height:auto;clear:all;</xsl:when>
									<xsl:otherwise>height:auto;border-bottom:0;</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<!-- begin print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end print logic -->
							<table class="styTable" cellspacing="0" style="font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:14.5mm;background-color:lightgrey;"/>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:42mm;font-weight:normal;text-align:left;">
											<b>(a) </b> Enter the letter of the row in Part I that corresponds to the partnership whose interest was transferred.  See instructions.</th>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:28mm;font-weight:normal;">
											<b>(b)(1) </b> Percentage interest transferred</th>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:44mm;font-weight:normal;">
											<b>(b)(2) </b> Units transferred</th>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:28mm;font-weight:normal;">
											<b>(c) </b> Date acquired (Mo., Day, Yr.)</th>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:28mm;border-right:0;text-align:left;padding-left:2mm;font-weight:normal;">
											<b>(d) </b> Date transferred (Mo., Day, Yr.)
						  </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) &lt;= 3) ">
										<xsl:for-each select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp">
											<tr>
												<td class="styTableCell" style="width:14.5mm;font-weight:bold;text-align:center;">
							  (<xsl:number format="i" value="position()"/>)
							  </td>
												<td class="styTableCell" style="width:42mm;text-align:left;padding-left:2mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AlphaRowId"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:28mm;">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="PartnershipIntTransferredPct"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:44mm;text-align:left;padding-left:2mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartnershipUnitsTransferredNum"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:28mm;text-align:center;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="AcquiredDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="border-right:0;text-align:center;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="PartnershipIntTransferredDt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- begin Part IV empty table format -->
									<xsl:if test="count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp)&lt; 1 or ((count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) &gt; 3) and ($Print = $Separated))">
										<tr style="height:4mm;">
											<td class="styTableCell" style="width:14.5mm;text-align:center;vertical-align:middle;">
												<b>(i)</b>
											</td>
											<td class="styTableCell" style="width:42mm;text-align:left;padding-left:2mm;">
												<xsl:if test="((count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) &gt; 3) and ($Print = $Separated))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/AlphaRowId"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCell" style="width:28mm;"/>
											<td class="styTableCell" style="width:44mm;"/>
											<td class="styTableCell" style="width:28mm;"/>
											<td class="styTableCell" style="border-right:0;"/>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp)&lt; 2  or ((count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) &gt; 3) and ($Print = $Separated))">
										<tr style="height:4mm;">
											<td class="styTableCell" style="width:14.5mm;text-align:center;vertical-align:middle;">
												<b>(ii)</b>
											</td>
											<td class="styTableCell" style="width:42mm;"/>
											<td class="styTableCell" style="width:28mm;"/>
											<td class="styTableCell" style="width:44mm;"/>
											<td class="styTableCell" style="width:28mm;"/>
											<td class="styTableCell" style="border-right:0;"/>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp)&lt; 3 or ((count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) &gt; 3) and ($Print = $Separated))">
										<tr style="height:4mm;">
											<td class="styTableCell" style="width:14.5mm;text-align:center;vertical-align:middle;">
												<b>(iii)</b>
											</td>
											<td class="styTableCell" style="width:42mm;"/>
											<td class="styTableCell" style="width:28mm;"/>
											<td class="styTableCell" style="width:44mm;"/>
											<td class="styTableCell" style="width:28mm;"/>
											<td class="styTableCell" style="border-right:0;"/>
										</tr>
									</xsl:if>
									<!-- end Part IV empty table format -->
								</tbody>
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp"/>
							<xsl:with-param name="containerHeight" select="3"/>
							<xsl:with-param name="containerID" select=" 'PTIVctn' "/>
							<xsl:with-param name="imageID" select=" 'PTIVimg' "/>
							<xsl:with-param name="buttonID" select=" 'PTIVbtn' "/>
						</xsl:call-template>
						<!-- End Part IV table -->
						<!-- End Part IV -->
						<div class="styBB" style="width:187mm;clear:all;font-size:8pt;">
							<b>Note: </b>
							<span style=" padding-left:2mm;">
						If the corporation transferred more than three partnership interests, continue on a separate page. See instructions.
					</span>
						</div>
					</div>
					<!-- ******************************************************************* -->
					<!-- *************************** PART IV END *************************** -->
					<!-- ******************************************************************* -->

					<!-- ******************************************************************* -->
					<!-- *************************** PART V START ************************** -->
					<!-- ******************************************************************* -->
					<div class="styBB" style="width:187mm;float:none;">
						<div class="styPartName" style="height:4mm;">Part V</div>
						<div class="styPartDesc" style="width:162mm;">
            Foreign Partner's Gain or Loss on Transfer of Partnership Interests
          </div>
					</div>
					<!-- END Part V Title -->
					<!-- Begin Part V Table -->
					<!-- Display Data -->
					<div class="styTableContainer" style="width:187mm;border-bottom:none;">
						<table cellpadding="0" cellspacing="0" style="width:187mm;">
							<tbody>
								<xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) &lt; 4)">
									<!--For each table with 4 items do the following-->
									<xsl:for-each select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp">
										<xsl:if test="position() mod 3 = 1">
											<!--Table Header-->
											<tr>
												<td colspan="2" class="styTableCellHeader" style="width:96mm;border:none;border-right:1px solid black;"/>
												<td colspan="3" class="styTableCellHeader" style="width:90mm;border:none;font-weight:bold;font-size:8pt;">
							  Partnership Interest Sold (see instructions)</td>
											</tr>
											<tr>
												<td colspan="2" class="styTableCellHeader" style="border-bottom:0;"/>
												<xsl:call-template name="CreateHeaderPartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
												</xsl:call-template>
											</tr>
											<!--Line 1-->
											<tr>
												<td class="sty1120FSchPTableK1CellNumSD" style="width:6mm;padding-left:1.5mm;padding-top:2.5mm;">1</td>
												<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
								Amount realized on transfer of partnership interest
								<span class="styDotLn" style="float:right;">......</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/RealizedAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 2-->
											<tr>
												<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:1.5mm;padding-top:3mm;">2</td>
												<td class="sty1120FSchPTableK1Desc" scope="row">
						       Section 705 outside basis
								<span class="styDotLn" style="float:right;">..............</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/Section705OutsideBasisAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 3-->
											<tr>
												<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:1.5mm;">3</td>
												<td class="sty1120FSchPTableK1Desc" scope="row">
													<b>Total outside gain (loss) on transfer of partnership interest. </b> Subtract line 2 from line 1.
								<span class="styDotLn" style="float:right;">.............</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotalOutsideGainLossAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 4-->
											<tr>
												<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:1.5mm;padding-bottom:5.0mm">4</td>
												<td class="sty1120FSchPTableK1Desc" scope="row">
													<b>Total outside ordinary gain (loss) that would be recognized on the deemed sale of section 751 property.</b>
						           Enter amount from Schedule K-3 (Form 1065), Part XIII, line 1.
								<span class="styDotLn" style="float:right;">........</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotOrdinaryGainLossSect751Amt"/>
												</xsl:call-template>
											</tr>
											<!--Line 5-->
											<tr>
												<td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:0px; padding-left:1.5mm;">5</td>
												<td class="sty1120FSchPTableK1Desc" style="border-bottom-width:0px" scope="row">
													<b>Total outside capital gain (loss) related to the transfer of the partnership interest. </b>  Subtract line 4 from line 3.
								<span class="styDotLn" style="float:right;">......</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotOutsideCapitalGainLossAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 6-->
											<tr>
												<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:1.5mm;padding-bottom:7mm;">6</td>
												<td class="sty1120FSchPTableK1Desc" style="border-bottom-width:0px" scope="row">
													<b>Aggregate effectively connected ordinary gain (loss) that would be recognized on the deemed sale of section 751 property. </b> 
						        Enter amount from Schedule K-3 (Form 1065), Part XIII, line 2.
								<span class="styDotLn" style="float:right;">....</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotEffCnnctOrdnryGain751Amt"/>
												</xsl:call-template>
											</tr>
											<!--Line 7-->
											<tr>
												<td valign="top" class="sty1120FSchPTableK1CellNumSD" style=";padding-top:1mm;">7</td>
												<td class="sty1120FSchPTableK1Desc" scope="row">
													<b>Aggregate effectively connected capital gain (loss) that would be recognized on the deemed sale of non-section 751 property. </b>
						         Enter amount from Schedule K-3 (Form 1065), Part XIII, line 3.
								<span class="styDotLn" style="float:right;">..</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotalEffCnnctCapGainNon751Amt"/>
												</xsl:call-template>
											</tr>
											<!--Line 8-->
											<tr>
												<td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">8</td>
												<td class="sty1120FSchPTableK1Desc" style="" scope="row">
													<b>Recognized effectively connected ordinary gain (loss). </b> 
						        Enter the smaller of line 4 or line 6.  
						        See instructions.
						        <span class="styDotLn" style="float:right;">........</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/RcgnzEffCnnctOrdnryGainLossAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 9-->
											<tr>
												<td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">9</td>
												<td class="sty1120FSchPTableK1Desc" style="" scope="row">
													<b>Recognized effectively connected capital gain (loss). </b> Enter the smaller of line 5 or line 7.
						        See instructions.
						        <span class="styDotLn" style="float:right;">........</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/RcgnzEffCnnctCapGainLossAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 10-->
											<tr>
												<td valign="top" class="sty1120FSchPTableK1CellNumDD" style="padding-top:1mm;border-bottom:1px solid black;font-weight:bold;">10</td>
												<td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px;" scope="row">
													<b>Gain (loss) that would be recognized under section 897(g) on the deemed sale of U.S. real property interests. </b>
						         Enter amount from Schedule K-3 (Form 1065), Part XIII, line 4.  See instructions.
						        <span class="styDotLn" style="float:right;">.</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/GainLossSect897gAmt"/>
												</xsl:call-template>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<!-- Part V, Line 1 to 10 when table is empty -->
								<xsl:if test="($Print = $Separated and count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) &gt; 4) or count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) = 0">
									<!--Table Header-->
									<tr>
										<td colspan="2" class="styTableCellHeader" style="width:96mm;border:none;border-right:1px solid black;"/>
										<td colspan="3" class="styTableCellHeader" style="width:90mm;border:none;font-weight:bold;font-size:8pt;">
							  Partnership Interest Sold (see instructions)</td>
									</tr>
									<tr>
										<td colspan="2" class="styTableCellHeader" style="border-bottom:0;"/>
										<xsl:call-template name="CreateHeaderPartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
									<!--Line 1-->
									<tr>
										<td class="sty1120FSchPTableK1CellNumSD" style="width:6mm;padding-left:1.5mm;padding-top:2.5mm;">1</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
								Amount realized on transfer of partnership interest
								<span class="styDotLn" style="float:right;">......</span>
										</td>
										<xsl:choose>
											<xsl:when test="count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) = 0">
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="none"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<td class="sty1120FSchPTableK1Cell" style="text-align:center;height:auto;font-size:7pt;width:30mm;vertical-align:bottom;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp"/>
														<xsl:with-param name="ShortMessage" select=" 'true' "/>
													</xsl:call-template>
												</td>
												<td class="sty1120FSchPTableK1Cell" style="height:auto;width:30mm;"/>
												<td class="sty1120FSchPTableK1Cell" style="height:auto;width:30mm;border-right:none;"/>
											</xsl:otherwise>
										</xsl:choose>
									</tr>
									<!--Line 2-->
									<tr>
										<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:1.5mm;padding-top:3mm;">2</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
						       Section 705 outside basis
								<span class="styDotLn" style="float:right;">..............</span>
										</td>
										<xsl:call-template name="CreateTablePartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
									<!--Line 3-->
									<tr>
										<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:1.5mm;">3</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
											<b>Total outside gain (loss) on transfer of partnership interest. </b> Subtract line 2 from line 1.
								<span class="styDotLn" style="float:right;">.............</span>
										</td>
										<xsl:call-template name="CreateTablePartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
									<!--Line 4-->
									<tr>
										<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:1.5mm;padding-bottom:5.0mm">4</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
											<b>Total outside ordinary gain (loss) that would be recognized on the deemed sale of section 751 property.</b>
						           Enter amount from Schedule K-3 (Form 1065), Part XIII, line 1.
								<span class="styDotLn" style="float:right;">........</span>
										</td>
										<xsl:call-template name="CreateTablePartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
									<!--Line 5-->
									<tr>
										<td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:0px; padding-left:1.5mm;">5</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
											<b>Total outside capital gain (loss) related to the transfer of the partnership interest. </b>  Subtract line 4 from line 3.
								<span class="styDotLn" style="float:right;">......</span>
										</td>
										<xsl:call-template name="CreateTablePartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
									<!--Line 6-->
									<tr>
										<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:1.5mm;padding-bottom:7mm;">6</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
											<b>Aggregate effectively connected ordinary gain (loss) that would be recognized on the deemed sale of section 751 property. </b> 
						        Enter amount from Schedule K-3 (Form 1065), Part XIII, line 2.
								<span class="styDotLn" style="float:right;">....</span>
										</td>
										<xsl:call-template name="CreateTablePartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
									<!--Line 7-->
									<tr>
										<td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">7</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
											<b>Aggregate effectively connected capital gain (loss) that would be recognized on the deemed sale of non-section 751 property. </b>
						         Enter amount from Schedule K-3 (Form 1065), Part XIII, line 3.
								<span class="styDotLn" style="float:right;">..</span>
										</td>
										<xsl:call-template name="CreateTablePartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
									<!--Line 8-->
									<tr>
										<td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">8</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
											<b>Recognized effectively connected ordinary gain (loss). </b> 
						        Enter the smaller of line 4 or line 6.  
						        See instructions.
						        <span class="styDotLn" style="float:right;">........</span>
										</td>
										<xsl:call-template name="CreateTablePartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
									<!--Line 9-->
									<tr>
										<td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">9</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
											<b>Recognized effectively connected capital gain (loss). </b> Enter the smaller of line 5 or line 7.
						        See instructions.
						        <span class="styDotLn" style="float:right;">........</span>
										</td>
										<xsl:call-template name="CreateTablePartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
									<!--Line 10-->
									<tr>
										<td valign="top" class="sty1120FSchPTableK1CellNumDD" style="padding-top:1mm;border-bottom:1px solid black;font-weight:bold;">10</td>
										<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;border-bottom-width:1px;">
											<b>Gain (loss) that would be recognized under section 897(g) on the deemed sale of U.S. real property interests. </b>
						         Enter amount from Schedule K-3 (Form 1065), Part XIII, line 4.  See instructions.
						        <span class="styDotLn" style="float:right;">.</span>
										</td>
										<xsl:call-template name="CreateTablePartV">
											<xsl:with-param name="Start" select="position()"/>
											<xsl:with-param name="Stop" select="position()+3"/>
											<xsl:with-param name="TargetNode" select="none"/>
										</xsl:call-template>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- ******************************************************************* -->
					<!-- **************************** PART V END *************************** -->
					<!-- ******************************************************************* -->
					<!-- page break and footer-->
					<div style="width:187mm;padding-top:0.5mm;">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>
							<span class="styBoldText">Schedule P (Form 1120-F) 2022</span>
						</div>
					</div>
					<div class="pageEnd"/>
					<!-- end page break and footer  -->
					<!-- BEGIN Left Over Table -->
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
					<!-- END Left Over Table -->

					<!-- ********************************************************************** -->
					<!-- ************************** PART I SRT START ************************** -->
					<!-- ********************************************************************** -->
					<xsl:if test="($Print = $Separated) and (count($FormData/ForeignPartnerInformationGrp) &gt; 4) ">
						<br/>
						<span class="styRepeatingDataTitle">
              Form 1120F Schedule P, Part I &#8212; List of Foreign Partner Interests in Partnerships                            
            </span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="width:5mm;border-right:0;"/>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;">
										<b>(a) </b>Name of partnership </th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;">
										<b>(b) </b>Address </th>
									<th class="styTableCellHeader" scope="col" style="width:31mm; border-right-width:1px;font-weight:normal;">
										<b>(c) </b>EIN </th>
									<th class="styTableCellHeader" scope="col" style="width:44mm;text-align:left;padding-left:3mm;font-weight:normal;">
										<b>(d) </b>For each partnership interest, is the foreign corporation?'s distributive share ECI, or treated as ECI,
					            in whole or in part, with a U.S. trade or business determined under section 875 (see instructions)? 
					          </th>
								</tr>
								<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellText" style="vertical-align:top;height:12mm;border-right-width:0px;width:5mm;font-weight:bold">
											<xsl:number format="A" value="position()"/>
										</td>
										<!--Name-->
										<td class="styTableCellText" style="height:12mm;text-align:left;vertical-align:top;width:45mm;">
											<xsl:choose>
												<xsl:when test="PartnerPersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartnerPersonNm"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="PartnerBusinessName/BusinessNameLine1Txt">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="PartnerBusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:1px"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!--Address-->
										<td class="styTableCellText" style="width:62mm;height:12mm;text-align:left;vertical-align:top;">
											<xsl:choose>
												<xsl:when test="PartnerUSAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="PartnerUSAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="PartnerForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="PartnerForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:1px"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- EIN -->
										<td class="styTableCellText" style="width:31mm;height:12mm;text-align:center;vertical-align:middle;">
											<xsl:choose>
												<xsl:when test="PartnerEIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PartnerEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="MissingEINReasonCd">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:1px"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- ECI -->
										<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
										<td class="styTableCell" style="width:44mm;text-align:center;height:12mm;vertical-align:bottom;">
											<!-- per IBM to add PopulateSpan to boolean (yes/no) checkbox -->
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" alt="Distributive Share Treated As ECI Yes Box" name="Part I, column d">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
													<xsl:with-param name="BackupName">Distributive Share Treated As ECI Yes Box<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
											</xsl:call-template>
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
													<xsl:with-param name="BackupName">Distributive Share Treated As ECI Yes Label<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm;"/>
												<b>Yes</b>
											</label>
											<span style="width:4mm"/>
											<!-- per IBM to add PopulateSpan to boolean (yes/no) checkbox -->
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" alt="Distributive Share Treated As ECI No Box" name="Part I, column d">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
													<xsl:with-param name="BackupName">Distributive Share Treated As ECI No Box<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
											</input>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
											</xsl:call-template>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
													<xsl:with-param name="BackupName">Distributive Share Treated As ECI No Label<xsl:number value="position()"/>
													</xsl:with-param>
												</xsl:call-template>
												<span style="width:1mm"/>
												<b>No</b>
											</label>
											<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- ******************************************************************** -->
					<!-- ************************** PART I SRT END ************************** -->
					<!-- ******************************************************************** -->

					<!-- *********************************************************************** -->
					<!-- ************************** PART II SRT START ************************** -->
					<!-- *********************************************************************** -->
					<xsl:if test="($Print = $Separated) and (count($FormData/ForeignPartnerInformationGrp) &gt; 4) ">
						<xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
							<xsl:if test="position() mod 4 = 1">
								<br/>
								<div class="styRepeatingDataTitle" style="font-size:7.5pt;">
                Form 1120F Schedule P, Part II &#8212; Summary of Foreign Partner Income and Expenses From Schedule K-3 (Form 1065)
              </div>
								<table class="styDepTbl" cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
									<tbody>
										<!--Table Header-->
										<tr class="styDepTblHdr">
											<td colspan="2" class="styDepTableCellHeader" style="width:57mm;border:none;"/>
											<td colspan="5" class="styTableCellHeader" style="width:130mm;border:none;font-weight:bold;font-size:8pt;">Schedules K-3</td>
										</tr>
										<tr class="styDepTblHdr">
											<td colspan="2" class="styTableCellHeader" style="font-weight:bold;border-bottom:0;"/>
											<xsl:call-template name="CreateTableHeaderCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
											</xsl:call-template>
											<td class="styTableCellHeader" style="width:26mm;border-top-width:1px;border-right:0;">
												<b>Total</b>
											</td>
										</tr>
										<!--Line 1-->
										<tr class="styDepTblRow1">
											<td class="styLNLeftNumBox" style="padding-left:2.5mm;">1</td>
											<td class="styTableCellText" scope="row" style="padding-top:0.5mm;padding-left:0;width:49mm;border-bottom:none;">
												<b>Total gross income.</b>  Enter the amount from Schedule K-3, Part X, Section 1, line 21,  column (a).
					          <span class="styDotLn" style="float:right;">..</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalGrossIncomeAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalGrossIncomeAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 2-->
										<tr class="styDepTblRow2">
											<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">2</td>
											<td class="styTableCellText" scope="row" style="padding-top:2mm;padding-left:0;width:49mm;border-bottom:none;">
												<b>Gross ECI - Partnership determination.</b> Enter the sum of  Schedule K-3, Part X, Section 1, line 21, column (c) plus column (d). 
					          <span class="styDotLn" style="float:right;">..</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/GrossECIPrtshpDeterminationAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/GrossECIPrtshpDeterminationAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 3-->
										<tr class="styDepTblRow1">
											<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">3</td>
											<td class="styTableCellText" scope="row" style="padding-left:0;padding-top:2mm;width:49mm;border-bottom:none;">
												<b>Gross ECI - Partner determination.</b>  Enter all applicable amounts from Schedule K-3, Part X,
					           Section 1, column (b) (see instructions).
					          <span class="styDotLn" style="float:right;">..</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/GrossECIPrtnrDeterminationAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/GrossECIPrtnrDeterminationAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 4-->
										<tr class="styDepTblRow2">
											<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">4</td>
											<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
												<b>Total deductions and losses.</b>  Enter the amount from Schedule K-3, Part X, Section 2, line 24, column (a). 
					          <span class="styDotLn" style="float:right;">.</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalDeductionsAndLossesAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalDeductionsAndLossesAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 5-->
										<tr class="styDepTblRow1">
											<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">5</td>
											<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
												<b>Total deductions and losses deductible against gross ECI - Partnership determination</b>.  Enter the sum of Schedule K-3, Part X, Section 2, line 24, column (c) plus column (d).  
					          <span class="styDotLn" style="float:right;">........</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalDedLossECIPartnershipAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalDedLossECIPartnershipAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 6-->
										<tr class="styDepTblRow2">
											<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">6</td>
											<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
												<b>Total deductions and losses deductible against gross ECI - Partner determination</b>.  Enter all applicable amounts from Schedule K-3, Part X, Section 2, column (b) (see instructions).
					          <span class="styDotLn" style="float:right;">......</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalDedLossECIPartnerAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select=" $FormData/TotalGrp/TotalDedLossECIPartnerAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 7-->
										<tr class="styDepTblRow1">
											<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:2mm;">7</td>
											<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
					          Interest expense directly allocable under Regulations section 1.882-5(a)(1)(ii)(B). 
					          (<b>Note:</b> Include the line 7 total on  Schedule I, line 22.)  
					          <span class="styDotLn" style="float:right;">...</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseAllocableAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseAllocableAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 8-->
										<tr class="styDepTblRow2">
											<td class="styLNLeftNumBox" style="padding-left:2.5mm;padding-top:3mm;height:25mm;">8</td>
											<td class="styTableCellText" scope="row" style="padding-left:0;width:49mm;border-bottom:1px solid black;padding-top:2mm;">
					          Interest expense on U.S.-booked liabilities as described under Regulations section 1.882-5(d)(2)(vii).  Enter the amount from Schedule K-3, Part X, Section 2, line 7, column (b).  Include the line 8 total on Schedule I, line 9, column (b). 
					          <span class="styDotLn" style="float:right;">......</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseUSBookedLiabAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseUSBookedLiabAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- ********************************************************************* -->
					<!-- ************************** PART II SRT END ************************** -->
					<!-- ********************************************************************* -->

					<!-- ************************************************************************ -->
					<!-- ************************** PART III SRT START ************************** -->
					<!-- ************************************************************************ -->
					<xsl:if test="($Print = $Separated) and (count($FormData/ForeignPartnerInformationGrp) &gt; 4) ">
						<xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
							<xsl:if test="position() mod 4 = 1">
								<br/>
								<span class="styRepeatingDataTitle" style="font-size:7pt;">
	        	    Form 1120F Schedule P, Part III &#8212; Foreign Partner's Average Outside Basis Under Regulations sections 1.882-5(b) and 1.884-1(d)(3)
	            </span>
								<table class="styDepTbl" cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
									<tbody>
										<tr class="styDepTblHdr">
											<td colspan="2" class="styTableCellHeader" style="border:none;width:57mm;"/>
											<td colspan="5" class="styTableCellHeader" style="width:130mm;border:none;font-weight:bold;font-size:8pt;">Schedules K-3</td>
										</tr>
										<tr class="styDepTblHdr">
											<td colspan="2" class="styTableCellHeader" style="font-weight:bold;border-bottom:0;"/>
											<xsl:call-template name="CreateTableHeaderCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
											</xsl:call-template>
											<td class="styTableCellHeader" style="width:26mm;border-top-width:1px;border-right:0;">
												<b>Total</b>
											</td>
										</tr>
										<!--Line 9-->
										<tr class="styDepTblRow1">
											<td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;padding-top:3mm;">9</td>
											<td class="styTableCellText" scope="row" style="height:7mm;padding-left:0;width:49mm;border-bottom:none;padding-top:2mm;">
					        Section 705 outside basis 					           
					        <span class="styDotLn" style="float:right;">....</span>
											</td>
											<xsl:call-template name="CreateTableCellsLine9">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/Section705OutsideBasisAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="width:26mm;border-right:none;vertical-align:bottom;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/Section705OutsideBasisAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 10a-->
										<tr class="styDepTblRow2">
											<td valign="top" class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1mm;">10a</td>
											<td class="styTableCellText" scope="row" style="padding-top:1mm;width:49mm;border-bottom:none;">
					        Partner&#8217;s liabilities included in outside basis under section 752 that give rise
					        to directly allocable interest expense under Regulations section  1.882-5(a)(1)(ii)(B) 
	                <span class="styDotLn" style="float:right;">.........</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerLiabSect18825a1iiBAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerLiabSect18825a1iiBAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 10b-->
										<tr class="styDepTblRow1">
											<td valign="top" class="styLNLeftNumBox" style="padding-top:1mm;padding-left:4mm;">b</td>
											<td class="styTableCellText" scope="row" style="padding-top:1mm;width:49mm;border-bottom:none;">
						      All other liabilities included in partner&#8217;s outside basis under section 752
						      <span class="styDotLn" style="float:right;">..</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherLiabilitiesIncludedAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherLiabilitiesIncludedAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 10c-->
										<tr class="styDepTblRow2">
											<td valign="top" class="styLNLeftNumBox" style="padding-top:1mm;padding-left:4mm;">c</td>
											<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:1mm;">
					            Add lines 10a and 10b 
					            <span class="styDotLn" style="float:right;">.....</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalLiabilitiesSection752Amt"/>
											</xsl:call-template>
											<td class="styTableCell" style="width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalLiabilitiesSection752Amt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 10d-->
										<tr class="styDepTblRow1">
											<td valign="top" class="styLNLeftNumBox" style="padding-top:1mm;padding-left:4mm;">d</td>
											<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:1mm;">
					            Subtract line 10c from line 9 
					            <span class="styDotLn" style="float:right;">...</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OutsideBasisLessSect752LiabAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OutsideBasisLessSect752LiabAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 11-->
										<tr class="styDepTblRow2">
											<td valign="top" class="styLNLeftNumBox" style="padding-top:1mm;">11</td>
											<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:1mm;">
					            Partner&#8217;s liabilities under Regulations  section 1.884-1(d)(3)(vi). 
					            (<b>Note: </b> Enter the  line 11 total on Schedule I, line 8, column (b) that
					            represents U.S. booked liabilities under Regulations section 1.882-5(d).) 
					            <span class="styDotLn" style="float:right;">.....</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerLiabSect18841d3viAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerLiabSect18841d3viAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 12-->
										<tr class="styDepTblRow1">
											<td valign="top" class="styLNLeftNumBox" style="padding-top:1mm;">12</td>
											<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:1mm;">
												<b>Partner&#8217;s outside basis under Regulations section 1.884-1(d)(3)(vi).</b>
					              Add lines 10d  and 11  
					              <span class="styDotLn" style="float:right;">...</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerBasisSect18841d3viAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerBasisSect18841d3viAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 13-->
										<tr class="styDepTblRow2">
											<td valign="top" class="styLNLeftNumBox" style="padding-top:1mm">13</td>
											<td class="styTableCellText" scope="row" style="width:49mm;border-bottom:none;padding-top:1mm;">
					              Partner&#8217;s outside basis allocable to ECI under Regulations section 
					              1.884-1(d)(3)(i) and 1.882-5. (<b>Note: </b>The line 13 total should generally be entered on Schedule I, line 5, column (b).  
					              However, see the instructions for Schedule I, line 5, column (b) before entering an amount on that line.)   
					              <span class="styDotLn" style="float:right;">.</span>
											</td>
											<xsl:call-template name="CreateTableCells">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerOutsideBssAllcblECIAmt"/>
											</xsl:call-template>
											<td class="styTableCell" style="vertical-align:bottom;width:26mm;border-right:none;">
												<xsl:choose>
													<xsl:when test="position() = 1 ">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerOutsideBssAllcblECIAmt"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--Line 14-->
										<tr class="styDepTblRow1">
											<td valign="top" class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1mm;">14</td>
											<td class="styTableCellText" scope="row" style="width:49mm;padding-top:1mm;">
                  Check either the "income" box or the "asset" box to indicate the allocation method used on line 13  (see instructions)  
			            <span class="styDotLn" style="float:right;">........</span>
											</td>
											<xsl:call-template name="CreateTable14">
												<xsl:with-param name="Start" select="position()"/>
												<xsl:with-param name="Stop" select="position()+4"/>
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/AllocationMethodUsedCd"/>
											</xsl:call-template>
											<td class="sty1120FSchPTableCellAmountShaded" style="width:26mm;border-bottom-width:1px">
												<span style="width:1px"/>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<br/>
					<!-- *********************************************************************** -->
					<!-- *************************** PART III SRT END ************************** -->
					<!-- *********************************************************************** -->

					<!-- *********************************************************************** -->
					<!-- ************************** PART IV SRT START ************************** -->
					<!-- *********************************************************************** -->
					<xsl:if test="($Print = $Separated) and (count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) &gt; 3) ">
						<div class="styRepeatingDataTitle" style="width:187mm;clear:all;height:auto;">
					Form 1120F Schedule P, Part IV &#8212;  Foreign Partner Interests in Partnerships Transferred During Tax Year
				</div>
						<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;padding-bottom:4mm;">
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<thead class="styDepTblHdr">
									<tr>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:14.5mm;background-color:lightgrey;"/>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:42mm;font-weight:normal;text-align:left;">
											<b>(a) </b> Enter the letter of the row in Part I that corresponds to the partnership whose interest was transferred.  See instructions.</th>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:28mm;font-weight:normal;">
											<b>(b)(1) </b> Percentage interest transferred</th>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:44mm;font-weight:normal;">
											<b>(b)(2) </b> Units transferred</th>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:28mm;font-weight:normal;">
											<b>(c) </b> Date acquired (Mo., Day, Yr.)</th>
										<th class="styTableCellHeader" scope="col" style="height:19mm;width:28mm;border-right:0;text-align:left;padding-left:2mm;font-weight:normal;">
											<b>(d) </b> Date transferred (Mo., Day, Yr.)
						  </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCell" style="width:14.5mm;font-weight:bold;text-align:center;">
							  (<xsl:number format="i" value="position()"/>)
							  </td>
											<td class="styTableCell" style="width:42mm;text-align:left;padding-left:2mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:28mm;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="PartnershipIntTransferredPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:44mm;text-align:left;padding-left:2mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartnershipUnitsTransferredNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:28mm;text-align:center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AcquiredDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="border-right:0;text-align:center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="PartnershipIntTransferredDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</xsl:if>
					<!-- *********************************************************************** -->
					<!-- *************************** PART IV SRT END *************************** -->
					<!-- *********************************************************************** -->

					<!-- *********************************************************************** -->
					<!-- *************************** PART V START SRT ************************** -->
					<!-- *********************************************************************** -->
					<xsl:if test="($Print = $Separated) and (count($FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp) &gt; 3) ">
						<xsl:for-each select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp">
							<xsl:if test="position() mod 3 = 1">
								<div class="styRepeatingDataTitle" style="width:187mm;clear:all;height:auto;">
					Form 1120F Schedule P, Part V &#8212;  Foreign Partner's Gain or Loss on Transfer of Partnership Interests
				</div>
								<div class="styTableContainer" style="width:187mm;border-bottom:none;padding-bottom:4mm;">
									<table class="styDepTbl" cellpadding="0" cellspacing="0" style="width:187mm;">
										<tbody>
											<!--Table Header-->
											<tr>
												<td colspan="2" class="styDepTblHdr" style="width:96mm;border:1px solid black;border-bottom:none;"/>
												<td colspan="3" class="styDepTblHdr" style="color:black;width:90mm;border:1px solid black;font-weight:bold;font-size:8pt;">
							  Partnership Interest Sold (see instructions)</td>
											</tr>
											<tr>
												<td colspan="2" class="styDepTblHdr" style="border:1px solid black;border-top:none;"/>
												<xsl:call-template name="CreateDepHeaderPartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
												</xsl:call-template>
											</tr>
											<!--Line 1-->
											<tr class="styDepTblRow1">
												<td class="sty1120FSchPTableK1CellNumSD" style="width:6mm;padding-left:2.5mm;padding-top:2.5mm;">1</td>
												<td class="sty1120FSchPTableK1Desc" scope="row" style="width:90mm;">
								Amount realized on transfer of partnership interest
								<span class="styDotLn" style="float:right;">......</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/RealizedAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 2-->
											<tr class="styDepTblRow2">
												<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:3mm;">2</td>
												<td class="sty1120FSchPTableK1Desc" scope="row">
						       Section 705 outside basis
								<span class="styDotLn" style="float:right;">..............</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/Section705OutsideBasisAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 3-->
											<tr class="styDepTblRow1">
												<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;">3</td>
												<td class="sty1120FSchPTableK1Desc" scope="row">
													<b>Total outside gain (loss) on transfer of partnership interest. </b> Subtract line 2 from line 1.
								<span class="styDotLn" style="float:right;">.............</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotalOutsideGainLossAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 4-->
											<tr class="styDepTblRow2">
												<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-bottom:5.0mm">4</td>
												<td class="sty1120FSchPTableK1Desc" scope="row">
													<b>Total outside ordinary gain (loss) that would be recognized on the deemed sale of section 751 property.</b>
						           Enter amount from Schedule K-3 (Form 1065), Part XIII, line 1.
								<span class="styDotLn" style="float:right;">........</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotOrdinaryGainLossSect751Amt"/>
												</xsl:call-template>
											</tr>
											<!--Line 5-->
											<tr class="styDepTblRow1">
												<td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:0px;padding-left:2.5mm;">5</td>
												<td class="sty1120FSchPTableK1Desc" style="border-bottom-width:0px" scope="row">
													<b>Total outside capital gain (loss) related to the transfer of the partnership interest. </b>  Subtract line 4 from line 3.
								<span class="styDotLn" style="float:right;">......</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotOutsideCapitalGainLossAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 6-->
											<tr class="styDepTblRow2">
												<td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-bottom:8mm;">6</td>
												<td class="sty1120FSchPTableK1Desc" style="border-bottom-width:0px" scope="row">
													<b>Aggregate effectively connected ordinary gain (loss) that would be recognized on the deemed sale of section 751 property. </b> 
						        Enter amount from Schedule K-3 (Form 1065), Part XIII, line 2.
								<span class="styDotLn" style="float:right;">....................</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotEffCnnctOrdnryGain751Amt"/>
												</xsl:call-template>
											</tr>
											<!--Line 7-->
											<tr class="styDepTblRow1">
												<td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:1mm;">7</td>
												<td class="sty1120FSchPTableK1Desc" scope="row">
													<b>Aggregate effectively connected capital gain (loss) that would be recognized on the deemed sale of non-section 751 property. </b>
						         Enter amount from Schedule K-3 (Form 1065), Part XIII, line 3.
								<span class="styDotLn" style="float:right;">..</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/TotalEffCnnctCapGainNon751Amt"/>
												</xsl:call-template>
											</tr>
											<!--Line 8-->
											<tr class="styDepTblRow2">
												<td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:1mm;">8</td>
												<td class="sty1120FSchPTableK1Desc" style="" scope="row">
													<b>Recognized effectively connected ordinary gain (loss). </b> 
						        Enter the smaller of line 4 or line 6.  
						        See instructions.
						        <span class="styDotLn" style="float:right;">........</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/RcgnzEffCnnctOrdnryGainLossAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 9-->
											<tr class="styDepTblRow1">
												<td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:1mm;">9</td>
												<td class="sty1120FSchPTableK1Desc" style="" scope="row">
													<b>Recognized effectively connected capital gain (loss). </b> Enter the smaller of line 5 or line 7.
						        See instructions.
						        <span class="styDotLn" style="float:right;">........</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/RcgnzEffCnnctCapGainLossAmt"/>
												</xsl:call-template>
											</tr>
											<!--Line 10-->
											<tr class="styDepTblRow2">
												<td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;border-bottom-width:2px;">10</td>
												<td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px;" scope="row">
													<b>Gain (loss) that would be recognized under section 897(g) on the deemed sale of U.S. real property interests. </b>
						         Enter amount from Schedule K-3 (Form 1065), Part XIII, line 4.  See instructions.
						        <span class="styDotLn" style="float:right;">.</span>
												</td>
												<xsl:call-template name="CreateTablePartV">
													<xsl:with-param name="Start" select="position()"/>
													<xsl:with-param name="Stop" select="position()+3"/>
													<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtnrIntPrtshpTrnsfrTYGrp/GainLossSect897gAmt"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- *********************************************************************** -->
					<!-- **************************** PART V END SRT *************************** -->
					<!-- *********************************************************************** -->

				</form>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="CreateTableHeaderCells">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styTableCellHeader" style="width:26mm;font-weight:bold;border-top-width:1px;">
				<xsl:number format="A" value="$Start"/>
			</td>
			<xsl:call-template name="CreateTableHeaderCells">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="CreateTableCells">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styTableCell" style="width:26mm;vertical-align:bottom;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTableCells">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="CreateTableCellsLine9">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styTableCell" style="width:26mm;height:7mm;vertical-align:bottom;">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
				<br/>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTableCellsLine9">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="CreateTable14">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styTableCell" style="width:26mm;text-align:left;padding-left:4mm;vertical-align:middle;border-bottom-width:1px;">
				<input type="checkbox" alt="Income Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp[position()=$Start]/IncomeAllocationMethodInd"/>
						<xsl:with-param name="BackupName">Income Allocation Method Indicate Box</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp[position()=$Start]/IncomeAllocationMethodInd"/>
						<xsl:with-param name="BackupName">Income Allocation Method Indicate Label</xsl:with-param>
					</xsl:call-template>
							Income
						</label>
				<br/>
				<!-- begin check box for Asset -->
				<input type="checkbox" alt="Asset Allocation Method Indicate Box" class="styCkbox" style="width:9px; height:9px;">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp[position()=$Start]/AssetAllocationMethodInd"/>
						<xsl:with-param name="BackupName">Asset Allocation Method Indicate Box</xsl:with-param>
					</xsl:call-template>
				</input>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp[position()=$Start]/AssetAllocationMethodInd"/>
						<xsl:with-param name="BackupName">Asset Allocation Method Indicate Label</xsl:with-param>
					</xsl:call-template>
							Asset
						</label>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTable14">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="CreateHeaderPartV">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styTableCellHeader" style="width: 30mm;font-weight:bold;border-top-width:1px;height:8mm;">
				<xsl:if test="$Start mod 3 = 0">
					<xsl:attribute name="style">
						border-right:0;width: 30mm;font-weight:bold;border-top-width:1px;height:8mm;
					</xsl:attribute>
				</xsl:if>
				<xsl:number format="i" value="$Start"/>
			</td>
			<xsl:call-template name="CreateHeaderPartV">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="CreateTablePartV">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="sty1120FSchPTableK1Cell" style="height:auto;font-size:7pt;width:30mm;vertical-align:bottom;">
				<xsl:if test="$Start mod 3 = 0">
					<xsl:attribute name="style">
						border-right:0;height:auto;font-size:7pt;width:30mm;vertical-align:bottom;
					</xsl:attribute>
				</xsl:if>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTablePartV">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="CreateDepHeaderPartV">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styDepTblHdr" style="color:black;width:30mm;font-weight:bold;border:1px solid black;height:8mm;">
				<xsl:number format="i" value="$Start"/>
			</td>
			<xsl:call-template name="CreateDepHeaderPartV">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>