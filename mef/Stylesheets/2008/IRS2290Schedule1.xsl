<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS2290Schedule1Style.xsl"/>


<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="Form2290Schedule1" select="$RtnDoc/IRS2290Schedule1" />

<xsl:template match="/">

<html>
  <head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form2290Schedule1)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 2290Schedule1" />
  
 
  
  <xsl:call-template name="InitJS"></xsl:call-template>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  
  <style type="text/css">
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS2290Schedule1Style"></xsl:call-template>  
      <xsl:call-template name="AddOnStyle"></xsl:call-template>
    </xsl:if>
  </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form2290Schedule1">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>


<!-- ****************************************************************************************************-->
<!-- CHANGES MADE TO SCHEDULE 1 PER RIS ETA081635OTH AND PDF DATED 2/14/08 
           CHANGES MADE ON 5/15/08    SKM -->
           

<!-- Begin Document Header -->
 <div class="styBB" style="width:187mm;">
    <div class="styFNBox" style="width:31mm;height:18mm;">
      <span class="styFormNumber" style="font-size:8pt">SCHEDULE 1<br/>(Form 2290)</span>      
      <br />      
     
      <span class="styAgency">(Rev. July 2008)<br/> Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="width:125mm;height:18mm;padding-top:1mm">
      <div class="styMainTitle" style="height:5mm">Schedule of Heavy Highway Vehicles</div>
      <div class="styFST" style="height:4mm;font-size:8pt;text-align:center;font-weight:normal">
         For the period July 1, 2008, through June 30, 2009<br/>
         </div>
         <div class="styFST" style="height:4mm;font-size:7pt;text-align:center">
         <img src="{$ImagePath}/2290Sch1_Bullet_Md.gif" alt="MediumBullet" />
         Complete both copies of Schedule 1 and attach them to Form 2290.
      </div>
      <div class="styFST" style="height:4mm;font-size:7pt;text-align:center">
         <img src="{$ImagePath}/2290Sch1_Bullet_Md.gif" alt="MediumBullet" />
         See the Consent to Disclosure of Tax Information on page 2.
      </div>
    </div>
    <div class="styTYBox" style="width:31mm;height:18mm;border-bottom-width:0px">
      <div class="styOMB" style="height:18mm;padding-top:8mm;padding-left:0.5mm;border-bottom-width:0px">OMB No. 1545-0143</div>
    </div>
  </div>
<table  border="0" cellspacing="0" cellpadding="0" style="font-size:6pt;width:187mm">
  <tbody>
    <tr>
      <td rowspan="3" style="border:0 solid black;border-right-width:1;width:10mm;font-size:7pt;text-align:center"><span class="styBoldText">Type<br/> or<br/> Print</span></td>
      <td style="width:93mm;border:0 solid black;border-right-width:1;border-bottom-width:1;padding-left:2mm">Name as shown on Form 2290<br/>
        <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template>
      </td>
      <td style="width:51mm;border:0 solid black;border-right-width:1;border-bottom-width:1;vertical-align:top;padding-bottom:0.25mm;padding-left:1mm">
        <b>Employer identification number</b><br/>
        <div style="padding-top:1.25mm">
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="1" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="2" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="float:left;clear:none"> - </span>
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="3" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="4" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="5" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="6" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="7" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="8" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="9" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
        </div>
      </td>
      <td style="width:31.2mm;border:2 solid black;border-right-width:0;border-bottom-width:1px;text-align:center"><b>FOR IRS<br />USE ONLY</b></td>
      
    </tr>
    <tr>
        <td colspan="2" style="border:0 solid black;border-right-width:1;border-bottom-width:1;padding-left:2mm">Address (number, street, and room or suite no.)
        <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine1</xsl:with-param></xsl:call-template>
        <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine2</xsl:with-param></xsl:call-template>
        </td>
        <td rowspan="2" style="border:2 solid black;border-right-width:0;border-top-width:0px">T<br/>FF<br/>FP<br/>I<br/>T<br/></td>
    </tr>
    <tr>
    <td colspan="2" style="border:0 solid black;border-right-width:1;padding-left:2mm">City, state, and ZIP code (Canadian or Mexican address, see page 5 of the instructions.)
    <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param></xsl:call-template>
    <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">Country</xsl:with-param><xsl:with-param name="MainForm">true</xsl:with-param></xsl:call-template></td>
      </tr>
  </tbody>
</table>

<div class="styBB"  style="width:187mm;border-top:1 solid black;border-right-width:0px">

<xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &gt; 5">
  <div style="width:3mm;float:right">
    <!-- button display logic -->
    <xsl:call-template name="SetDynamicTableToggleButton" >
      <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleReportTaxItem"/>
      <xsl:with-param name="containerHeight" select="5"/>
      <xsl:with-param name="containerID" select=" 'VRTctn' "/>
    </xsl:call-template>
    <!-- end button display logic -->
  </div>
