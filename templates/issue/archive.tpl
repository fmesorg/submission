{**
 * templates/issue/archive.tpl
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Issue Archive.
 *
 *}
{strip}
{assign var="pageTitle" value="archive.archives"}
{include file="common/header.tpl"}
{/strip}

{*<div id="issues">
{iterate from=issues item=issue}
        
	{if $issue->getYear() != $lastYear}
		{if !$notFirstYear}
			{assign var=notFirstYear value=1}
		{else}
			</div>
			<br />
			<div class="separator" style="clear:left;"></div>
		{/if}
		<div style="float: left; width: 100%;">
		<h3>{$issue->getYear()|escape}</h3>
		{assign var=lastYear value=$issue->getYear()}
	{/if}

	<div id="issue" style="clear:left;">
	{if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
		<div class="issueCoverImage"><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}"><img src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if}/></a>
		</div>
		<h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getIssueIdentification()|escape}</a></h4>
		<div class="issueCoverDescription">{$issue->getLocalizedCoverPageDescription()|strip_unsafe_html|nl2br}</div>
	{else}
		<h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getIssueIdentification()|escape}</a></h4>
		<div class="issueDescription">{$issue->getLocalizedDescription()|strip_unsafe_html|nl2br}</div>
	{/if}
	</div>

{/iterate}
{if $notFirstYear}<br /></div>{/if}

{if !$issues->wasEmpty()}
	{page_info iterator=$issues}&nbsp;&nbsp;&nbsp;&nbsp;
	{page_links anchor="issues" name="issues" iterator=$issues}
{else}
	{translate key="current.noCurrentIssueDesc"}
{/if}
</div>*}
<div id="issues">
    {assign var=issue_count value=0}
    {iterate from=issues item=issue}        
        
	{if $issue->getYear() != $lastYear}
		{if !$notFirstYear}
			{assign var=notFirstYear value=1}
		{else}
			</div>
                        {if $issue_count%3==0}<div style="clear: both;"></div>{/if}
		{/if}
                {assign var=issue_count value=$issue_count+1}                
		<div class="cust-col-md-4 {if $issue_count%3==0}last-col {$issue_count}{/if}">
		<h3 class="issue-archive-year">{$issue->getYear()|escape}</h3>
		{assign var=lastYear value=$issue->getYear()}
	{/if}

	<div class="single-issue" style="clear:left;">
	{if $issue->getLocalizedFileName() && $issue->getShowCoverPage($locale) && !$issue->getHideCoverPageArchives($locale)}
		<div class="issueCoverImage"><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}"><img src="{$coverPagePath|escape}{$issue->getFileName($locale)|escape}"{if $issue->getCoverPageAltText($locale) != ''} alt="{$issue->getCoverPageAltText($locale)|escape}"{else} alt="{translate key="issue.coverPage.altText"}"{/if}/></a>
		</div>
		<h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getIssueIdentification()|escape}</a></h4>
		<div class="issueCoverDescription">{$issue->getLocalizedCoverPageDescription()|strip_unsafe_html|nl2br}</div>
	{else}
		<h4><a href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getIssueIdentification()|escape}</a></h4>
		<div class="issueDescription">{$issue->getLocalizedDescription()|strip_unsafe_html|nl2br}</div>
	{/if}
	</div>

    {/iterate}
    {if $notFirstYear}<br /></div>{/if}
</div>
{include file="common/footer.tpl"}

