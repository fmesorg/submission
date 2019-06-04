{**
* header.tpl
*
* Copyright (c) 2000-2013 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* Common site header.
*}

{strip}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{if $pageCrumbTitle}
  {translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}
{elseif !$pageCrumbTitleTranslated}
  {assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}
{/if}
{/strip}
{if $is_contact_page}
{assign var="pageTitleTranslated" value="Contact Us"}
{assign var="pageCrumbTitleTranslated" value="Contact Us"}
{/if}
<!DOCTYPE html>
<html>
  <head>
    <!-- Head start's from here (Note: This is the head section. Directly copy and paste this code)-->
    <!--[if IE]>
		<link rel="stylesheet" type="text/css" href="{$baseUrl}/styles/ie.css" />
	<![endif]-->
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   

    <meta property="og:image" content="{$baseUrl}/public/journals/1/homeHeaderTitleImage_en_US.jpg">

    <meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
    <title>{$pageTitleTranslated}</title>
    <meta name="description" content="{$metaSearchDescription|escape}" />
    <meta name="keywords" content="{$metaSearchKeywords|escape}" />
    <meta name="generator" content="{$applicationName} {$currentVersionString|escape}" />
    {$metaCustomHeaders}
    {*{if $displayFavicon}
      <link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />
    {/if}*}
    {*Added favicon*}
    <link rel="shortcut icon" href="/favicon.png" type="image/png">
    <link rel="shortcut icon" type="image/png" href="http://ijme.in/favicon.png" />
    {*#favicon*}
    <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
    <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
    <link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />
    <link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
    
      
    <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>-->
    <script src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery-1.11.0.min.js"></script>
    <!--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>-->
    <script src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
    {literal}
    <style type="text/css">
      #owl-demo .item {
	margin: 3px;
      }
      #owl-demo .item img {	
	display: block;	
	width: 100%;	
	height: auto;	
      }      
      .nav-btn {
	position: relative;	
	top: -98px;	
      }      
      .next {
	float: right;	
	padding-right: 15px;	
      }      
      .item img {
	border: 1px solid #DDDDDD;	
      }      
      .owl-item{
	text-align: center !important;
      }
      .owl-item .item{
	text-align: center;
      }
      .owl-carousel{
	width: 100% !important;
      }
	  .i-header-banner{text-align: right}
    </style>
    {/literal}
    <link rel="stylesheet" href="{$baseUrl}/pages/custom-pages/carousel/css/owl.theme.css">
    <link rel="stylesheet" href="{$baseUrl}/pages/custom-pages/carousel/css/owl.carousel.css">
    <script type="text/javascript" src="{$baseUrl}/pages/custom-pages/carousel/js/owl.carousel.min.js"></script>
    <script type="text/javascript">
      {literal}
      jQuery(document).ready(function($) {
	      var owl = $("#carousel");
	      owl.owlCarousel({
		  autoPlay : 3000, //Set AutoPlay to 3 seconds
		  items : 3,
	  	  itemsDesktop : [1500, 3],
		  itemsDesktopSmall : [980, 3],
		  itemsTablet : [550, 3],
		  itemsMobile : [400, 2],
		  itemsMobileSmall : [310, 1],
		  pagination : false
	      });

      });
      {/literal}
    </script>
    
      <!-- Bootstrap -->
    <!--commented below line-->
    <!--<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>-->
    <script src="{$baseUrl}/lib/pkp/js/bootstrap/bootstrap.min.js"></script>
    <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/bootstrap/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/bootstrap/bootstrap-theme.min.css" type="text/css" />
    <!--<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-tooltip.js"></script>

    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">-->
      {call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
      {call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
      {if $leftSidebarCode || $rightSidebarCode}
      <link rel="stylesheet" href="{$baseUrl}/styles/sidebar.css" type="text/css" />
      {/if}
      {if $leftSidebarCode}
      <link rel="stylesheet" href="{$baseUrl}/styles/leftSidebar.css" type="text/css" />
      {/if}
      {if $rightSidebarCode}
      <link rel="stylesheet" href="{$baseUrl}/styles/rightSidebar.css" type="text/css" />
      {/if}
      {if $leftSidebarCode && $rightSidebarCode}
      <link rel="stylesheet" href="{$baseUrl}/styles/bothSidebars.css" type="text/css" />
      {/if}

      {foreach from=$stylesheets item=cssUrl}
      <link rel="stylesheet" href="{$cssUrl}" type="text/css" />
      {/foreach}

        <!-- Default global locale keys for JavaScript -->
      {include file="common/jsLocaleKeys.tpl" }

        <!-- Compiled scripts -->
      {if $useMinifiedJavaScript}
      <script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
      {else}
      {include file="common/minifiedScripts.tpl"}
      {/if}

        <!-- Add javascript required for font sizer -->
      <script type="text/javascript">
{literal}
<!--
$(function(){
fontSize("#sizer", "body", 9, 16, 32, "{/literal}{$basePath|escape:"javascript"}{literal}"); // Initialize the font sizer
});
// -->
        {/literal}
        </script>

        <!-- Form validation -->
        <script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/validate/jquery.validate.js"></script>
        <script type="text/javascript">
<!--
// initialise plugins
          {literal}
$(function(){
jqueryValidatorI18n("{/literal}{$baseUrl}{literal}", "{/literal}{$currentLocale}{literal}"); // include the appropriate validation localization
          {/literal}{if $validateId}{literal}
$("form[name={/literal}{$validateId}{literal}]").validate({
errorClass: "error",
highlight: function(element, errorClass) {
$(element).parent().parent().addClass(errorClass);
},
unhighlight: function(element, errorClass) {
$(element).parent().parent().removeClass(errorClass);
}
});
          {/literal}{/if}{literal}//$(".tagit").live('click', function() {//
//$(this).find('input').focus();//
//});
});
// -->
          {/literal}
        </script>

        {if $hasSystemNotifications}
          {url|assign:fetchNotificationUrl page='notification' op='fetchNotification' escape=false}
          <script type="text/javascript">
$(function(){ldelim}
$.get('{$fetchNotificationUrl}', null,
function(data){ldelim}
var notifications = data.content;
var i, l;
if (notifications && notifications.general) {ldelim}
$.each(notifications.general, function(notificationLevel, notificationList) {ldelim}
$.each(notificationList, function(notificationId, notification) {ldelim}
console.log(notification);
$.pnotify(notification);
            {rdelim});
            {rdelim});
            {rdelim}
            {rdelim}, 'json');
            {rdelim});
          </script>
        {/if}{* hasSystemNotifications *}

          {$additionalHeadData}
	  <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/bootstrap/bootstrap-theme.min.css" type="text/css" />	  <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/bootstrap/custom.css" type="text/css" />
	  
	  {literal}
	  <script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	  
		ga('create', 'UA-42369332-1', 'auto');
		ga('send', 'pageview');
	  
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-42369332-1']);
	  _gaq.push(['_trackPageview']);
	  
	  </script>
	  {/literal}
	  
        </head>
        <body>
          <div class="container last-9">
            <div class="last-8">
	      <div class="row">
		<div class="col-md-5 i-header-logo">
		  {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
		    <!--<a href="{$baseUrl}/index.php/ijme/index"><img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} /></a>-->
		    <a href="{$wp_url}"><img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} /></a>
		  {/if}
		  {if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
		    <!--<a href="{$baseUrl}/index.php/ijme/index"><img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} /></a>-->
		    <a href="{$wp_url}"><img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} /></a>
		  {elseif $displayPageHeaderTitle}
		    {$displayPageHeaderTitle}
		  {elseif $alternatePageHeader}
		    {$alternatePageHeader}
		  {elseif $siteTitle}
		    {$siteTitle}
		  {else}
		    {$applicationName}
		  {/if}
		</div>
		<div class="col-md-7 i-header-banner">
{*
{literal}
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-2011095144903626"
     data-ad-slot="2507395191"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
{/literal}
*}
		</div>
	      </div>  
	      {include file="common/navbar.tpl"}
              <div class="row last-7">
                <div class="col-md-12 last-6">
                  <div id="body last-5">
                    <div class="row last-4">
                      
                      <div class="col-md-9 main-content last-3">
                        <!--start bootstrap span-->
                        <div id="main" class="last-2">
			  {if !$isHomePage}
                          {include file="common/breadcrumbs.tpl"}			  
                          <h4>{$pageTitleTranslated}</h4>
			  {/if}
                        {if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
                        {if $pageSubtitleTranslated}
                          <h3>{$pageSubtitleTranslated}</h3>
                        {/if}
                        <div id="content">