</xsl:if>
<span class="styBoldText">Caution. </span> <span class="styItalicText">You must list <span class="styBoldText">all</span> vehicles. Attach a separate list if needed. See page 7 of the instructions.</span>

</div>

<!--BEGIN PART I BEGIN PART I BEGIN PART I BEGIN PART I BEGIN PART I BEGIN PART I-->

<div class="styTableContainer" id="VRTctn">
  <xsl:call-template name="SetInitialState"/>

  <!--Begin Part 1 Header-->

  <table cellspacing="0" cellpadding="0" style="font-size:7pt">
      <tr>
        <th class="styBB" colspan="2">
          <div class="styPartName">Part I</div>
          <div class="styPartDesc" style="width:149mm;text-align:left">
            Vehicles on Which You Are Reporting Tax. <span style="font-weight:normal">Enter VIN and category.</span>
          </div>
        </th>
        <th style="font-weight:normal;font-size:7pt;width:20mm;height:3mm;text-align:center;border: solid black 1;border-top-width:0px">
          Category
        </th>
      </tr>
      <!--Begin Part 1 Table-->
    <tbody>
      <xsl:if test="($Print != $Separated) or (count($Form2290Schedule1/VehicleReportTaxItem) &lt;=5)">
        <xsl:for-each select="$Form2290Schedule1/VehicleReportTaxItem">
          <tr style="height:5.5mm">
            <td class="sty2290Sch1TableCellCtr" style="width:6mm">
              <xsl:number></xsl:number>
            </td>
            <xsl:choose>
              <xsl:when test="position() > 5">
                <td class="sty2290Sch1TableCellBB" style="text-align:left;width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
                  <span style="text-align:left">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="VIN" />
                    </xsl:call-template>
                  </span>
                </td>
              </xsl:when>
              <xsl:otherwise>
                <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN" />
                    <xsl:with-param name="BoxNum" select="1" />
                    <xsl:with-param name="BoxWidth" select="'5mm'" />
                    <xsl:with-param name="BoxHeight" select="'4.25mm'" />
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'" />
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN" />
                    <xsl:with-param name="BoxNum" select="2" />
                    <xsl:with-param name="BoxWidth" select="'5mm'" />
                    <xsl:with-param name="BoxHeight" select="'4.25mm'" />
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'" />
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                </td>
              </xsl:otherwise>
            </xsl:choose>
            <td class="sty2290Sch1TableCellLast" style="width:20mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="VehicleCategoryCode"></xsl:with-param>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </xsl:if>
      <!--filler rows-->
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 1 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm">
            <b>1</b>
          </td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <xsl:choose>
              <xsl:when test="((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
                <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleReportTaxItem"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm">
            <span style="width:1px" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 2 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>2</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 3 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>3</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 4 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>4</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 5 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>5</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
    </tbody>
    <tfoot></tfoot>
  </table>
</div>

<!-- Set Initial Height of Above Table -->
<xsl:call-template name="SetInitialDynamicTableHeight">
	<xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleReportTaxItem"/>
	<xsl:with-param name="containerHeight" select="5"/>
	<xsl:with-param name="containerID" select=" 'VRTctn' "/>
</xsl:call-template>
<!-- End Set Initial Height of Above Table -->

<!--End Part 1 Table-->
<xsl:variable name="x" select="count($Form2290Schedule1/VehicleReportTaxItem)"></xsl:variable>
<xsl:variable name="y" select="count($Form2290Schedule1/VehicleSuspendedTaxItem)"></xsl:variable>


<!--BEGIN PART II BEGIN PART II BEGIN PART II BEGIN PART II BEGIN PART II-->
<div style="width:187mm;height:3.75mm;border-top-width:1">
  <div class="styPartName" style="height:3.75mm">Part II</div>
  <div class="styPartDesc" style="width:167mm"> Vehicles for Which Tax is Suspended&#8212;5,000 Miles or Less (7,500 Miles or Less for</div>
  <xsl:if test="count($Form2290Schedule1/VehicleSuspendedTaxItem) &gt; 2">
    <div class="styGenericDiv" style="float:right;width:1mm;padding-left:2mm;">
      <!-- button display logic -->
      <xsl:call-template name="SetDynamicTableToggleButton" >
        <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleSuspendedTaxItem"/>
        <xsl:with-param name="containerHeight" select="2"/>
        <xsl:with-param name="containerID" select=" 'VSTctn' "/>
      </xsl:call-template>
      <!-- end button display logic -->
    </div>  
  </xsl:if>
</div>

