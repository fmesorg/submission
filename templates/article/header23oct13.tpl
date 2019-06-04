{**
* templates/article/header.tpl
*
* Copyright (c) 2003-2013 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* Article View -- Header component.
*}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>{$article->getLocalizedTitle()|strip_tags|escape} | {$article->getFirstAuthor(true)|strip_tags|escape} | {$currentJournal->getLocalizedTitle()|strip_tags|escape}</title>
		<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
		<meta name="description" content="{$article->getLocalizedTitle()|strip_tags|escape}" />
		{if $article->getLocalizedSubject()}
		<meta name="keywords" content="{$article->getLocalizedSubject()|escape}" />
		{/if}

		{if $displayFavicon}
		<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />
		{/if}

		{include file="article/dublincore.tpl"}
		{include file="article/googlescholar.tpl"}
		{call_hook name="Templates::Article::Header::Metadata"}

		<!-- Head start's from here (Note: This is the head section. Directly copy and paste this code)-->
		<!-- Google Analytics Code -->
		<script>
			(function(i, s, o, g, r, a, m) {
				i['GoogleAnalyticsObject'] = r;
				i[r] = i[r] ||
				function() {
					(i[r].q = i[r].q || []).push(arguments)
				}, i[r].l = 1 * new Date();
				a = s.createElement(o), m = s.getElementsByTagName(o)[0];
				a.async = 1;
				a.src = g;
				m.parentNode.insertBefore(a, m)
			})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
			ga('create', 'UA-42369332-1', 'ijme.in');
			ga('send', 'pageview');
		</script>

		<!-- Bootstrap -->
		<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://twitter.github.com/bootstrap/assets/js/bootstrap-tooltip.js"></script>
		<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">

		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
		<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />
		<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
		<link rel="stylesheet" href="{$baseUrl}/styles/articleView.css" type="text/css" />
		{if $journalRt && $journalRt->getEnabled()}
		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/rtEmbedded.css" type="text/css" />
		{/if}

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

		<!-- Base Jquery -->
		{if $allowCDN}<script type="text/javascript" src="http://www.google.com/jsapi"></script>
		<script type="text/javascript">
			{ literal
			}
			// Provide a local fallback if the CDN cannot be reached
			if ( typeof google == 'undefined') {
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
				document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
			} else {
				google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
				google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
			} {/literal
			}
		</script>
		{else}
		<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
		{/if}

		<script type="text/javascript">
{literal}
$(function(){
fontSize("#sizer", "body", 9, 16, 32, "{/literal}{$basePath|escape:"javascript"}{literal}"); // Initialize the font sizer
});
{/literal}
		</script>

		<!-- Compiled scripts -->
		{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
		{else}
		{include file="common/minifiedScripts.tpl"}
		{/if}

		{$additionalHeadData}
	</head>
	<body>
		<div class="container">
			<!--start bootstrap container-->
			<div id="container-fluid">

				<!--start bootstrap row-->

				<div id="header">
					<div id="headerTitle">
						<div class="row">
							<div class="span4">
								<!--start bootstrap span-->
								{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)} <img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} /> {/if}
								{if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)} <img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} /> {elseif $displayPageHeaderTitle}
								{$displayPageHeaderTitle}
								{elseif $alternatePageHeader}
								{$alternatePageHeader}
								{elseif $siteTitle}
								{$siteTitle}
								{else}
								{$applicationName}
								{/if}
							</div>
							<div class="span8">
								<div class="ads"><img src="http://216.12.194.36/~ijmein/images/theme/ad_banner.jpg"></div>
							</div>
						</div>
					</div><!--end bootstrap row-->
					<div class="row">
						<div class="span12">
							{include file="common/navbar.tpl"}
						</div>

					</div>

				</div>

				<div class="row">
					<!--start bootstrap row-->
					<div class="span12">
						<!--start bootstrap span-->
						<div id="body">
							<div class="row">
								<!--start bootstrap row-->
								<div class="span3 rightsidebar">
									<!--start bootstrap span-->
									{if $leftSidebarCode || $rightSidebarCode}
									<div id="sidebar">
										{if $leftSidebarCode}
										<div id="leftSidebar">
											{$leftSidebarCode}
										</div>
										{/if}
										{if $rightSidebarCode}
										<div id="rightSidebar">
											{$rightSidebarCode}
										</div>
										{/if}
									</div>
									{/if}
								</div><!--end bootstrap span-->
								<div class="span9">
									<!--start bootstrap span-->
									<div id="main">

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

										<div id="breadcrumb">
											<a href="{url page="index"}" target="_parent">{translate key="navigation.home"}</a> &gt;
											{if $issue}<a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" target="_parent">{$issue->getIssueIdentification(false,true)|escape}</a> &gt;{/if} <a href="{url page="article" op="view" path=$articleId|to_array:$galleyId}" class="current" target="_parent">{$article->getFirstAuthor(true)|escape}</a>
										</div>

										<div id="content">

