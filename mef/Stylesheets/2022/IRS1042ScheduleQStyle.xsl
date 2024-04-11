<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS1042ScheduleQStyle">

  .sty1042SQDotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty1042SQAmountBox{ /* Small Amount Box */ 
	width:29mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-right:2px;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty1042SQHeaderCell { /* Filer Info cell */
	height:7.5mm;
	padding-left:4px;
	padding-right:2px;
	padding-top:2px;
	border-style:solid;
	border-color:black;
	border-width:0px 0px 0px 0px;
	float:left; clear:none;
  }
	

  </xsl:template>

</xsl:stylesheet>