<!--Begin Part 2 Header-->
<div class="styTableContainer" id="VSTctn">
  <xsl:call-template name="SetInitialState"/>
  <table cellspacing="0" cellpadding="0" style="font-size:7pt">
      <tr>
        <th class="styBB" colspan="2">
          <div style="float:left;clear:none"><span style="width:14mm" /></div>
          <div class="styPartDesc" style="width:149mm;text-align:left">
            Agricultural Vehicles). <span style="font-weight:normal">Enter VIN</span>
          </div>
        </th>
        <th style="font-weight:normal;font-size:7pt;width:20mm;height:3mm;text-align:center;border: solid black 1">
          Category
        </th>
      </tr>
      
      <!--BEGIN  Part 2 Table BEGIN PART 2 TABLE    BEGIN PART 2 TABLE -->
      
    <tbody>
      <xsl:if test="($Print != $Separated) or (count($Form2290Schedule1/VehicleSuspendedTaxItem) &lt;=2)">
        <xsl:for-each select="$Form2290Schedule1/VehicleSuspendedTaxItem">
          <tr style="height:5.5mm">
            <td class="sty2290Sch1TableCellCtr" style="width:6mm">
              <xsl:number></xsl:number>
            </td>
            <xsl:choose>
              <xsl:when test="position() > 2">
                <td class="sty2290Sch1TableCellBB" style="text-align:left;width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="VIN" />
                  </xsl:call-template>
                </td>
              </xsl:when>
              <xsl:otherwise>
                <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN" />
                    <xsl:with-param name="BoxNum" select="1" />
                    <xsl:with-param name="BoxWidth" select="'5mm'" />
                    <xsl:with-param name="BoxHeight" select="'4.25mm'" />
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'" />
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN" />
                    <xsl:with-param name="BoxNum" select="2" />
                    <xsl:with-param name="BoxWidth" select="'5mm'" />
                    <xsl:with-param name="BoxHeight" select="'4.25mm'" />
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'" />
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                </td>
              </xsl:otherwise>
            </xsl:choose>
            <td class="sty2290Sch1TableCellLast" style="width:20mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="VehicleCategoryCode"></xsl:with-param>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </xsl:if>
      <!--filler rows-->
      <xsl:if test="count($Form2290Schedule1/VehicleSuspendedTaxItem) &lt; 1 or ((count($Form2290Schedule1/VehicleSuspendedTaxItem) &gt;2) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm">
            <b>1</b>
          </td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <xsl:choose>
              <xsl:when test="((count($Form2290Schedule1/VehicleSuspendedTaxItem) &gt;2) and ($Print = $Separated))">
                <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleSuspendedTaxItem"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm">
            <span style="width:1px" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleSuspendedTaxItem) &lt; 2 or ((count($Form2290Schedule1/VehicleSuspendedTaxItem) &gt;2) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>2</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
    </tbody>
    <tfoot></tfoot>
  </table>
</div>

<xsl:call-template name="SetInitialDynamicTableHeight">
  <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleSuspendedTaxItem"/>
  <xsl:with-param name="containerHeight" select="2"/>
  <xsl:with-param name="containerID" select=" 'VSTctn' "/>
</xsl:call-template>

<!--End Part II-->

<!--BEGIN PART III BEGIN PART III BEGIN PART III BEGIN PART III BEGIN PART III BEGIN PART III-->
<div class="styBB" style="width:187mm;height:3.75mm;border-top-width:1px">
        <div class="styPartName" style="height:3.75mm">Part III</div>
        <div class="styPartDesc" style="float:left;width:167mm;">Summary of Reported Vehicles</div>
</div>
        
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="width:6mm;padding-left:2mm">a</div>
  <div class="styLNDesc" style="width:143mm;font-size:6pt;padding-top:1mm">Enter the number of taxable vehicles from Form 2290, page 2, column 3, <span class="styBoldText">Totals</span>
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
          </span>
  </div>
  <div class="styLNRightNumBox" style="width:6mm">a</div>
  <div class="styLNAmountBox" style="width:30mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form2290Schedule1/NumberOfTaxableVehicles" />
    </xsl:call-template>
  </div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="width:6mm;padding-left:2mm">b</div>
  <div class="styLNDesc" style="width:143mm;font-size:6pt;padding-top:1mm">Enter the total number of taxable vehicles on which the tax is suspended from Form 2290, page 2, column 3 (category W) 
    <!--Dotted Line-->
    <span class="styBoldText">
            <span style="width:8px"></span>.
            <span style="width:11px"></span>.
          </span>
  </div>
  <div class="styLNRightNumBox" style="width:6mm;border-bottom-width:0">b</div>
  <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form2290Schedule1/TotalNumberSuspendedVehicles" />
    </xsl:call-template>
  </div>
</div>
<!--  END PART 3    END PART 3   END PART 3     END PART 3   -->

<!--  PAGE END     PAGE END     PAGE END -->
                <div style="width:187mm;border-top:2 black solid" > 
    <span style="float:left"><span class="styBoldText" style="font-size:7pt">For Privacy Act and Paperwork Reduction Act Notice, see page 9 of the instructions.</span></span>
   <span style="float:right"><span class="styBoldText" style="font-size:8pt">Schedule 1 (Form 2290)</span> (Rev. 7-2008)</span>
</div>

<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="width:55mm;padding-left:2mm;padding-top:1mm;"></div>
  <div class="styLNDesc" style="width:130mm;font-size:6.5pt;padding-top:1mm;"><b>Do not</b> cut or separate the forms on this page.</div>
<div class="styLNDesc" style="width:187mm;font-size:6.5pt;padding-top:1mm;">-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
</div></div><!--</div>-->

<div style="width:187mm;" />



<!-- ########################################################################################-->
<!--************************************************************************************************************************-->
<!-- ADDING ANOTHER COPY OF THE SCHEDULE AS SHOWN ON THE PDF DATED 2/14/08 and Per RIS ETA081635OTH -->
<!--  Making this change per the PDF ETA081635OTH_00.pdf dated 4/30/08 that was attached to the RIS -->

<!-- Begin Document Header -->
 <div class="styBB" style="width:187mm;">
    <div class="styFNBox" style="width:31mm;height:18mm;">
      <span class="styFormNumber" style="font-size:8pt">SCHEDULE 1<br/>(Form 2290)</span>      
      <br />      
     
      <span class="styAgency">(Rev. July 2008)<br/> Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="width:125mm;height:18mm;padding-top:1mm">
      <div class="styMainTitle" style="height:5mm">Schedule of Heavy Highway Vehicles</div>
      <div class="styFST" style="height:4mm;font-size:8pt;text-align:center;font-weight:normal">
         For the period July 1, 2008, through June 30, 2009<br/>
         </div>
         <div class="styFST" style="height:4mm;font-size:6pt;text-align:left;padding-left:6.5mm;padding-top:1.5mm;">
             This copy will be stamped and returned to you for use as proof of payment when registering<br />
             vehicle(s) with a state.      </div>
      </div>
    <div class="styTYBox" style="width:31mm;height:18mm;border-bottom-width:0px">
      <div class="styOMB" style="height:18mm;padding-top:8mm;padding-left:0.5mm;border-bottom-width:0px">OMB No. 1545-0143</div>
    </div>
  </div>
<table  border="0" cellspacing="0" cellpadding="0" style="font-size:6pt;width:187mm">
  <tbody>
    <tr>
      <td rowspan="3" style="border:0 solid black;border-right-width:1;width:10mm;font-size:7pt;text-align:center"><span class="styBoldText">Type<br/> or<br/> Print</span></td>
      <td style="width:93mm;border:0 solid black;border-right-width:1;border-bottom-width:1;padding-left:2mm">Name as shown on Form 2290<br/>
        <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template>
      </td>
      
      <td style="width:61mm;border:0 solid black;border-right-width:0;border-bottom-width:1;vertical-align:top;padding-bottom:0.25mm;padding-left:1mm">
        <b>Employer identification number</b><br/>
        <div style="padding-top:1.25mm">
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="1" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="2" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="float:left;clear:none"> - </span>
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="3" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="4" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="5" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="6" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="7" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="8" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
          <span style="width:0.5mm;float:left;clear:none" />
          <xsl:call-template name="PopulateIndividualSizableLetterBox">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
            <xsl:with-param name="BoxNum" select="9" />
            <xsl:with-param name="BoxWidth" select="'3mm'" />
            <xsl:with-param name="BoxHeight" select="'3mm'" />
            <xsl:with-param name="BoxTopPadding" select="'0mm'" />
          </xsl:call-template>
        </div>
      </td>
  <!--    <td style="width:31.2mm;border:2 solid black;border-right-width:0;border-bottom-width:1px;text-align:center"><b>FOR IRS<br />USE ONLY</b></td>-->
      
    </tr>
    <tr>
        <td colspan="2" style="border:0 solid black;border-right-width:0;border-bottom-width:1;padding-left:2mm">Address (number, street, and room or suite no.)
        <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine1</xsl:with-param></xsl:call-template>
        <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine2</xsl:with-param></xsl:call-template>
        </td>
   <!--     <td rowspan="2" style="border:2 solid black;border-right-width:0;border-top-width:0px">T<br/>FF<br/>FP<br/>I<br/>T<br/></td>-->
    </tr>
    <tr>
    <td colspan="2" style="border:0 solid black;border-right-width:0;padding-left:2mm">City, state, and ZIP code (Canadian or Mexican address, see page 5 of the instructions.)
    <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param></xsl:call-template>
    <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">Country</xsl:with-param><xsl:with-param name="MainForm">true</xsl:with-param></xsl:call-template></td>
    </tr>
  </tbody>
</table>

<div class="styBB"  style="width:187mm;border-top:1 solid black;border-right-width:0px">

<xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &gt; 5">
  <div style="width:3mm;float:right">
    <!-- button display logic -->
    <xsl:call-template name="SetDynamicTableToggleButton" >
      <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleReportTaxItem"/>
      <xsl:with-param name="containerHeight" select="5"/>
      <xsl:with-param name="containerID" select=" 'VRT2ctn' "/>
    </xsl:call-template>
    <!-- end button display logic -->
  </div>
</xsl:if>
<span class="styBoldText">Caution. </span> <span class="styItalicText">You must list <span class="styBoldText">all</span> vehicles. Attach a separate list if needed. See page 7 of the instructions.</span>

</div>

<!--BEGIN PART I BEGIN PART I BEGIN PART I BEGIN PART I BEGIN PART I BEGIN PART I-->

<div class="styTableContainer" id="VRT2ctn">
  <xsl:call-template name="SetInitialState"/>

  <!--Begin Part 1 Header-->

  <table cellspacing="0" cellpadding="0" style="font-size:7pt">
      <tr>
        <th class="styBB" colspan="2">
          <div class="styPartName">Part I</div>
          <div class="styPartDesc" style="width:149mm;text-align:left">
            Vehicles on Which You Are Reporting Tax. <span style="font-weight:normal">Enter VIN and category.</span>
          </div>
        </th>
        <th style="font-weight:normal;font-size:7pt;width:20mm;height:3mm;text-align:center;border: solid black 1;border-top-width:0px">
          Category
        </th>
      </tr>
      <!--Begin Part 1 Table-->
    <tbody>
      <xsl:if test="($Print != $Separated) or (count($Form2290Schedule1/VehicleReportTaxItem) &lt;=5)">
        <xsl:for-each select="$Form2290Schedule1/VehicleReportTaxItem">
          <tr style="height:5.5mm">
            <td class="sty2290Sch1TableCellCtr" style="width:6mm">
              <xsl:number></xsl:number>
            </td>
            <xsl:choose>
              <xsl:when test="position() > 5">
                <td class="sty2290Sch1TableCellBB" style="text-align:left;width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
                  <span style="text-align:left">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="VIN" />
                    </xsl:call-template>
                  </span>
                </td>
              </xsl:when>
              <xsl:otherwise>
                <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN" />
                    <xsl:with-param name="BoxNum" select="1" />
                    <xsl:with-param name="BoxWidth" select="'5mm'" />
                    <xsl:with-param name="BoxHeight" select="'4.25mm'" />
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'" />
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN" />
                    <xsl:with-param name="BoxNum" select="2" />
                    <xsl:with-param name="BoxWidth" select="'5mm'" />
                    <xsl:with-param name="BoxHeight" select="'4.25mm'" />
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'" />
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                </td>
              </xsl:otherwise>
            </xsl:choose>
            <td class="sty2290Sch1TableCellLast" style="width:20mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="VehicleCategoryCode"></xsl:with-param>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </xsl:if>
      <!--filler rows-->
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 1 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm">
            <b>1</b>
          </td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <xsl:choose>
              <xsl:when test="((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
                <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleReportTaxItem"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm">
            <span style="width:1px" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 2 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>2</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 3 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>3</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 4 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>4</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &lt; 5 or ((count($Form2290Schedule1/VehicleReportTaxItem) &gt;5) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>5</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
    </tbody>
    <tfoot></tfoot>
  </table>
</div>

<!-- Set Initial Height of Above Table -->
<xsl:call-template name="SetInitialDynamicTableHeight">
	<xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleReportTaxItem"/>
	<xsl:with-param name="containerHeight" select="5"/>
	<xsl:with-param name="containerID" select=" 'VRT2ctn' "/>
</xsl:call-template>
<!-- End Set Initial Height of Above Table -->

<!--End Part 1 Table-->
<xsl:variable name="xx" select="count($Form2290Schedule1/VehicleReportTaxItem)"></xsl:variable>
<xsl:variable name="yy" select="count($Form2290Schedule1/VehicleSuspendedTaxItem)"></xsl:variable>


<!--BEGIN PART II BEGIN PART II BEGIN PART II BEGIN PART II BEGIN PART II-->
<div style="width:187mm;height:3.75mm;border-top-width:1">
  <div class="styPartName" style="height:3.75mm">Part II</div>
  <div class="styPartDesc" style="width:167mm"> Vehicles for Which Tax is Suspended&#8212;5,000 Miles or Less (7,500 Miles or Less for</div>
  <xsl:if test="count($Form2290Schedule1/VehicleSuspendedTaxItem) &gt; 2">
    <div class="styGenericDiv" style="float:right;width:1mm;padding-left:2mm;">
      <!-- button display logic -->
      <xsl:call-template name="SetDynamicTableToggleButton" >
        <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleSuspendedTaxItem"/>
        <xsl:with-param name="containerHeight" select="2"/>
        <xsl:with-param name="containerID" select=" 'VST2ctn' "/>
      </xsl:call-template>
      <!-- end button display logic -->
    </div>  
  </xsl:if>
</div>

<div class="styTableContainer" id="VST2ctn">
  <xsl:call-template name="SetInitialState"/>
  <table cellspacing="0" cellpadding="0" style="font-size:7pt">
      <tr>
        <th class="styBB" colspan="2">
          <div style="float:left;clear:none"><span style="width:14mm" /></div>
          <div class="styPartDesc" style="width:149mm;text-align:left">
            Agricultural Vehicles). <span style="font-weight:normal">Enter VIN</span>
          </div>
        </th>
        <th style="font-weight:normal;font-size:7pt;width:20mm;height:3mm;text-align:center;border: solid black 1">
          Category
        </th>
      </tr>
      
      <!--BEGIN  Part 2 Table BEGIN PART 2 TABLE    BEGIN PART 2 TABLE -->
      
    <tbody>
      <xsl:if test="($Print != $Separated) or (count($Form2290Schedule1/VehicleSuspendedTaxItem) &lt;=2)">
        <xsl:for-each select="$Form2290Schedule1/VehicleSuspendedTaxItem">
          <tr style="height:5.5mm">
            <td class="sty2290Sch1TableCellCtr" style="width:6mm">
              <xsl:number></xsl:number>
            </td>
            <xsl:choose>
              <xsl:when test="position() > 2">
                <td class="sty2290Sch1TableCellBB" style="text-align:left;width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="VIN" />
                  </xsl:call-template>
                </td>
              </xsl:when>
              <xsl:otherwise>
                <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN" />
                    <xsl:with-param name="BoxNum" select="1" />
                    <xsl:with-param name="BoxWidth" select="'5mm'" />
                    <xsl:with-param name="BoxHeight" select="'4.25mm'" />
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'" />
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN" />
                    <xsl:with-param name="BoxNum" select="2" />
                    <xsl:with-param name="BoxWidth" select="'5mm'" />
                    <xsl:with-param name="BoxHeight" select="'4.25mm'" />
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'" />
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;float:left;clear:none" />
                  <xsl:call-template name="PopulateIndividualSizableLetterBox">
                    <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
                    <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
                    <xsl:with-param name="BoxWidth" select="'5mm'"></xsl:with-param>
                    <xsl:with-param name="BoxHeight" select="'4.25mm'"></xsl:with-param>
                    <xsl:with-param name="BoxTopPadding" select="'0.5mm'"></xsl:with-param>
                  </xsl:call-template>
                </td>
              </xsl:otherwise>
            </xsl:choose>
            <td class="sty2290Sch1TableCellLast" style="width:20mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="VehicleCategoryCode"></xsl:with-param>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </xsl:if>
      <!--filler rows-->
      <xsl:if test="count($Form2290Schedule1/VehicleSuspendedTaxItem) &lt; 1 or ((count($Form2290Schedule1/VehicleSuspendedTaxItem) &gt;2) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm">
            <b>1</b>
          </td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <xsl:choose>
              <xsl:when test="((count($Form2290Schedule1/VehicleSuspendedTaxItem) &gt;2) and ($Print = $Separated))">
                <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleSuspendedTaxItem"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
                <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm">
            <span style="width:1px" />
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form2290Schedule1/VehicleSuspendedTaxItem) &lt; 2 or ((count($Form2290Schedule1/VehicleSuspendedTaxItem) &gt;2) and ($Print = $Separated))">
        <tr style="height:5.5mm">
          <td class="sty2290Sch1TableCellCtr" style="width:6mm"><b>2</b></td>
          <td class="sty2290Sch1TableCellBB" style="width:161mm;padding-left:2mm;padding-top:0.25mm;padding-bottom:0.25mm">
            <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
              <div class="sty2290Sch1BlankLetterBox" /><span class="sty2290Sch1LetterBoxSpace" />
          </td>
          <td class="sty2290Sch1TableCellLast" style="width:20mm"><span style="width:1px" /></td>
        </tr>
      </xsl:if>
    </tbody>
    <tfoot></tfoot>
  </table>
