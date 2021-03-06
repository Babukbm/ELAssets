<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
	<!-- Last Updated: 11/25/2008 12:34pm -->
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="Expires" content="-1"/>
    <title>Landing Page</title>
	<!-- <link rel="stylesheet" type="text/css">
		<xsl:attribute name="href">##root##/<xsl:value-of select="LandingPage/Stylesheet" /></xsl:attribute>
	</link> -->
    <style>
    		@import url(##root##/<xsl:value-of select="LandingPage/Stylesheet" />);
    </style>
    <script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"></script>
    <script type="text/javascript" src="/Assets/Common/Js/AddToList.js"></script>
    <script type="text/javascript">
			//<![CDATA[
			function swapImage(imageID,imageFile){
			var img = document.getElementById(imageID);
			img.src = imageFile;
			}

			var arVersion = navigator.appVersion.split("MSIE")
			var version = parseFloat(arVersion[1])

			if ((version >= 5.5) && (document.body.filters)) 
			{
			for(var i=0; i<document.images.length; i++)
			{
			var img = document.images[i]
			var imgName = img.src.toUpperCase()
			if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
			{
			var imgID = (img.id) ? "id='" + img.id + "' " : ""
			var imgClass = (img.className) ? "class='" + img.className + "' " : ""
			var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
			var imgStyle = "display:inline-block;" + img.style.cssText 
			if (img.align == "left") imgStyle = "float:left;" + imgStyle
			if (img.align == "right") imgStyle = "float:right;" + imgStyle
			if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
			var strNewHTML = "<span " + imgID + imgClass + imgTitle
			+ " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
			+ "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
			+ "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
			img.outerHTML = strNewHTML
			i = i-1
			}
			}
			}

			//]]>
		</script>
    </head>
    <body>
    <div id="Container">
      <div class="Header">
        <div class="Logo">
        	<img class="Logo" alt="">
        		<xsl:attribute name="src">##root##/<xsl:value-of select="LandingPage/ImagePath" /><xsl:value-of select="LandingPage/Logo" /></xsl:attribute>
        	</img>
        </div>
      </div>
      <div id="Main">
		<div class="PromoHeader">
			<p>Products shown may not be available in all stores.</p>
		</div>
        <xsl:for-each select="LandingPage/Categories/Category">
          <xsl:sort select="Sort" />
		  <xsl:variable name="CatID" select="CategoryID" />
          <div class="Category">
            <table class="Category" cellpadding="0" cellspacing="10">
            <tr>
            	<td colspan="2">
            		<h2 class="CategoryHeading"><xsl:value-of select="Name" /></h2>
                </td>
            </tr>
              <tr>
                <td class="CategoryImage">
                	<img class="CategoryImage" alt="">
                		<xsl:attribute name="src">##root##/<xsl:value-of select="ancestor::LandingPage/child::ImagePath" /><xsl:value-of select="Image" /></xsl:attribute>
                	</img>
                </td>
                <td class="ProductList" align="top">
                	<table class="ProductList">
                	<xsl:for-each select="ancestor::LandingPage/child::ProductList/child::Product[./CategoryID = $CatID]">
                   <tr>
                   		<td valign="top">
                			<a class="ListAdd">
                  				<xsl:attribute name="onmouseover">swapImage("AddButton<xsl:value-of select='Sort'/>","##root##/<xsl:value-of select="ancestor::LandingPage/child::ImagePath" /><xsl:value-of select="ancestor::LandingPage/child::Buttons/child::OverState" />");</xsl:attribute>
                  				<xsl:attribute name="onmouseout">swapImage("AddButton<xsl:value-of select='Sort'/>","##root##/<xsl:value-of select="ancestor::LandingPage/child::ImagePath" /><xsl:value-of select="ancestor::LandingPage/child::Buttons/child::OffState" />");</xsl:attribute>
                  				<xsl:attribute name="href">javascript:clickThru('%c','<xsl:value-of select="ancestor::LandingPage/child::DepartmentID"/>','<xsl:value-of select="ancestor::LandingPage/child::Brand"/>&#160;<xsl:value-of select="ancestor::LandingPage/child::Categories/child::Category[./CategoryID = $CatID]/child::Name" />','- <xsl:value-of select="Name" />','<xsl:value-of select="substring(UPC,0,6)" />','1','<xsl:value-of select="DisplaySize" />','','','','','206299728-27636142-<xsl:value-of select="UPC" />');</xsl:attribute>
                  			<img alt="Add to List" class="AddButton">
                  				<xsl:attribute name="id">AddButton<xsl:value-of select="Sort" /></xsl:attribute>
                  				<xsl:attribute name="src">##root##/<xsl:value-of select="ancestor::LandingPage/child::ImagePath" /><xsl:value-of select="ancestor::LandingPage/child::Buttons/child::OffState" /></xsl:attribute>
                  			</img>
                   			</a>
                        </td>
                        <td valign="top">
                        	<span class="ProductName"><xsl:value-of select="Name" /><text>&#160;</text><xsl:value-of select="DisplaySize" /><xsl:if test="Sodium = 'true'">&#160;**</xsl:if></span>
                        </td>
					</tr>
                    </xsl:for-each>
                    </table>
              	</td>
              </tr>
            </table>
          </div>
        </xsl:for-each>
		<div class="PromoFooter">
			<p>** products with > 0.5g Sodium/Serving</p>
		</div>
      </div>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>