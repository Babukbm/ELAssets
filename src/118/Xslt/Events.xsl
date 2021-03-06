<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">	 
		<script id="jsImage" type="text/javascript" language="javascript">

				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:if test="position()=last()">
						<![CDATA[var images = new Array(]]><xsl:value-of select="last()"/><![CDATA[);]]>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<![CDATA[images[]]><xsl:value-of select="position()"/><![CDATA[-1] = ']]><xsl:value-of select="Image"/><![CDATA[';]]>
				</xsl:for-each>
				<xsl:comment>
					<![CDATA[

	    function showImage(page)
	    {
			page = page-1;
	        var img = document.getElementById('Image');
	        img.src = images[page];
	    }
		]]>
				</xsl:comment>

			</script>
		<div id="events">
			<h3>Store News &amp; Events</h3>
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<a>
					<xsl:attribute name="href">
							javascript:showImage(<xsl:value-of select="SortBy"/>);
					</xsl:attribute>
					<xsl:value-of select="SortBy"/>
				</a>
				<xsl:if test="position()!=last()">
					|
				</xsl:if>
			</xsl:for-each>

			<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent/Image">
				<img id="Image">
					<xsl:attribute name="src">
						<xsl:value-of select="ExpressLane/ArrayOfStaticContent/StaticContent/Image"/>
					</xsl:attribute>
				</img>	
			</xsl:if>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->