</div>

<xsl:call-template name="SetInitialDynamicTableHeight">
  <xsl:with-param name="TargetNode" select="$Form2290Schedule1/VehicleSuspendedTaxItem"/>
  <xsl:with-param name="containerHeight" select="2"/>
  <xsl:with-param name="containerID" select=" 'VST2ctn' "/>
</xsl:call-template>

<!--End Part II-->

<!--BEGIN PART III BEGIN PART III BEGIN PART III BEGIN PART III BEGIN PART III BEGIN PART III-->
<div class="styBB" style="width:187mm;height:3.75mm;border-top-width:1px">
        <div class="styPartName" style="height:3.75mm">Part III</div>
        <div class="styPartDesc" style="float:left;width:167mm;">Summary of Reported Vehicles</div>
</div>
        
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="width:6mm;padding-left:2mm">a</div>
  <div class="styLNDesc" style="width:143mm;font-size:6pt;padding-top:1mm">Enter the number of taxable vehicles from Form 2290, page 2, column 3, <span class="styBoldText">Totals</span>
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
            <span style="width:11px"></span>.
           <span style="width:11px"></span>.
            <span style="width:11px"></span>.

          </span>
  </div>
  <div class="styLNRightNumBox" style="width:6mm">a</div>
  <div class="styLNAmountBox" style="width:30mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form2290Schedule1/NumberOfTaxableVehicles" />
    </xsl:call-template>
  </div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="width:6mm;padding-left:2mm">b</div>
  <div class="styLNDesc" style="width:143mm;font-size:6pt;padding-top:1mm">Enter the total number of taxable vehicles on which the tax is suspended from Form 2290, page 2, column 3 (category W) 
    <!--Dotted Line-->
    <span class="styBoldText">
            <span style="width:8px"></span>.
            <span style="width:11px"></span>.
          </span>
  </div>
  <div class="styLNRightNumBox" style="width:6mm;border-bottom-width:0">b</div>
  <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form2290Schedule1/TotalNumberSuspendedVehicles" />
    </xsl:call-template>
  </div>
