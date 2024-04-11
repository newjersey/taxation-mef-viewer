<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS1042Style">

  .sty1042DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty1042IUOCell { /* For IRS Use cell */
	height:4mm;
	padding-left:4px;
	padding-top:2px;
	font-weight:bold;
	border-style:solid;
	border-color:black;
	border-width:0px 0px 1px 0px;
	float:left; clear:none;
  }
  
  .sty1042TblNumCell { 
    color: black;
    padding-right:2px;
    font-weight:bold; 
	text-align: right;
	border-style: solid;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  
  .sty1042TblDayCell { 
	width:5mm;
	padding-right:2px;
    color: black; 
	text-align: right;
	border-style: solid;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  }
  
  .sty5227AmountBox{ /* Small Amount Box */ 
	width:27mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-right:2px;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty5227AmountBoxSmall{ /* Small Amount Box with small text size */ 
	width:19mm;height:4mm;
	font-size:6pt;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-right:1px;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty5227SectionTitle{ 
	text-align:center;
	font-weight:bold;
	font-size:8pt;
	padding:2mm;
	border-bottom:1px solid black;
	border-top:1px solid black;
  }
  
  .sty5227HeaderCell { /* Filer Info cell */
	height:7.5mm;
	padding-left:4px;
	padding-right:2px;
	padding-top:2px;
	border-style:solid;
	border-color:black;
	border-width:0px 0px 1px 0px;
	float:left; clear:none;
  }
	
  .sty5227LeftLtrBox {
	float:left; clear:none;
	width:4mm;height:auto;
	font-weight:bold;
  }
  </xsl:template>

</xsl:stylesheet>