<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8903Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8903" />

<!-- Check this out -->
<xsl:template match="/">
<html>
<head>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Author" content="Lisa Lane -Lisa.T.Lane@irs.gov" />
  <meta name="Description" content="Form IRS 8903"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">  
      <xsl:call-template name="IRS8903Style"></xsl:call-template>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8903">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 20mm;">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 22mm;">
      Form <span class="styFormNumber">8903</span>      
      <br/>
      <span>
      <xsl:call-template name="LinkToLeftoverDataTableInline">          
         <xsl:with-param name="Desc"></xsl:with-param>    
         <xsl:with-param name="TargetNode" select="$FormData/@section30191002Indicator"/>    
                        </xsl:call-template>      
      </span>  
      <br/>
      <br/>
      <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height: 22mm;width:125mm;padding-top:4mm;">
      <div class="styMainTitle" style="height: 8mm">Domestic Production Activities Deduction</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold"><br/><br/>
        <img src="{$ImagePath}/8903_Bullet.gif" alt="MediumBullet"/>  
        Attach to your tax return. 
         <img src="{$ImagePath}/8903_Bullet.gif" alt="MediumBullet"/>  
        See separate instructions.
        <br/>
      </div>
    </div>
    <div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px;">
      <div class="styOMB" style="height:2mm;">OMB No. 1545-1984</div>
      <div class="styTaxYear" style="height:10mm">20<span class="styTYColor">07</span></div>
      <div class="stySequence">Attachment<br/>Sequence No. <b>143</b></div>
    </div>
  </div>
  <!--  End title of Form  -->
    
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:141mm;font-weight:normal;font-size:7pt;">
      Name(s) as shown on return<br/>
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>      
    </div>
    <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;font-weight: normal;">Identifying number
      <br/><br/>
      <span style="font-weight:normal;">  
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>
      </span>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
  <!-- -->
  <!--  Line 1 -->    
  <div style="width:187mm;">
       <div class="styLNLeftNumBoxSD" style="padding-top:3mm;  padding-left:4mm;">1</div>
       <div class="styLNDesc" style="width:139mm;padding-top:3mm;">
              Domestic production gross receipts (DPGR)
              <span class="styBoldText">
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
              </span>
       </div>
       <div style="float:right;">
       <div class="styLNRightNumBox" style="padding-top:4mm;">1</div>
       <div class="styLNAmountBox" style="padding-top:4mm;">
            <xsl:call-template name="PopulateAmount">
         	  <xsl:with-param name="TargetNode" select="$FormData/DomesticProdGrossReceipts"/>
     	  </xsl:call-template> 
       </div>          
       </div>
  </div>
  
  <!--End  Line 1 -->
  
  <!--  Line 2 -->  
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBoxSD" style="height:4mm; padding-left:4mm;">2</div>
    	<div class="styLNDesc" style="width:99mm; height:4mm;">
    		Allocable cost of goods sold. If you are using the small business simplified
    		overall method, skip lines 2 and 3
            <span class="styBoldText">
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                   <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
        </span>

    	</div>
   
     	<div class="styLNRightNumBox" style="padding-top:4mm;height:4mm;">2</div>
     	<div class="styLNAmountBox" style="padding-top:4mm;height:4mm;">
     	     <xsl:call-template name="PopulateAmount">
     		  <xsl:with-param name="TargetNode" select="$FormData/AllocatedCOGS"/>
         		</xsl:call-template>
     	</div> 
     	<div style="float:right;">
     	<div class="styShadingCellBox" ></div>
    		<div class="styShadingCell" style="height:8mm;background-color:white;"></div>
    	</div>
    	</div>
  <!--End  Line 2 -->
   
  <!--  Line 3 -->  
  <div style="width: 187mm">  
  	<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">3</div>
  	<div class="styLNDesc" style="width:99mm">
     	If you are using the section 861 method, enter deductions and 
     	losses directly allocable to DPGR. All others, skip line 3
             <span class="styBoldText">
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
        </span>    	
    	</div>    
      	<div class="styLNRightNumBox" style="padding-top:4mm;height:5.5mm;">3</div>
      	<div class="styLNAmountBox" style="padding-top:4mm;height:5.5mm;">
        		<xsl:call-template name="PopulateAmount">
          			<xsl:with-param name="TargetNode" select="$FormData/DirectDeductionsExpensesLosses"/>
        		</xsl:call-template>
     	</div>
     	<div style="float:right;">
     	<div class="styShadingCellBox"></div>
    		<div class="styShadingCell" style="height:8mm;background-color:white;"></div>
    </div>
    </div>
  <!--End  Line 3 -->
  
  <!--  Line 4 -->  
  <div style="width: 187mm">  
  	<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">4</div>
     <div class="styLNDesc" style="width:99mm;">
	    If you are using the small business simplified overall method, enter
         the amount of cost of goods sold and other deductions or losses
         you ratably apportion to DPGR. All others, skip line 4    
	    <span class="styBoldText">
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
        </span>    	

    	</div>    
  
      	<div class="styLNRightNumBox" style="padding-top:6.5mm;height:6.5mm;">4</div>
      	<div class="styLNAmountBox" style="padding-top:6.5mm;height:6.5mm">
        		<xsl:call-template name="PopulateAmount">
          		<xsl:with-param name="TargetNode" select="$FormData/IndDeductionsExpensesLosses"/>
        		</xsl:call-template>
     	</div>
     	<div style="float:right;">
     	<div class="styShadingCellBox" style="height:12mm;"></div>
    		<div class="styShadingCell" style="height:12mm;background-color:white;"></div>
    		</div>
    	</div>
  
  <!--  Line 4 -->
    
   <!--  Line 5 -->    
   
    <div style="width:187mm;">
       <div class="styLNLeftNumBoxSD" style="padding-top:3mm; padding-left:4mm;">5</div>
       <div class="styLNDesc" style="width:139mm;padding-top:3mm;">
              Add lines 2 through 4
              <span class="styBoldText">
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  
              </span>
       </div>
       <div style="float:right;">

       <div class="styLNRightNumBox" style="padding-top:4mm;">5</div>
       <div class="styLNAmountBox" style="padding-top:4mm;">
            <xsl:call-template name="PopulateAmount">
         	  <xsl:with-param name="TargetNode" select="$FormData/TotalAllocatedCOGSDedExpLosses"/>
     	  </xsl:call-template> 
       </div>          
       </div>
  </div>
  <!--End  Line 5 -->

  <!--  Line 6 -->    
  
  
    <div style="width:187mm;">
       <div class="styLNLeftNumBoxSD" style="padding-top:3mm; padding-left:4mm;">6</div>
       <div class="styLNDesc" style="width:139mm;padding-top:3mm;">
              Subtract line 5 from line 1
              <span class="styBoldText">
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
              </span>
       </div>
         	<div style="float:right;">
     	<div class="styLNRightNumBox" style="padding-top:3mm;">6</div>
     	<div class="styLNAmountBox" style="padding-top:3mm;">
     		<xsl:call-template name="PopulateAmount">
     			<xsl:with-param name="TargetNode" select="$FormData/NetDomesticProdGrossReceipts"/>
     		</xsl:call-template>
     	</div>          
    	</div>

  </div>    
  
  <!--End Line 6 -->
  
  
   <!--  Line 7  -->
  <div style="width:187mm;">
         <div class="styLNLeftNumBoxSD" style="padding-top:3mm; padding-left:4mm;">7</div>
       <div class="styLNDesc" style="width:139mm;padding-top:3mm;">
               Qualified production activities income from estates, trusts, and certain partnerships and