</div>
<!--  END PART 3    END PART 3   END PART 3     END PART 3   -->

<!--  PAGE END     PAGE END     PAGE END -->
                <div style="width:187mm;border-top:2 black solid" > 
    <span style="float:left"><span class="styBoldText" style="font-size:6.5pt">For Privacy Act and Paperwork Reduction Act Notice, see page 9 of the instructions. </span> <span class="styNormalText" style="font-size:6.5pt;padding-left:4mm;">         Cat. No. 11250O      </span></span>

<span style="float:right"><span class="styBoldText" style="font-size:6.5pt">Schedule 1 (Form 2290)</span> (Rev. 7-2008)</span>
</div>








<!-- BEGIN  CONSENT TO DISCLOSURE OF TAX INFORMATION  -->

<div class="pageEnd" /><br />
<!--<xsl:if test="$RtnHdrData/ConsentToVINDataDisclosure/ConsentToDiscloseYes = 'X'">-->
  <div class="styTBB" style="width:187mm">
    <div style="float:left;width:177mm;padding-bottom:0.5mm">Schedule 1 (Form 2290) (Rev. 7-2008)</div>
    <div style="float:left;width:10mm;text-align:right;padding-bottom:0.5mm">Page <span class="styBoldText" style="font-size:8pt">2</span></div>
  </div>
  <div style="width:187mm;height:8mm;font-size:13pt;text-align:center;font-weight:bold;padding-top:1mm">Consent to Disclosure of Tax Information</div>
  <div style="width:187mm;height:8mm;font-size:11pt;text-align:center;vertical-align:middle">For the period July 1, 2008, through June 30, 2009</div>
  <div style="width:187mm;font-size:11pt"><span style="width:4mm" />
