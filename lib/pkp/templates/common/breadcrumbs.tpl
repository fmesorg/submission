{**
 * breadcrumbs.tpl
 *
 * Copyright (c) 2000-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Breadcrumbs
 *
 *}
{if $onlineFirst}
<div id="breadcrumb">
	<a href="#">{translate key="navigation.home"}</a> &gt; <a href="{$baseUrl}/index.php/ijme/issue/current">Online First</a>
</div>
{else}
<div id="breadcrumb">
	<a href="#">{translate key="navigation.home"}</a> &gt;
	{foreach from=$pageHierarchy item=hierarchyLink}
		{* <a href="{$hierarchyLink[0]|escape}" class="hierarchyLink">{if not $hierarchyLink[2]}{translate key=$hierarchyLink[1]}{else}{$hierarchyLink[1]|escape}{/if}</a> &gt; *}
		{if $hierarchyLink[0] eq 'http://z-aksys.net/ijme/index.php/ijme/issue/archive' or $hierarchyLink[0] eq 'http://ijme.in/index.php/ijme/issue/archive'}
			<a href="{$baseUrl}/index.php/ijme/pages/view/archives" class="hierarchyLink">{if not $hierarchyLink[2]}{translate key=$hierarchyLink[1]}{else}{$hierarchyLink[1]|escape}{/if}</a> &gt;
		{else}
			<a href="{$hierarchyLink[0]|escape}" class="hierarchyLink">{if not $hierarchyLink[2]}{translate key=$hierarchyLink[1]}{else}{$hierarchyLink[1]|escape}{/if}</a> &gt;
		{/if}
	{/foreach}
	{* Disable linking to the current page if the request is a post (form) request. Otherwise following the link will lead to a form submission error. *}
	{if $requiresFormRequest}<span class="current">{else}<a href="{$currentUrl|escape}" class="current">{/if}{$pageCrumbTitleTranslated}{if $requiresFormRequest}</span>{else}</a>{/if}
</div>
{/if}

