<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS1099INTStyle">

  .sty1099INTLeftNumBoxSD{ /*  */
	width:3.5mm;height:auto;
	font-weight:bold;
	padding-left:0.5mm;
  }
  
  .sty1099INTLeftNumBox{ /*  */
	width:3.5mm;height:auto;
	font-weight:bold;
	padding-left:0mm;
  }
  
  .sty1099INTAmountSpan {
	text-align:right;
	width:30mm;
	padding-right:2px;
	float:right;clear:none;
  }
  
  .sty1099INTNumberedBox{ /* Cols. 2 and 3 */ 
	width:36mm;height:9mm;
	line-height:1.4;
	padding:2px;
	text-align:left;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	float:left; clear: none;
  }
  
  .sty1099INTLeftCell { /* Filer Info cell */
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
  
  .sty1099INTRightCell { 
    width:27.8mm;
    height:auto;
    text-align:right;
    padding-left:2px;
    float:left;clear:none;
  }
	

  </xsl:template>

</xsl:stylesheet>