By signing, dating, and entering my employer identification number below, I hereby
consent to the Internal Revenue Service (IRS) disclosing information about my payment of
the Heavy Highway Vehicle Use Tax (HVUT) for the tax period listed above to the federal
Department of Transportation (DOT), U.S. Customs and Border Protection (CBP), and to
state Departments of Motor Vehicles (DMV). The information disclosed to the DOT, CBP,
and state DMVs will be my Vehicle Identification Number (VIN) and verification that I have
paid the HVUT. The IRS may disclose the information to the DOT, CBP, and to the DMVs
of the 50 states and the District of Columbia who have other taxing, registration, or
information collecting authority.
  </div>
  <div style="width:187mm;font-size:11pt"><span style="width:4mm" />
    I understand that the information to be disclosed is generally confidential under the laws
applicable to the IRS and that the agency receiving the HVUT information is not bound by
these laws and may use the information for any purpose as permitted by other federal laws
and/or state law. To be effective, this consent must be submitted to the IRS within 60 days
of the date below.
  </div>
  <div class="styBB" style="width:187mm;font-size:11pt;padding-bottom:2mm"><span style="width:4mm" />
    If signed by a corporate officer or party other than the taxpayer, I certify that I have the
authority to execute this consent to disclosure of tax information.
  </div>
  <div style="width:187mm">
  <table class="styTBB" cellspacing="0" cellpadding="0">
			<tbody style="font-size:7pt">
				<tr style="height:10mm">
					<th class="styTableCellCtr" style="width:20mm;font-size:13pt;font-weight:bold;border-bottom-width:0px" rowspan="4">Sign<br />Here</th>
					<th style="width:6mm;vertical-align:bottom;padding-bottom:2mm;padding-right:1mm"><img align="right" src="{$ImagePath}/2290Sch1_Bullet_Md.gif" alt="MediumBullet" /></th>
					<th class="styBB" style="width:86mm;vertical-align:bottom;font-weight:normal;text-align:left">Signed Electronically</th>
					<th style="width:8mm;vertical-align:bottom;padding-bottom:2mm;padding-right:1mm"><img align="right" src="{$ImagePath}/2290Sch1_Bullet_Md.gif" alt="MediumBullet" /></th>
					<th class="styBB" style="width:67mm;vertical-align:bottom;font-weight:normal;text-align:left">
					  <xsl:call-template name="PopulateMonthDayYear">
					    <xsl:with-param name="TargetNode" select="$RtnHdrData/ConsentToVINDataDisclosure/DisclosureFormSignatureInfo/DateSigned"></xsl:with-param>
					  </xsl:call-template>
					</th>
				</tr>
				<tr style="height:4mm">
					<td rowspan="3"><span style="width:1px" /></td>
					<td>Signature</td>
					<td><span style="width:1px" /></td>
					<td>Date</td>
				</tr>
				<tr style="height:10mm">
					<td>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$RtnHdrData/ConsentToVINDataDisclosure/DisclosureFormSignatureInfo/Name/BusinessNameLine1"></xsl:with-param>
					</xsl:call-template><br />
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$RtnHdrData/ConsentToVINDataDisclosure/DisclosureFormSignatureInfo/Name/BusinessNameLine2"></xsl:with-param>
					</xsl:call-template>
					</td>
					<td style="vertical-align:bottom;padding-bottom:2mm;padding-right:1mm"><img align="right" src="{$ImagePath}/2290Sch1_Bullet_Md.gif" alt="MediumBullet" /></td>
					<td class="styBB" style="vertical-align:bottom;text-align:left"><span style="width:1px" />
					<xsl:call-template name="PopulateEIN">
					  <xsl:with-param name="TargetNode" select="$RtnHdrData/ConsentToVINDataDisclosure/DisclosureFormSignatureInfo/EIN"></xsl:with-param>
					</xsl:call-template>
					</td>
				</tr>
				<tr style="height:4mm">
					<td>Type or print name below signature</td>
					<td><span style="width:1px" /></td>
					<td>Employer identification number</td>
				</tr>
			</tbody>
		</table>