S corporations (see instructions).
              <span class="styBoldText">
                 <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.        
              </span>
       </div>
    <div style="float:right">
    		<div class="styLNRightNumBox" style="height:6.5mm;padding-top:0mm;">
      		<div style="width:7.75mm;background-color:lightgrey;height:6.5mm;"></div>
          	7         
   		</div>        
    		<div class="styLNAmountBox" style="height:6.5mm;padding-top:6.5mm;">
      		<xsl:call-template name="PopulateAmount">
        			<xsl:with-param name="TargetNode" select="$FormData/QlfyProductionActivities"/>
      		</xsl:call-template>
    		</div>  
  
  	</div>
  </div>      
<!--End  Line 7  -->    

  <!--  Line 8 -->    
    <div style="width:187mm;">
         <div class="styLNLeftNumBoxSD" style="padding-top:3mm; padding-left:4mm;">8</div>
       <div class="styLNDesc" style="width:139mm;padding-top:3mm;">
               Add lines 6 and 7. Estates and trusts, go to line 9, all others, skip line 9 and go to line 10.
              <span class="styBoldText">
                  <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
              </span>
       </div>

 
    <div style="float:right">
    		<div class="styLNRightNumBox" style="height:3.5mm;padding-top:0mm;">
      		<div style="width:7.75mm;background-color:lightgrey;height:3.5mm;"></div>  
          	8         
   		</div>        
    		<div class="styLNAmountBox" style="height:3.5mm;padding-top:3.5mm;">
      		<xsl:call-template name="PopulateAmount">
        			<xsl:with-param name="TargetNode" select="$FormData/ProductionActivitiesIncome"/>
      		</xsl:call-template>
    		</div>  
