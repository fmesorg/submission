{**
 * templates/author/submit/complete.tpl
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * The submission process has been completed; notify the author.
 *
 *}
{strip}
{assign var="pageTitle" value="author.track"}
{include file="common/header.tpl"}
{/strip}

<div id="submissionComplete">
<p>{translate key="author.submit.submissionComplete" journalTitle=$journal->getLocalizedTitle()}</p>

	{if $canExpedite}
	{url|assign:"expediteUrl" op="expediteSubmission" articleId=$articleId}
	{translate key="author.submit.expedite" expediteUrl=$expediteUrl}
{/if}
{if $paymentButtonsTemplate }
	{include file=$paymentButtonsTemplate orientation="vertical"}
{/if}

<p>&#187; <a href="{url op="index"}">{translate key="author.track"}</a></p>
</div>

<div class="suppport_box_wrapper">
	<div id="supportBox">
		<div id = "sup_button">
			<a href="/IjmeFeesCollectionApp/index.php" class="sup_btn" target="_blank" data-toggle="tooltip" data-placement="top" title="Support us, Pay What you want">$$Support Us</a>
		</div>
		<div id = "sup_desc">
			Full Article processing fees is $150(Rs10,000), you can pay what you want.$$
		</div>
	</div>
</div>


{include file="common/footer.tpl"}

