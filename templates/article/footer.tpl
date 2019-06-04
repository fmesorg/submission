{**

* templates/article/footer.tpl

*

* Copyright (c) 2003-2013 John Willinsky

* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.

*

* Article View -- Footer component.

*}







{if $currentJournal && $currentJournal->getSetting('includeCreativeCommons')}

<br />

<br />

<a rel="license" target="_new" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/80x15.png" /></a>

<br />

This <span xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://purl.org/dc/dcmitype/Text" rel="dc:type">work</span> is licensed under a <a target="_new" rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 License</a>.

{/if}



{call_hook name="Templates::Article::Footer::PageFooter"}

{if $pageFooter}

<br />

<br />

{$pageFooter}

{/if}

</div><!-- content -->

</div><!-- main -->

</div><!--end bootstrap span-->

</div><!--end bootstrap row-->

</div><!-- body -->



</div><!--end bootstrap span-->

</div><!--end bootstrap row-->



{if $defineTermsContextId}

<script type="text/javascript">

{literal}

<!--

// Open "Define Terms" context when double-clicking any text

function openSearchTermWindow(url) {

var term;

if (window.getSelection) {

term = window.getSelection();

} else if (document.getSelection) {

term = document.getSelection();

} else if(document.selection && document.selection.createRange && document.selection.type.toLowerCase() == 'text') {

var range = document.selection.createRange();

term = range.text;

}

if (url.indexOf('?') > -1) openRTWindowWithToolbar(url + '&defineTerm=' + term);

else openRTWindowWithToolbar(url + '?defineTerm=' + term);

}



if(document.captureEvents) {

document.captureEvents(Event.DBLCLICK);

}

document.ondblclick = new Function("openSearchTermWindow('{/literal}{url page="rt" op="context" path=$articleId|to_array:$galleyId:$defineTermsContextId escape=false}{literal}')");

// -->

{/literal}

</script>

{/if}



{get_debug_info}

{if $enableDebugStats}{include file=$pqpTemplate}{/if}



</div> <!-- container -->

{*
{literal}
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-2011095144903626"
     data-ad-slot="5600462393"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
{/literal}
*}

</div><!--end bootstrap container-->



<div class="footer">

	<div class="scroll-to-top">

		<a href="#scroll-to-top"><img src="http://216.12.194.36/~ijmein/images/theme/scroll-to-top-btn.png"></a>

		<script src="http://216.12.194.36/~ijmein/js/custom.js"></script>

	</div>

	<div class="container">

		&copy; 2013. All rights reserved | Designed &amp; Developed by Z-Aksys Solutions Pvt. Ltd.

	</div>

</div>

<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />

</body>

</html>



