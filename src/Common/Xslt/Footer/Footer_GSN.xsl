<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="/Assets/Common/Xslt/SocialMedia/FacebookJsApi.xsl"/>
	<xsl:output method="html"/>
	<xsl:template match="/" name="GSNFooter">
		<div id="GsnFooter">
			<xsl:choose>
				<xsl:when test="ExpressLane/footer/FooterRow">
					<xsl:for-each select="ExpressLane/footer/FooterRow">
						<div class="footerRow">
							<xsl:call-template name="FooterItems"/>
						</div>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="ExpressLane/footer">
						<xsl:call-template name="FooterItems"/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<xsl:call-template name="FacebookJsApi"/>
	</xsl:template>
	<xsl:template name="FooterItems">
		<xsl:for-each select="FooterItem">
			<xsl:choose>
				<xsl:when test="string-length(FooterLink) &gt; 0">
					<a href="{FooterLink}">
						<xsl:if test="string-length(FooterTarget) &gt; 0">
							<xsl:attribute name="target">
								<xsl:value-of select="FooterTarget"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="FooterText"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="FooterText"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position() != last()">
				<span class="footerDivider">|</span>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