<!--      	<div class="styLNRightNumBoxNBB" style="height: 4.5mm;background-color: lightgrey;"></div>
     	 <div class="styLNAmountBoxNBB" style="height: 4.5mm;"></div>           -->
  	</div>
  </div>      
  <!--End  Line 8 -->
  
  <!--  Line 9 -->  
      <div style="width:187mm;">
         <div class="styLNLeftNumBoxSD" style="padding-top:0mm; padding-left:4mm;">9</div>
       <div class="styLNDesc" style="width:139mm;padding-top:0mm;">
               Qualified production activities income from estates, trusts, and certain partnerships and
S corporations (see instructions)
              <span class="styBoldText">
                  <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.     
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.    
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>. 
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>. 
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.      
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.                                                                               
              </span>
       </div>

 
    <div style="float:right">
    		<div class="styLNRightNumBox" style="height:4.5mm;padding-top:3mm;">
<!--      		<div style="width:7.75mm;background-color:lightgrey;height:3.5mm;"></div>     -->
          	9         
   		</div>        
    		<div class="styLNAmountBox" style="height:4.5mm;padding-top:3mm;">
      		<xsl:call-template name="PopulateAmount">
        			<xsl:with-param name="TargetNode" select="$FormData/AmtAllocToBeneficiariesOrTrust"/>
      		</xsl:call-template>
    		</div>  
      <!--	<div class="styLNRightNumBoxNBB" style="height: 3.5mm;background-color: lightgrey;"></div>
     	 <div class="styLNAmountBoxNBB" style="height: 3.5mm;"></div>          -->
  	</div>
  </div>      

  <!-- End Line 9 -->
  
   <!-- Line 10 -->
         <div style="width:187mm;">
         <div class="styLNLeftNumBoxSD" style="padding-top:2mm;">10</div>
       <div class="styLNDesc" style="width:139mm;padding-top:2mm;">
              <b>Qualified production activities income.</b> Estates and trusts, subtract line 9 from line 8, all others, enter 
                     amount from line 8.  If zero or less, enter -0- here, skip lines 11 through 19 and enter -0- on line 20

       </div>

 
    <div style="float:right">
    		<div class="styLNRightNumBox" style="height:5.5mm;padding-top:0mm;">
      		<div style="width:7.75mm;background-color:lightgrey;height:5.5mm;"></div>
          	10         
   		</div>        
    		<div class="styLNAmountBox" style="height:5.5mm;padding-top:5.5mm;">
      		<xsl:call-template name="PopulateAmount">
        			<xsl:with-param name="TargetNode" select="$FormData/QlfyProdActivitiesIncome"/>
      		</xsl:call-template>
    		</div>  
      	<div class="styLNRightNumBoxNBB" style="height: 5.5mm;background-color: lightgrey;"></div>
     	 <div class="styLNAmountBoxNBB" style="height: 5.5mm;"></div>          
  	</div>
  </div>      

   <!-- End Line 10 --> 
   
   <!-- Line 11 -->
     <div style="width:187mm;">
  	<div class="styLNLeftNumBox" style="padding-left:2mm; padding-left:2mm;">11</div>
     <div class="styLNDesc" style="width:134mm;">
       	Income limitation (see instructions):          
          <li style="padding-top:1mm;">
          	Individuals, estates, and trusts. Enter your adjusted gross income figured without the domestic 
			<br/>
			<span style="width:4mm;"></span>production activities deduction
       
            <span style="letter-spacing:4mm; font-weight:bold;">  
              ..................
            </span>
          </li>
          <li style="padding-top:1mm;">
          	All others. Enter your taxable income figured without the domestic production activities 
			<br/>
			<span style="width:4mm;"></span>deduction (tax-exempt organizations, see instructions)
       
            <span style="letter-spacing:4mm; font-weight:bold;">  
              ...........
            </span>  
          </li>
        </div>
        
        <div class="styGenericDiv" style="width:5mm; height:13mm;padding-top:4mm;">    
          <img style="height:17mm" src="{$ImagePath}/8903_Bracket_Lg.gif" alt="Curly Bracket Image"/>                                 
        </div>
	   <div style="float:right">
       	 <div class="styLNRightNumBox" style="width:7.75mm;height:14mm;padding-top=0mm;">
          	<div style="width:7.75mm;border-left-width:0px;background-color:lightgrey;height:11mm;"></div>
          	11
        	</div>
        	<div class="styLNAmountBox" style="height:14mm;padding-top:11mm;">
         	 	<xsl:call-template name="PopulateAmount">
           	 <xsl:with-param name="TargetNode" select="$FormData/IncomeLimitation"/>
          	</xsl:call-template>
       	</div>
         	<div class="styLNRightNumBoxNBB" style="height: 8.25mm;background-color: lightgrey;"></div>
     		<div class="styLNAmountBoxNBB" style="height: 8.25mm;"></div>  
        </div>
      </div>    

   <!-- End Line 11 -->
   
  <!--  Line 12 -->    
  <div style="width: 187mm;">
  	<div class="styLNLeftNumBox" style="padding-left:2mm;">12</div>
     <div class="styLNDesc" style="width:139mm;">
       Enter the smaller of line 10 or line 11. If zero or less, enter -0- here, skip lines 13 through 19, and enter 
    	</div>    
    	<div style="float:right;">
    		<div class="styShadingCellBox" style="height:4mm;"></div>
      	<div class="styLNAmountBoxNBB"  style="height:4mm;">
      	</div>        
    	</div>
  </div>
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:0mm;"></div>
     <div class="styLNDesc" style="padding-top:0mm;">
       -0- on line 20  
           <span class="styBoldText">
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.     
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>. 
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>. 
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>. 
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
          </span>

    	</div>    
    	<div style="float:right;">
      	<div class="styLNRightNumBox">12</div>
      	<div class="styLNAmountBox" >
        		<xsl:call-template name="PopulateAmount">
          		<xsl:with-param name="TargetNode" select="$FormData/QlfyIncomeOrIncomeLimitation"/>
        		</xsl:call-template>
      	</div>          
    	</div>   
  </div>
  
  <!-- End Line 12 -->
  
  <!--  Line 13 -->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:2mm; padding-left:2mm;">13</div>
     <div class="styLNDesc" style="padding-top:2mm;">
       Enter 6% of line 12   
           <span class="styBoldText">
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.     
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>. 
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>. 
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>. 
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
 
          </span>
       
    	</div>    
    	<div style="float:right;">
     	<div class="styLNRightNumBox" style="padding-top:3mm;">13</div>
     	<div class="styLNAmountBox" style="padding-top:3mm;">
     		<xsl:call-template name="PopulateAmount">
     			<xsl:with-param name="TargetNode" select="$FormData/PercentOfIncome"/>
     		</xsl:call-template>
     	</div>          
    	</div>
  </div>
  <!-- End Line 13 -->

  <!--  Line 14 -->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:3mm; padding-left:2mm;">14</div>
     <div class="styLNDesc" style="padding-top:3mm;">
       Form W-2 wages (see instructions)  
             <span class="styBoldText">
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.     
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>. 
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>. 
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
          </span>
     
    	</div>    
    	<div style="float:right;">
     	<div class="styLNRightNumBox" style="padding-top:4mm;">14</div>
     	<div class="styLNAmountBox" style="padding-top:4mm;">
     		<xsl:call-template name="PopulateAmount">
     			<xsl:with-param name="TargetNode" select="$FormData/W2Wages"/>
     		</xsl:call-template>
     	</div>          
    	</div>
  </div>
  <!-- End  Line 14 -->

  <!--  Line 15  -->
    <div style="width:187mm;">
      
         <div class="styLNLeftNumBox" style="padding-top:3mm;  padding-left:2mm;">15</div>
       <div class="styLNDesc" style="width:139mm;padding-top:3mm;">
               Form W-2 wages from estates, trusts, and certain partnerships and S corporations
                (see instructions)
              <span class="styBoldText">
