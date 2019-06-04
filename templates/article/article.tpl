{**
 * templates/article/article.tpl
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View.
 *}
{if $galley}
	{assign var=pubObject value=$galley}
{else}
	{assign var=pubObject value=$article}
{/if}


{include file="article/header.tpl"}
{*include file="common/header.tpl"*}

{if $galley}
<script type="text/javascript" src="{$baseUrl}/js/author_content.js"></script>
<div class="about-author-content" style="display: none;">
<div class="block" id="articleToolsInContent" style="float: right; border-bottom: 0; border: 1px solid #ddd;">
	

{if $journalRt && $journalRt->getEnabled()}
	
	<h4 class="blockTitle">{translate key="plugins.block.readingTools.articleTools"}</h4>
	{if $journalRt->getAbstract() && $galley && $article->getLocalizedAbstract()}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/abstract.png" class="articleToolIcon" />
			{*<a href="{url page="article" op="view" path=$articleId}" target="_parent">{translate key="article.abstract"}</a><br />*}
			{foreach from=$article->getGalleys() item=galley1 name=galleyList}
				{if $galley1->getGalleyLabel()|escape == 'PDF'}
				<a href="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)|to_array:$galley1->getBestGalleyId($currentJournal)}" class="file" target="_parent">{$galley1->getGalleyLabel()|escape}</a><br/>
				{/if}
			{/foreach}
		</div>
	{/if}
	{if $journalRt->getPrinterFriendly()}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/printArticle.png" class="articleToolIcon" /> <a href="{if !$galley || $galley->isHtmlGalley()}javascript:openRTWindow('{url page="rt" op="printerFriendly" path=$articleId|to_array:$galleyId}');{else}{url page="article" op="download" path=$articleId|to_array:$galleyId}{/if}">{translate key="plugins.block.readingTools.printThisArticle"}</a>
		</div>
	{/if}
	{if $journalRt->getViewMetadata()}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/metadata.png" class="articleToolIcon" /> <a href="javascript:openRTWindow('{url page="rt" op="metadata" path=$articleId|to_array:$galleyId}');">{translate key="rt.viewMetadata"}</a><br />
		</div>
	{/if}
	{if $journalRt->getCaptureCite()}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/citeArticle.png" class="articleToolIcon" /> <a href="javascript:openRTWindow('{url page="rt" op="captureCite" path=$articleId|to_array:$galleyId}');">{translate key="rt.captureCite"}</a><br />
		</div>
	{/if}
	{if $journalRt->getSupplementaryFiles() && is_a($article, 'PublishedArticle') && $article->getSuppFiles()}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/suppFiles.png" class="articleToolIcon" /> <a href="javascript:openRTWindow('{url page="rt" op="suppFiles" path=$articleId|to_array:$galleyId}');">{translate key="rt.suppFiles"}</a><br />
		</div>
	{/if}
	{if $journalRt->getFindingReferences()}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/findingReferences.png" class="articleToolIcon" /> <a href="javascript:openRTWindow('{url page="rt" op="findingReferences" path=$article->getId()|to_array:$galleyId}');">{translate key="rt.findingReferences"}</a>
		</div>
	{/if}
	{if $journalRt->getViewReviewPolicy()}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/editorialPolicies.png" class="articleToolIcon" /> <a href="{url page="about" op="editorialPolicies" anchor="peerReviewProcess"}" target="_parent">{translate key="rt.reviewPolicy"}</a>
		</div>
	{/if}
	{if $journalRt->getEmailOthers()}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/emailArticle.png" class="articleToolIcon" />
			{if $isUserLoggedIn}<a href="javascript:openRTWindow('{url page="rt" op="emailColleague" path=$articleId|to_array:$galleyId}');">{translate key="plugins.block.readingTools.emailThisArticle"}</a>
			{else}{translate key="plugins.block.readingTools.emailThisArticle"} <span style="font-size: 0.8em">({translate key="plugins.block.readingTools.loginRequired"})</span>{/if}
		</div>
	{/if}
	{if $journalRt->getEmailAuthor()}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/emailArticle.png" class="articleToolIcon" />
			{if $isUserLoggedIn}<a href="javascript:openRTWindow('{url page="rt" op="emailAuthor" path=$articleId|to_array:$galleyId}');">{translate key="rt.emailAuthor"}</a>
			{else}{translate key="rt.emailAuthor"} <span style="font-size: 0.8em">({translate key="plugins.block.readingTools.loginRequired"})</span>{/if}
		</div>
	{/if}
	{if $enableComments}
		<div class="articleToolItem">
			<img src="{$baseUrl}/plugins/blocks/readingTools/icons/postComment.png" class="articleToolIcon" />
			{if $postingLoginRequired}{translate key="plugins.block.readingTools.postComment"} <span style="font-size: 0.8em">({translate key="plugins.block.readingTools.loginRequired"})</span>
			{else}<a href="{url page="comment" op="add" path=$article->getId()|to_array:$galleyId}">{translate key="plugins.block.readingTools.postComment"}</a>{/if}
		</div>
	{/if}
