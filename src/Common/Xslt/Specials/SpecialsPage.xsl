<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="SpecialsPageCategories.xsl"/>
	<xsl:import href="SpecialsPageProducts.xsl"/>
	<xsl:import href="../AdPod.xsl"/>
	<xsl:output method="html"/>
	
		<!--========================================================================================== -->
	
	<xsl:template match="/" name="AdPodMaster">
		<xsl:apply-templates select="//ExternalAds">
			<xsl:with-param name="Tile" select="'9'"/>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template name="AdPod" match="ExternalAds">
		<xsl:param name="Tile"/>
		<xsl:param name="Request" select="AdPods/AdPod[Tile=$Tile]/Request"/>
		<xsl:param name="Zone" select="AdPods/AdPod[Tile=$Tile]/Zone"/>
		<xsl:param name="UnitName" select="AdPods/AdPod[Tile=$Tile]/UnitName"/>
		<xsl:param name="UnitNameRoot" select="AdPods/AdPod[Tile=$Tile]/UnitNameRoot"/>
		<xsl:param name="Departments" select="AdPods/AdPod[Tile=$Tile]/Departments"/>
		<xsl:param name="BrandName" select="AdPods/AdPod[Tile=$Tile]/BrandName"/>
		<xsl:param name="PageName" select="AdPods/AdPod[Tile=$Tile]/PageName"/>
		<xsl:variable name="sep" select='"&apos;,&apos;"'/>
		<xsl:variable name="apos" select='"&apos;"'/>
		<xsl:if test="$Request">
			<div id="brxLeaderboardSmall"></div>
		</xsl:if>
	</xsl:template>
	
