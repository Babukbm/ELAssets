<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"/>
		<script>
		function changeSrc(newSrc) {
			$('doubleClick').src=newSrc;
		}
		</script>
		<style>
			
			.facebook
			{ 
				height: 41px;
				margin: -50px 545px 0;
				position: absolute;
			}

			.items
			{
				margin: 25px 0;
			}
		
			.promoLP-Item 
			{
				float: left;
				width: 25%;
			}
			
			ul 
			{ 
				list-style-type: none;
			}

			.addBtn
			{
				margin: 6px;
			}

			.s-container
			{
				width: 590px
			}
				
		</style>
			
		<div class="s-container">
			<img src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/bimbo bakeries/arnold/images/arnoldHeader.jpg" />
				<div class="facebook">
					<a href="https://www.facebook.com/#!/ArnoldBreads" target="_blank">
						<img src="http://upload.gsngrocers.com/elvs/Assets/Common/Promotions/bimbo bakeries/arnold/images/fb_logo.png" alt= "facebook"/>
					</a>
				</div>
			<div class="items">
				<ul id="promoLP-container">
					<xsl:for-each select="//ProductGroup/Product">
					<div class="promoLP-Item">
						<xsl:if test="(position() -1) mod 4 = 0">
							<xsl:attribute name="style">clear:left;</xsl:attribute>
						</xsl:if>
						<xsl:if test="string-length(Description) &gt; 0">
							<img class="promoLP-Product" src="{concat(//ImagePath,Image)}" alt="{Description}"/>
							<a href="javascript:void(0)" class="buttonPromoLP">
								<xsl:attribute name="onclick">changeSrc('<xsl:value-of select="ClickCode"/>'); clickThru('%c',<xsl:value-of select="//DepartmentID"/>,'<xsl:value-of select="//Brand"/>','<xsl:value-of select="Description"/>', '<xsl:value-of select="//ManufacturerCode"/>', 1, '','','','','', <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'2')"/>, <xsl:value-of select="concat(//ManufacturerCode,ProductCode,position(),'0')"/>);</xsl:attribute>
								<img class="addBtn" src="{//ButtonImage}" alt="Add To List"/>
							</a>
						</xsl:if>
					</div>
				</xsl:for-each>
				</ul>
				<iframe id="doubleClick" src="" width="1" height="1" style="display:none;"/>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