</div>
</div>
{/if}

{/if}



{if $galley}
	<div>
	{if $galley->isHTMLGalley()}
		{$galley->getHTMLContents()}
	{elseif $galley->isPdfGalley()}
		{include file="article/pdfViewer.tpl"}
	{/if}
	<div class="author-section-bottom">
		<div class="blockTitle">
			{*{if count($article->getAuthors()) gt 1}
				{translate key="plugins.block.authorBios.aboutTheAuthors"}
			{else}
				{translate key="plugins.block.authorBios.aboutTheAuthor"}
			{/if}*}
			About the Authors
		</div>
		{foreach from=$article->getAuthors() item=author name=authors}
		<div id="authorBio">
			<div>
				<p><em>{$author->getFullName()|escape}</em> ({$author->getEmail()})</p>
				{if $author->getUrl()}<a href="{$author->getUrl()|escape:"quotes"}">{$author->getUrl()|escape}</a><br/>{/if}
				{assign var=authorAffiliation value=$author->getLocalizedAffiliation()}
				{*Added author designation here. Initially it was after the div*}
				<p>{$author->getLocalizedBiography()|strip_unsafe_html|nl2br}</p>
				{if $authorAffiliation}{$authorAffiliation}{/if}
				{if $author->getCountry()}{$author->getCountryLocalized()|escape}{/if}
			</div>
	
			{*<p>{$author->getLocalizedBiography()|strip_unsafe_html|nl2br}</p>*}
		</div>
		{if !$smarty.foreach.authors.last}<div class="separator"></div>{/if}
	
		{/foreach}
	</div>
	
	<!--changes made-->
	{if $is_letter_section}
	{*<h4 style="background: #575757; color: #fff !important; padding: 5px 10px; font-size: 15px; margin-top: 15px !important;">Compiled by</h4>
	<div>
		<div style="color: #414040; font-size: 15px; font-weight: bold;">Meenakshi D'Cruz</div>
		meenakshidcruz@gmail.com
	</div>*}
	{/if}
	<!--#changes made-->
	
	</div>
{else}
	
		{if is_a($article, 'PublishedArticle')}{assign var=galleys value=$article->getGalleys()}{/if}
		{if $galleys && $subscriptionRequired && $showGalleyLinks}
		<div id="topBar">
			<div id="accessKey">
				<img src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />
				{translate key="reader.openAccess"}&nbsp;
				<img src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
				{if $purchaseArticleEnabled}
					{translate key="reader.subscriptionOrFeeAccess"}
				{else}
					{translate key="reader.subscriptionAccess"}
				{/if}
			</div>
		</div>
		{/if}
	
	{if $coverPagePath}
		<div id="articleCoverImage"><img src="{$coverPagePath|escape}{$coverPageFileName|escape}"{if $coverPageAltText != ''} alt="{$coverPageAltText|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if}{if $width} width="{$width|escape}"{/if}{if $height} height="{$height|escape}"{/if}/>
		</div>
	{/if}
	{call_hook name="Templates::Article::Article::ArticleCoverImage"}
	<div id="articleTitle"><h3>{$article->getLocalizedTitle()|strip_unsafe_html}</h3></div>
	<div id="authorString"><em>{$article->getAuthorString()|escape}</em></div>
	<br />
	{if $article->getLocalizedAbstract()}
		<div id="articleAbstract">
		<h4>{translate key="article.abstract"}</h4>
		
		<div>{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}</div>
		
		</div>
	{/if}

	{if $article->getLocalizedSubject()}
		<div id="articleSubject">
		<h4>{translate key="article.subject"}</h4>
		
		<div>{$article->getLocalizedSubject()|escape}</div>
		
		</div>
	{/if}

	{if (!$subscriptionRequired || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || $subscribedUser || $subscribedDomain)}
		{assign var=hasAccess value=1}
	{else}
		{assign var=hasAccess value=0}
	{/if}

	{if $galleys}
		<div id="articleFullText">
		<h4>{translate key="reader.fullText"}</h4>
		{if $hasAccess || ($subscriptionRequired && $showGalleyLinks)}
			{foreach from=$article->getGalleys() item=galley name=galleyList}
				<a href="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)|to_array:$galley->getBestGalleyId($currentJournal)}" class="file" target="_parent">{$galley->getGalleyLabel()|escape}</a>
				{if $subscriptionRequired && $showGalleyLinks && $restrictOnlyPdf}
					{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN || !$galley->isPdfGalley()}
						<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />
					{else}
						<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
					{/if}
				{/if}
			{/foreach}
			{if $subscriptionRequired && $showGalleyLinks && !$restrictOnlyPdf}
				{if $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN}
					<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_open_medium.gif" alt="{translate key="article.accessLogoOpen.altText"}" />
				{else}
					<img class="accessLogo" src="{$baseUrl}/lib/pkp/templates/images/icons/fulltext_restricted_medium.gif" alt="{translate key="article.accessLogoRestricted.altText"}" />
				{/if}
			{/if}
		{else}
			&nbsp;<a href="{url page="about" op="subscriptions"}" target="_parent">{translate key="reader.subscribersOnly"}</a>
		{/if}
		</div>
	{/if}

	{if $citationFactory->getCount()}
		<div id="articleCitations">
		<h4>{translate key="submission.citations"}</h4>
		
		<div>
			{iterate from=citationFactory item=citation}
				<p>{$citation->getRawCitation()|strip_unsafe_html}</p>
			{/iterate}
		</div>
		
		</div>
	{/if}
{/if}

