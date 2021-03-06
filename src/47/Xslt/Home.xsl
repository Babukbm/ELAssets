<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="../../Common/Xslt/SlideShowJS.xsl"/>
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
		<script id="jsImage" type="text/javascript" language="javascript">
			<xsl:comment><![CDATA[
     			function changeDIV(hide, show)
        		{
            		var d = new Object();
            		d = document.getElementById(hide);
            		d.style.display = "none";
                       
            		d = document.getElementById(show);
            		d.style.display = "";
        		}
				]]>
			</xsl:comment>
		</script>
		<div id="home" class="main-wrapper">
			<div id="SplashContainer">
				<div id="AdPromo">
					<a href="Shop/WeeklyAd.aspx">
						<h2>Check Out our<br/>Weekly Ads!</h2>
					</a>
					<p>Click on the image below to view<br/>our weekly ads.</p>
					<a href="Shop/WeeklyAd.aspx">
						<xsl:choose>
							<xsl:when test="//CircularPageSummary[CircularTypeID = 1]">
								<img alt="Check Out Our Weekly Ads!">
									<xsl:attribute name="src">
										<xsl:value-of select="//CircularPageSummary[CircularTypeID = 1]/SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:when test="//CircularPageSummary">
								<img alt="Check Out Our Weekly Ads!">
									<xsl:attribute name="src">
										<xsl:value-of select="//CircularPageSummary/SmallImageUrl"/>
									</xsl:attribute>
								</img>
							</xsl:when>
							<xsl:otherwise>
								<div id="circularThumbnail">
									<img alt="Check Out Our Weekly Ads!" src="/Assets/Common/Images/CircularThumb.png"/>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</a>
				</div>
				<xsl:call-template name="SlideShow"></xsl:call-template>
			</div>
			<div id="splashblocks">
				<div id="FeaturedRecipeTeaser">
					<h2>
						<a>
							<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>Recipe of the Day</a>
					</h2>
					<p>We offer a different recipe each day. Try something new tonight!</p>
					<a>
						<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
						<img alt="">
							<xsl:attribute name="src">
								<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeImageURL"/>
							</xsl:attribute>
						</img>
					</a>
					<p>
						<a>
							<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeID"/></xsl:attribute>
							<xsl:value-of select="//FeaturedRecipeList/FeaturedRecipe/RecipeTitle"/>
						</a>
					</p>
				</div>

				<div id="DualContentControlDiv">
					<div id="DualContentControlDivB">
						<a href="/dinner-menu.aspx">
							<img alt="">
								<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/dinner_button.gif</xsl:attribute>
							</img>
						</a>
					</div>
					<br/>
					<div id="DualContentControlDivA">
						<a href="/catering-menu.aspx">
							<img alt="">
								<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/catering_button.jpg</xsl:attribute>
							</img>
						</a>
					</div>
				</div>



				<div id="DualContentControlDiv">
					<div id="DualContentControlDivB">
						<a href="/hot-wing-bar.aspx">
							<img alt="">
								<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/hot_wing_button.jpg</xsl:attribute>
							</img>
						</a>
					</div>
					<br/>
					<div id="DualContentControlDivA">
						<a href="/pizza-menu.aspx">
							<img alt="">
								<xsl:attribute name="src">/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/pizza_button.gif</xsl:attribute>
							</img>
						</a>
					</div>
				</div>


				<div id="MealPlanner">
					<h2>
						<a>
							<xsl:attribute name="href">/Recipes/MealPlannerFull.aspx</xsl:attribute>Meal Planner</a>
					</h2>
					<xsl:for-each select="//MealPlanner[count(. | key('meals-by-date', DisplayDate)[1]) = 1]">
						<xsl:sort select="DisplayOrderDate"/>
						<h3>
							<xsl:value-of select="DisplayDate"/>
						</h3>
						<ul>
							<xsl:for-each select="key('meals-by-date', DisplayDate)">
								<xsl:sort select="RecipeTitle"/>
								<li>
									<a>
										<xsl:attribute name="href">/Recipes/RecipeFull.aspx?RecipeID=<xsl:value-of select="RecipeID"/></xsl:attribute>
										<xsl:value-of select="RecipeTitle"/>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:for-each>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
