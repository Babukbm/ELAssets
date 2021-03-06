<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/"><style>
    		@import url(<xsl:value-of select="LandingPage/Stylesheet" />);
    	</style>
  <xsl:variable name="ImagePath" select="//LandingPage/ImagePath" />
    	
		<script type="text/javascript" src="/Assets/Common/Js/ShoppingList/ShoppingList.js"></script>
		<script type="text/javascript" src="/Assets/Common/Js/AddToList.js"></script>
    	<script type="text/javascript" src="/Assets/Common/Js/AdMasterFunctions.js"></script>  	
    <div id="PromoContainer">
		<div class="PromoHeader">
			<xsl:if test="LandingPage/Logo != ''">
				<img alt="" class="PromoLogoGraphic">
					<xsl:attribute name="src"><xsl:value-of select="$ImagePath" /><xsl:value-of select="LandingPage/Logo" /></xsl:attribute>
				</img>
			</xsl:if>
			<xsl:if test="LandingPage/HeaderGraphic != ''">
			<img alt="" class="PromoHeaderGraphic">
			<xsl:attribute name="src">
				<xsl:value-of select="$ImagePath" /><xsl:value-of select="LandingPage/HeaderGraphic" />
			</xsl:attribute>
			</img>
			</xsl:if>
			<p><xsl:value-of select="LandingPage/HeaderText" disable-output-escaping="yes" /></p>
		</div>
        <xsl:for-each select="//LandingPage/Categories/Category">
          <xsl:sort select="Sort" />
		  <xsl:variable name="CatID" select="CategoryID" />
          <div class="CategoryDiv">
		  	<xsl:if test="Image != ''">
			<div class="CategoryImage">
          		<img>
		  			<xsl:attribute name="src"><xsl:value-of select="$ImagePath" /><xsl:value-of select="Image" /></xsl:attribute>
		  		</img>
			</div>
		  	</xsl:if>
			<div class="CategoryDetails">
          		<div class="ProductList">
					<xsl:for-each select="//Product[CategoryID = $CatID]">	
						<xsl:call-template name="ProductRow">
							<xsl:with-param name="ImagePath" select="$ImagePath"/>
						</xsl:call-template>
          			</xsl:for-each>
				</div>
                <p><xsl:value-of select="Description" disable-output-escaping="yes" /></p>
			</div>                     
          </div>
        </xsl:for-each>
	</div>
  </xsl:template>
  <xsl:template name="ProductRow" match="Product">
  <xsl:param name="ImagePath"/>
  	<div class="ProductRow">
	<xsl:if test="HasImage = 'true'">
    	<img>
        	<xsl:attribute name="src"><xsl:value-of select="$ImagePath" /><xsl:value-of select="UPC" />.jpg</xsl:attribute>
        </img>
	</xsl:if>
        <a class="button">
		<xsl:attribute name="href">javascript:clickThru('%c','<xsl:value-of select="ancestor::LandingPage/child::DepartmentID"/>','<xsl:value-of select="ancestor::LandingPage/child::Brand"/>','- <xsl:value-of select="Name" />','<xsl:value-of select="substring(UPC,0,6)" />','1','<xsl:value-of select="DisplaySize" />','','','','','<xsl:value-of select="concat(//AdID,'-',//UPC,'-')" /><xsl:value-of select="UPC" />');</xsl:attribute>
        	<span><xsl:value-of select="//ButtonSelect" disable-output-escaping="yes" /></span>
        </a>
        <span class="ProductName"><xsl:value-of select="Name" />&#160;<xsl:value-of select="DisplaySize" /></span>
    </div>
  </xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="DuncanHines\DuncanHines.xml" htmlbaseurl="" outputurl="" processortype="msxmldotnet2" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator=""/>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->