<!--                  <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.    -->
              </span>
       </div>

    <div style="float:right">
    		<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">
      		<div style="width:7.75mm;background-color:lightgrey;height:4mm;"></div>
          	15         
   		</div>        
    		<div class="styLNAmountBox" style="height:4mm;padding-top:4mm;">
      		<xsl:call-template name="PopulateAmount">
        			<xsl:with-param name="TargetNode" select="$FormData/PassThroughW2Wages"/>
      		</xsl:call-template>
    		</div>  
  	</div>
  </div>      
<!--End  Line 15  -->    

<!--  Line 16 -->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:3mm; padding-left:2mm;">16</div>
     <div class="styLNDesc" style="padding-top:3mm;">
       	Add lines 14 and 15. Estates and trusts, go to line 17, all others, skip line 17 and go to line 18  
              <span class="styBoldText">
                     <span style="width:8px"></span>.           
                     <span style="width:8px"></span>.
             </span>

    	</div>    
    	<div style="float:right;">
    	
      	<div class="styLNRightNumBox" style="padding-top:0mm;">
      		<div style="width:7.75mm;background-color:lightgrey;height:4mm;"></div>
      		16
      	</div>
      	<div class="styLNAmountBox" style="padding-top:4mm;">
        		<xsl:call-template name="PopulateAmount">
          		<xsl:with-param name="TargetNode" select="$FormData/TotalW2Wages"/>
        		</xsl:call-template> 
      	</div>          
    	</div>
  </div>
  <!--End  Line 16 -->
  
  <!-- Line 17 -->
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:2mm; padding-left:2mm;">17</div>
     <div class="styLNDesc" style="padding-top:2mm;">
       Amount allocated to beneficiaries of the estate or trust (see instructions).  
           <span class="styBoldText">
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.     
                <span style="width:8px"></span>.
          </span>
       
    	</div>    
    	<div style="float:right;">
     	<div class="styLNRightNumBox" style="padding-top:3mm;">17</div>
     	<div class="styLNAmountBox" style="padding-top:3mm;">
     		<xsl:call-template name="PopulateAmount">
     			<xsl:with-param name="TargetNode" select="$FormData/AmtAllocToBenefOfEstateOrTrust"/>
     		</xsl:call-template>
     	</div>          
    	</div>
  </div>
  <!-- End Line 17 -->
  
  <!-- Line 18 -->
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:2mm;  padding-left:2mm;">18</div>
     <div class="styLNDesc" style="padding-top:2mm;">
       Estates and trusts, subtract line 17 from line 16, all others, enter amount from line 16.
           <span class="styBoldText">
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
  
          </span>
      	</div>    
    	<div style="float:right;">
     	<div class="styLNRightNumBox" style="padding-top:3mm;">18</div>
     	<div class="styLNAmountBox" style="padding-top:3mm;">
     		<xsl:call-template name="PopulateAmount">
     			<xsl:with-param name="TargetNode" select="$FormData/EstatesAndTrusts"/>
     		</xsl:call-template>
     	</div>          
    	</div>
  </div>
  <!-- End Line 18 -->
  
  
  <!--  Line 19 -->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:3mm; padding-left:2mm;">19</div>
    	<div class="styLNDesc" style="padding-top:3mm;">
     	 Form W-2 wage limitation. Enter 50% of line 18 
           <span class="styBoldText">
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
 
          </span>
     	 
   	</div>    
   	<div style="float:right;">
      	<div class="styLNRightNumBox" style="padding-top:4mm;">19</div>
      	<div class="styLNAmountBox" style="padding-top:4mm;">
        		<xsl:call-template name="PopulateAmount">
          		<xsl:with-param name="TargetNode" select="$FormData/W2WageLimitation"/>
        		</xsl:call-template>
      	</div>          
    	</div>
  </div>
  <!--End  Line 19 -->
  
  <!--  Line 20 -->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:3mm; padding-left:2mm;">20</div>
     <div class="styLNDesc" style="padding-top:3mm;">
       Enter the smaller of line 13 or line 19   
           <span class="styBoldText">
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                <span style="width:8px"></span>.
          </span>
       
    	</div>    
    	<div style="float:right;">
      	<div class="styLNRightNumBox" style="padding-top:4mm; padding-left:2mm;">20</div>
      	<div class="styLNAmountBox" style="padding-top:4mm;">
        		<xsl:call-template name="PopulateAmount">
          		<xsl:with-param name="TargetNode" select="$FormData/IncomePctOrW2WageLimitation"/>
        		</xsl:call-template>
      	</div>          
    	</div>
  </div>
  <!-- End Line 20 -->

  <!--  Line 21 -->  
  <div style="width: 187mm;">
  	<div class="styLNLeftNumBox" style="padding-top:3mm; padding-left:2mm;">21</div>
     <div class="styLNDesc" style="padding-top:3mm;">
       Domestic production activities deduction from cooperatives. Enter deduction from Form 
	  1099-PATR, 
    	</div>    
    	<div style="float:right;">
    		<div class="styShadingCellBox" style="height:8mm;"></div>
      	<div class="styLNAmountBoxNBB"  style="height:8mm;">
      	</div>        
    	</div>
  </div>
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:0mm;"></div>
     <div class="styLNDesc" style="padding-top:0mm;">
       box 6   
                  <span class="styBoldText">
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
          </span>

    	</div>    
    	<div style="float:right;">
      	<div class="styLNRightNumBox">21</div>
      	<div class="styLNAmountBox">
        		<xsl:call-template name="PopulateAmount">
          		<xsl:with-param name="TargetNode" select="$FormData/CoopDomesticProductionDed"/>
        		</xsl:call-template>
      	</div>          
    	</div>
  </div>
  <!--End  Line 21 -->
  
  <!--  Line 22 -->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="padding-top:3mm; padding-left:2mm;">22</div>
     <div class="styLNDesc" style="padding-top:3mm;">
        Expanded affiliated group allocation (see instructions)
        <span style="width:2px;"></span>
      <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$FormData/ExpandedGroupAllocation"/>
      </xsl:call-template>
              <span class="styBoldText">
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                <span style="width:8px"></span>.
                
          </span>

    	</div>    
    	<div style="float:right;">
     	<div class="styLNRightNumBox" style="padding-top:4.5mm;">22</div>
     	<div class="styLNAmountBox" style="padding-top:4.5mm;">
     		<xsl:call-template name="PopulateAmount">
     			<xsl:with-param name="TargetNode" select="$FormData/ExpandedGroupAllocation"/>
      		</xsl:call-template>
      	</div>          
    	</div>
  </div>
  <!--End  Line 22 -->

  <!--  Line 23 -->    
  <div class="StyTBB" style="width: 187mm;">
       <div class="styLNLeftNumBox" style=" padding-left:2mm;padding-top:0mm;">23</div>
       <div class="styLNDesc" style="width:138.5mm;padding-top:0mm;">
              <b>Domestic production activities deduction.</b> Combine lines 20 through 22 and enter the result
              here and on Form 1040, line 35; Form 1120, line 25; or the applicable
              line of your return  
              <span class="styBoldText">
                   <span style="width:8px"></span>.
                   <span style="width:8px"></span>.
                   <span style="width:8px"></span>.
                   <span style="width:8px"></span>.
                   <span style="width:8px"></span>.
                   <span style="width:8px"></span>.
                   <span style="width:8px"></span>.
                   <span style="width:8px"></span>.                 
              </span>
      </div>
     
    	<!-- 	<div  style="width=8.25mm;background-color:lightgrey;height:4.7mm;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px; solid;border-style: solid; border-color: black;"></div>    -->
     