<!--========================================================================================== -->

	<xsl:template match="/">
		<div id="Specials" class="ProductDisplayPage">
			<script type="text/javascript" src="/Assets/Common/Js/Specials/Specials.js" />
			<script type="text/javascript" src="/Assets/Common/Js/Comments/CommentService.js" />
			<script type="text/javascript" src="/Assets/Common/Js/Product/ProductService.js" />
			<script type="text/javascript" src="/Assets/Common/Js/Product/ProductUtilities.js" />	
			
			<script type="text/javascript">
			<![CDATA[

				function UnwrapResponse(response) {
				
					var responseValue = '';

					if (response.responseXML.firstChild.textContent) {
				        responseValue = response.responseXML.firstChild.textContent;
				    }
				    else if (response.responseXML.documentElement.firstChild.nodeValue) {
				        responseValue = response.responseXML.documentElement.firstChild.nodeValue;
				    }
				    else {
				        responseValue = response.responseJSON.d;
				    }
					
					return responseValue;
				}
				
				function UpdateDepartment()
				{
					var requestArgs = GSNContext.RequestArguments;
					var categoryID = 0;

					GetCategoriesByParentID(document.URL, requestArgs, categoryID, SetDepartment, HandleFailure);
				}

				function UpdateAisles()
				{
					$('UpdateProgress1').style.display = 'block';

					var requestArgs = GSNContext.RequestArguments;
					var categoryID = $('lstDepartments').value;
				
					GetCategoriesByParentID(document.URL, requestArgs, categoryID, SetAisles, HandleFailure);
				}

				function UpdateCategories()
				{
					$('UpdateProgress1').style.display = 'block';

					var requestArgs = GSNContext.RequestArguments;
					var categoryID = $('lstAisles').value;
				
					GetCategoriesByParentID(document.URL, requestArgs, categoryID, SetCategory, HandleFailure);
				}

				function UpdateGrid()
				{
					$('UpdateProgress1').style.display = 'block';

					var requestArgs = GSNContext.RequestArguments;
					var categoryID = $('lstCategory').value;

					GetGenericProductsByCategoryID(document.URL, requestArgs, categoryID, SetGrid, HandleFailure)
				}

				function DisplayMostPopular() {

					$('UpdateProgress1').style.display = 'block';

					var requestArgs = GSNContext.RequestArguments;

					GetMostPopularGenericProducts(document.URL, requestArgs, SetGrid, HandleFailure)
				}

				function SetDepartment(departmentsHTML)
				{
					$('UpdateProgress1').style.display = 'none';

					var responseValue = UnwrapResponse(departmentsHTML);
					SetList($('lstDepartments'), responseValue);
				
					$('lstAisles').innerHTML = '';
					$('lstCategory').innerHTML = '';

					if ($('lstDepartments').length == 1)
					{
						$('lstDepartments').selectedIndex = 0;
						
						UpdateAisles();
					}
					else {
						try {
							refreshAdPods();
						} 
						catch (e) {}
					}
				}

				function SetAisles(departmentsHTML)
				{
					$('UpdateProgress1').style.display = 'none';

					var responseValue = UnwrapResponse(departmentsHTML);
					SetList($('lstAisles'), responseValue);

					$('lstCategory').innerHTML = '';

					if ($('lstAisles').length == 1)
					{
						$('lstAisles').selectedIndex = 0;

						UpdateCategories();
					}
					else {
						try {
							refreshAdPods();
						} 
						catch (e) {}
					}
				}

				function SetCategory(departmentsHTML)
				{
					$('UpdateProgress1').style.display = 'none';

					var responseValue = UnwrapResponse(departmentsHTML);
					SetList($('lstCategory'), responseValue);

					if ($('lstCategory').length == 1)
					{
						$('lstCategory').selectedIndex = 0;
						UpdateGrid();
					}
					else {
						try {
							refreshAdPods();
						} 
						catch (e) {}
					}
				}

				function SetGrid(gridHTML)
				{
					$('UpdateProgress1').style.display = 'none';

					var responseValue = UnwrapResponse(gridHTML);
					$('LineItem').innerHTML = responseValue;
					
					try {
						refreshAdPods();
					} 
					catch (e) {}
				}

				function SetList(list, newItems)
				{
					if(document.all)
					{
						// this is a work around for an ie bug with selects and innerHTML
						var firstItemEnd = newItems.indexOf('>', 0);
						var secondItemEnd = newItems.indexOf('>', firstItemEnd + 1);

						newItems = newItems.substring(0, secondItemEnd + 1) + newItems;

						list.innerHTML = newItems;

						list.outerHTML = list.outerHTML;

					}
					else
					{
						list.innerHTML = newItems;
					}
				}

				function HandleFailure() {
					
					$('UpdateProgress1').style.display = 'none';
				}
			]]>
			</script>
			<xsl:call-template name="PageHeading" />
			<xsl:if test="ExpressLane/ArrayOfStaticContent/StaticContent">
				<div class="StaticContent">
					<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
						<xsl:value-of select="Description" disable-output-escaping="yes" />
					</xsl:for-each>
				</div>
			</xsl:if>
			<div id="ListBoxes">
				<div id="Department" class="DepartmentAisleCategory">
					<h3>Department</h3>
					<select id="lstDepartments" size="4" class="CategoryList" onchange="UpdateAisles()">
						<xsl:for-each select="//ArrayOfCategory/Category[string-length(ParentCategoryID) &lt; 1]">
							<xsl:sort select="CategoryName" data-type="text" />
							<xsl:call-template name="CategorySelect" />
						</xsl:for-each>
					</select>
				</div>
				<div id="InBetween1">&gt;</div>
				<div id="Aisles" class="DepartmentAisleCategory">
					<h3>Aisle</h3>
					<select id="lstAisles" size="4" class="CategoryList" onchange="UpdateCategories()">
					</select>
				</div>
				<div id="InBetween2">&gt;</div>
				<div id="Category" class="DepartmentAisleCategory">
					<h3>Category</h3>
					<select id="lstCategory" size="4" class="CategoryList" onchange="UpdateGrid()">
					</select>
				</div>
			</div>
			<div id="UpdateProgress1" style="display: none;">
				<div id="ProcessingPanel">
					<img src="../Assets/Common/Images/Wait.gif" alt="Wait"/>Processing...</div>
			</div>
			<div id="LineItem" class="LineItem">
				<xsl:call-template name="SpecialsPageProducts" />
			</div>
		</div>
	</xsl:template>
	
	<!-- ========================================================================================== -->

	<xsl:template name="PageHeading">
	<xsl:call-template name="AdPodMaster"></xsl:call-template>
		<xsl:variable name="PageHeaderText">
			<xsl:choose>
				<xsl:when test="string-length(//Setting[Name='SpecialsPageTitle']/Value) &gt; 0">
					<xsl:value-of select="//Setting[Name='SpecialsPageTitle']/Value"/>
				</xsl:when>
				<xsl:otherwise>In-Store Specials</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>		
		<xsl:variable name="PageHeaderDescription" select="'Browse items on sale by department.'" />
		
		<h2 class="pageHeader"><xsl:value-of select="$PageHeaderText" />
			<span><xsl:value-of select="$PageHeaderDescription" /></span>
		</h2>
	</xsl:template>
	
</xsl:stylesheet>