</div>
<div style="width:187mm;text-align:right;padding-top:1mm"><b>Schedule 1 (Form 2290)</b> (Rev. 7-2008)</div>
<div class="pageEnd" /><br />
<!--</xsl:if>-->





      <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
    	 <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$Form2290Schedule1" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>
        </table>
       
       

      <!-- END Left Over Table -->  

<!-- Optional Print Solution for repeating data table Part I, Line 2 -->
<xsl:if test="count($Form2290Schedule1/VehicleReportTaxItem) &gt; 5 and ($Print = $Separated)">
  <span class="styRepeatingDataTitle">Form 2290 Schedule 1, Part I - Vehicles on Which You Are Reporting Tax:</span>

  <table class="styDepTbl" style="font-size:7pt">
    <thead class="styTableThead" style="font-size:7pt">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:14mm;" scope="col"><span style="width:1px"></span></th>
        <th class="styDepTblCell" style="width:199mm;font-weight:normal;" scope="col">Vehicle Identification Number</th>
        <th class="styDepTblCell" style="width:20mm;font-weight:normal;" scope="col">Category</th>
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="$Form2290Schedule1/VehicleReportTaxItem">
        <xsl:variable name="pos" select="position()"></xsl:variable>
        <tr>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
              <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="width:16mm">
            <xsl:number></xsl:number>
          </td>
          <td class="styDepTblCell" style="width:149mm;text-align:center" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:20mm;text-align:center" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="VehicleCategoryCode"></xsl:with-param>
            </xsl:call-template>
          </td>     
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
</xsl:if>