<div style="float:right;">

      	<div class="styLNRightNumBox" style="height:7mm; padding-top:3mm;">23</div>
      		<div class="styLNAmountBox" style="border-bottom-width:0px;height:7mm;padding-top:3mm;">
        			<xsl:call-template name="PopulateAmount">
          			<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionDeduction"/>
        			</xsl:call-template>
      		</div>          
     </div>

  </div>
 
  <!-- End Line 23 -->
  
  <!--  FOOTER-->
        <div style="width:187mm;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span> 
          <span style="width:120px;"></span>                      
          Cat. No. 37712F 
          <span style="width:80px;"></span>  
          Form <span class="styBoldText">8903</span> (2007)
        </div> 
        <br class="pageEnd"/>
        
        <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
         <table class="styLeftOverTbl">
        
               <xsl:call-template name="PopulateCommonLeftover">
                   <xsl:with-param name="TargetNode" select="$FormData" />
                   <xsl:with-param name="DescWidth" select="100"/>
               </xsl:call-template>
                                      
                                 
               <xsl:call-template name="PopulateLeftoverRow">          
                     <xsl:with-param name="Desc">Form 8903, Top Left Margin - Section 301.9100-2 Ind</xsl:with-param>    
                     <xsl:with-param name="TargetNode" select="$FormData/@section30191002Indicator"/>            
                     <xsl:with-param name="DescWidth" select="100"/>                          
              </xsl:call-template>      
     
               
        </table>
      <!-- END Left Over Table -->      
  </form>  
</body>
</html>
</xsl:template>    

</xsl:stylesheet>