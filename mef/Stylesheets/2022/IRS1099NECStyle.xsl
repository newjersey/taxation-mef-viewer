<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS1099NECStyle">

  .sty1099NECLeftNumBoxSD{ /*  */
	width:4.5mm;height:auto;
	font-weight:bold;
	padding-left:0.5mm;
  }
  
  .sty1099NECLeftNumBox{ /*  */
	width:4.5mm;height:auto;
	font-weight:bold;
	padding-left:0mm;
  }
  
  .sty1099NECAmountSpan {
	text-align:right;
	width:30mm;
	padding-right:2px;
	float:right;clear:none;
  }
  
  .sty1099NECNumberedBox{ /* Cols. 2 and 3 */ 
	width:100%;height:10mm;
	line-height:1.5;
	padding:2px;
	text-align:left;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	float:left; clear: none;
  }
  
  .sty1099NECLeftCell { /* Filer Info cell */
	min-height:10.5mm;
	width:100%;
	padding-left:3px;
	padding-right:2px;
	padding-top:2px;
	border-style:solid;
	border-color:black;
	border-width:0px 0px 1px 1px;
	float:left; clear:none;
  }
  
  .sty1099NECRightCell { 
    width:27.8mm;
    height:auto;
    text-align:right;
    padding-left:2px;
    float:left;clear:none;
  }
	

  </xsl:template>

</xsl:stylesheet>