{**

* footer.tpl

*

* Copyright (c) 2000-2012 John Willinsky

* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.

*

* Common site footer.

*

*}

{if $displayCreativeCommons}

  {translate key="common.ccLicense"}

{/if}

<!--{if $pageFooter}

  <br /><br />

  {$pageFooter}

{/if}-->

{call_hook name="Templates::Common::Footer::PageFooter"}

<div class="footer-ad-container">
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
</div>

</div><!-- #content -->

</div><!-- last-2 main -->

</div><!--last-3 main-content end bootstrap span-->



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

<div class="col-md-3 rightsidebar">

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
                        <div class="sidebar-ad-container" style="margin: 20px auto; height:100%">
                        {*
                        {literal}
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                        <ins class="adsbygoogle"
                             style="display:inline-block;width:300px;height:600px"
                             data-ad-client="ca-pub-2011095144903626"
                             data-ad-slot="2321728798"></ins>
                        <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
                        {/literal}
                        *}
                        </div>
                              </div>

                            {/if}

                          </div>

                        {/if}

                      </div>



</div><!--last-4 end bootstrap row col-md-12-->

</div><!--last-5  row body -->



</div><!--last-6 end bootstrap span-->

</div><!--last-7 end bootstrap row-->



{get_debug_info}

{if $enableDebugStats}{include file=$pqpTemplate}{/if}



</div><!--last-8 container -->

{if !empty($systemNotifications)}

  {translate|assign:"defaultTitleText" key="notification.notification"}

  <script type="text/javascript">

    <!--

    {foreach from=$systemNotifications item=notification}

      {literal}

          $.pnotify({

              pnotify_title: '{/literal}{if $notification->getIsLocalized()}{translate|escape:"js"|default:$defaultTitleText key=$notification->getTitle()}{else}{$notification->getTitle()|escape:"js"|default:$defaultTitleText}{/if}{literal}',

              pnotify_text: '{/literal}{if $notification->getIsLocalized()}{translate|escape:"js" key=$notification->getContents() param=$notification->getParam()}{else}{$notification->getContents()|escape:"js"}{/if}{literal}',

              pnotify_addclass: '{/literal}{$notification->getStyleClass()|escape:"js"}{literal}',

              pnotify_notice_icon: 'notifyIcon {/literal}{$notification->getIconClass()|escape:"js"}{literal}'

          });

      {/literal}

    {/foreach}

    // -->

  </script>

{/if}{* systemNotifications *}

</div> <!--last-9 container -->

<!--</div>--><!--end bootstrap container-->
<div class="footer">

	<div class="scroll-to-top">

		<a href="#scroll-to-top"><img src="{$baseUrl}/images/theme/scroll-to-top-btn.png"></a>		

		<script src="{$baseUrl}/js/custom.js?v=1.1"></script>

	</div>

  <div class="container">

      &copy <?php echo date('Y'); ?>. All rights reserved | Designed &amp; Developed by <a class="company-link" href="/about-us/fmes/overview/" target="_blank">FMES</a> | <a class="company-link" href="http://ijme.in/index.php/ijme/pages/view/disclaimer">Disclaimer</a>
  </div>

</div>
    
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	{literal}
	<script language="javascript">
	<!--
		$(document).ready(function(){
			//setTimeout(setActionOgGooglAds, 5000);
			//setInterval(function(){googletag.pubads().refresh([adsbygoogle]);}, 2000); 
		});
		
		function setActionOgGooglAds(){
			$('.i-header-banner').click(function(){
				$(this).find('a').attr('target','_blank');				
			});
			
			console.log($('iframe').length);
		
			$('iframe').each(function(){
				$(this).find('iframe').each(function(){
					var strURL = $(this).attr('src');
					console.log(strURL);
					$(this).attr('src',strURL);
				});
			});
			
			
			
		}
		 
		 
	-->
	</script>
	{/literal}
</body>





</html>



