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

<!DOCTYPE html>

<html>

  <head>

    <!-- Head start's from here (Note: This is the head section. Directly copy and paste this code)-->

    <!--[if IE]>

		<link rel="stylesheet" type="text/css" href="{$baseUrl}/styles/ie.css" />

	<![endif]-->

    


    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   



    



    <meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />

    <title>{$article->getLocalizedTitle()|strip_tags|escape} | {$article->getFirstAuthor(true)|strip_tags|escape} | {$currentJournal->getLocalizedTitle()|strip_tags|escape}</title>

    <meta name="description" content="{$article->getLocalizedTitle()|strip_tags|escape}" />
	{if $article->getLocalizedSubject()}
        <meta name="keywords" content="{$article->getLocalizedSubject()|escape}" />
	{/if}

    

    {$metaCustomHeaders}

    {if $displayFavicon}

      <link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />

    {/if}

    <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />

    <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
    
    <link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />

    <link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />

    <link rel="stylesheet" href="{$baseUrl}/styles/articleView.css" type="text/css" />
	{if $journalRt && $journalRt->getEnabled()}
	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/rtEmbedded.css" type="text/css" />
	{/if}
      
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

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



          {/literal}

        </script>



        



          {$additionalHeadData}
	  <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/bootstrap/bootstrap-theme.min.css" type="text/css" />
	  <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/bootstrap/custom.css" type="text/css" />
	  
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
	      <div class="row header">
		<div class="col-md-5 i-header-logo">
		  {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
		    <a href="{$baseUrl}/index.php/ijme/index"><img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} /></a>
		  {/if}
		  {if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
		    <a href="{$baseUrl}/index.php/ijme/index"><img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} /></a>
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
		  <!-- <a href="http://ijme.in/~ijmein/index.php/ijme/announcement/view/4"><img src="{$baseUrl}/images/theme/top_banner.jpg"></a> -->
      
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
			
			
			
			
			{if $isSingleArticeView}
				<div id="breadcrumb">
					<a href="{url page="index"}" target="_parent">{translate key="navigation.home"}</a> &gt;
					{if $issue}<a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" target="_parent">{$issue->getIssueIdentification(false,true)|escape}</a> &gt;{/if}
					<a href="{url page="article" op="view" path=$articleId|to_array:$galleyId}" class="current" target="_parent">{$article->getFirstAuthor(true)|escape}</a>
				</div>
			{else}			
                          {include file="common/breadcrumbs.tpl"}
			{/if}
			
			
			{if $sharingEnabled}
				<!-- start AddThis -->
				{if isset($sharingDropDownMenu)}
					{if isset($sharingUserName)}
					<script type="text/javascript">
					    var addthis_pub = '{$sharingUserName}';
					</script>
					{/if}                                   
					<div class="addthis_container">
					    <a href="http://www.addthis.com/bookmark.php"
					    onmouseover="return addthis_open(this, '', '{$sharingArticleURL|escape:"javascript"}', '{$sharingArticleTitle|escape:"javascript"}')"
					    onmouseout="addthis_close()" onclick="return addthis_sendto()"> <img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" /> </a>
					    <script type="text/javascript" src="http://s7.addthis.com/js/200/addthis_widget.js"></script>
					</div>
				{else}
					<a href="http://www.addthis.com/bookmark.php"
					onclick="window.open('http://www.addthis.com/bookmark.php?pub={$sharingUserName|escape:"url"}&amp;url={$sharingRequestURL|escape:"url"}&amp;title={$sharingArticleTitle|escape:"url"}', 'addthis',
					'scrollbars=yes,menubar=no,width=620,height=520,resizable=yes,toolbar=no,location=no,status=no');
					return false;"
					title="Bookmark using any bookmark manager!" target="_blank"> <img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" /> </a>
				{/if}
				<!-- end AddThis -->
			{/if}
                        
			  <!--<h4>{$pageTitleTranslated}</h4>-->
                         
			 {if $onlineFirst}
			 <h4 style='margin-bottom: 0;'>Online First</h4>
			 {else}
				{if $coverPagePath || $pageSubtitle}
				<div class="row toc-top">
				<div class="col-md-4">
				 {if $coverPagePath}
				  <div id="issueCoverImage">
				   <img src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $coverPageAltText != ''} alt="{$coverPageAltText|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if}{if $width} width="{$width|escape}"{/if}{if $height} height="{$height|escape}"{/if}/>
				  </div>
				 {/if}
				</div>
				<div class="col-md-8 toc-titles">			  
				 {if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
				 {if $pageSubtitleTranslated}
				   <h3>{$pageSubtitleTranslated}Online first</h3>
				 {/if}
				</div>
				</div>
				{/if}
			 {/if}
			 
			 
			 
                        <div id="content">