<xsl:if test="count($Form2290Schedule1/VehicleSuspendedTaxItem) &gt; 2 and ($Print = $Separated)">
  <br />
  <span class="styRepeatingDataTitle">Form 2290 Schedule 1, Part II - Vehicles for Which Tax Is Suspended&#8212;5,000 Miles or Less (7,500 Miles or Less for Agricultural Vehicles):</span>
  <table class="styDepTbl" style="font-size:7pt">
    <thead class="styTableThead" style="font-size:7pt">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:14mm;" scope="col"><span style="width:1px"></span></th>
        <th class="styDepTblCell" style="width:149mm;font-weight:normal;" scope="col">Vehicle Identification Number</th>
        <th class="styDepTblCell" style="width:20mm;font-weight:normal;" scope="col">Category</th>
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="$Form2290Schedule1/VehicleSuspendedTaxItem">
        <xsl:variable name="pos" select="position()"></xsl:variable>
        <tr>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
              <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="width:14mm">
            <xsl:number></xsl:number>
          </td>
          <td class="styDepTblCell" style="width:149mm;text-align:center" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="VIN"></xsl:with-param>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="width:20mm;text-align:center" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="VehicleCategoryCode"></xsl:with-param>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
</xsl:if>
     
    </form>
  </body>
</html>









</xsl:template>
</xsl:stylesheet>
