<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS8915FStyle">

  .sty8915FDotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty8915FHeaderBox {
    width:30mm;min-height:12mm;
    padding-top:0.5mm;
		padding-bottom:0.5mm;
		padding-right:0.2mm;
		padding-left:0.2mm;
		text-align:center;
		border-style:solid;border-color:black;
		border-left-width:1px;border-right-width: 0px;border-top-width:1px;border-bottom-width:1px;
		float:left;clear:none;
  }
  
  .sty8915FDescBox {
    width:110mm;height:4mm;
    padding-top:0.5mm;
		padding-bottom:0.5mm;
		padding-right:0.5mm;
		padding-left:0.5mm;
		text-align:left;
		float:left;clear:none;
  }
  
  </xsl:template>

</xsl:stylesheet>