{foreach from=$pubIdPlugins item=pubIdPlugin}
	{if $issue->getPublished()}
		{assign var=pubId value=$pubIdPlugin->getPubId($pubObject)}
	{else}
		{assign var=pubId value=$pubIdPlugin->getPubId($pubObject, true)}{* Preview rather than assign a pubId *}
	{/if}
	{if $pubId}
		<br />
		<br />
		{$pubIdPlugin->getPubIdDisplayType()|escape}: {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}</a>{else}{$pubId|escape}{/if}
	{/if}
{/foreach}

{*added comments*}

{include file="article/comments.tpl"}

<script type="text/javascript">
<!--
{literal}
function handleAnonymousCheckbox(theBox) {
	var submitForm = document.getElementById('submit');
	if (theBox.checked) {
		submitForm.posterName.disabled = false;
		submitForm.posterEmail.disabled = false;
		submitForm.posterName.value = "";
		submitForm.posterEmail.value = "";
		submitForm.posterName.focus();
	} else {
		submitForm.posterName.disabled = true;
		submitForm.posterEmail.disabled = true;
		{/literal}{if $isUserLoggedIn && ($enableComments == COMMENTS_ANONYMOUS || $enableComments == COMMENTS_UNAUTHENTICATED)}
		submitForm.posterName.value = "{$userName|escape}";
		submitForm.posterEmail.value = "{$userEmail|escape}";
		{/if}{literal}
	}
}
// -->
{/literal}
</script>


{*{include file="article/footer.tpl"}*}
{include file="common/footer.tpl"}

