<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="Order.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="CheckOutListID" select="//ConsumerOrderHistory/Orders/ConsumerOrder[position() = 1]/CheckOutListID"/>
		<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js"/>
		<script type="text/javascript" src="/Assets/Common/Js/PreviousOrders/OrderHistory.js"/>
		<xsl:variable name="PageHeaderTitle">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='PreviousOrdersTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='PreviousOrdersTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>Previous Orders</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="PageHeaderDescription">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='PreviousOrdersSubTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='PreviousOrdersSubTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>All items from completed orders. Click date to view order.</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="title">
			<h2 class="pageHeader">
				<xsl:value-of select="$PageHeaderTitle"/>
				<span>
					<xsl:value-of select="$PageHeaderDescription"/>
				</span>
			</h2>
		</div>
		<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
			<div class="StaticContent">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:sort select="SortBy" data-type="number"/>
					<xsl:value-of select="Description" disable-output-escaping="yes"/>
				</xsl:for-each>
			</div>
		</xsl:if>
		<div class="OrderDates">
			<xsl:for-each select="//ConsumerOrderHistory/Orders/ConsumerOrder">
				<xsl:call-template name="OrderListItem">
					<xsl:with-param name="CheckOutListID" select="$CheckOutListID"/>
				</xsl:call-template>
			</xsl:for-each>
		</div>
		<div id="OrderItems">
			<xsl:choose>
				<xsl:when test="//ConsumerOrderHistory/Orders/ConsumerOrder">
					<xsl:for-each select="//ConsumerOrderHistory/Orders/ConsumerOrder[CheckOutListID = $CheckOutListID]">
						<xsl:call-template name="OrderDisplay"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<h5>At this time, there are no previous orders available.<br/>
							Please check again later.</h5>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div id="productdescription"/>
	</xsl:template>
	<xsl:template name="OrderListItem" match="ConsumerOrder">
		<xsl:param name="CheckOutListID"/>
		<h3>
			<xsl:attribute name="style">cursor:pointer</xsl:attribute>
			<xsl:attribute name="onclick">
				<xsl:value-of select="concat('javascript:DisplayOrder(this, ', CheckOutListID, ');')"/>
			</xsl:attribute>
			<xsl:if test="CheckOutListID = $CheckOutListID">
				<xsl:attribute name="class">selected</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="Title"/>
		</h3>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\124\XmlData\124-PageTypeId-137-OGSPreviousOrders.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0"
		          profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no"
		          validator="internal" customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->
