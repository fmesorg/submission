{**
 * navbar.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}

{assign var=current_issue_slug value="who-decides-when-you-die"}

<div class="row">  
    <div class="col-md-12 nav-top-btn-container">
        <div class="top-nav-btnI"><a href="{$wp_url}/disclaimer"><img src="{$baseUrl}/images/theme/Disclaimer.jpg" alt="Disclaimer"></a></div>
        <!--<div class="top-nav-btnI"><a href="{$baseUrl}/index.php/ijme/pages/view/disclaimer"><img src="{$baseUrl}/images/theme/Disclaimer.jpg" alt="Disclaimer"></a></div>-->
        <div class="top-nav-btnI"><a href="{$wp_url}/subscribe"><img src="{$baseUrl}/images/theme/subscribe_btn.jpg" alt="Subscribe"></a></div>
        <!--<div class="top-nav-btnI"><a href="{$baseUrl}/index.php/ijme/pages/view/subscribe"><img src="{$baseUrl}/images/theme/subscribe_btn.jpg" alt="Subscribe"></a></div>-->
        <div class="top-nav-btnI"><a href="{$wp_url}/donate"><img src="{$baseUrl}/images/theme/donate_btn.jpg" alt="Donate"></a></div>
        <!--<div class="top-nav-btnI"><a href="{$baseUrl}/index.php/ijme/pages/view/donate"><img src="{$baseUrl}/images/theme/donate_btn.jpg" alt="Donate"></a></div>-->
        <div class="top-nav-btnI"><a href="{$wp_url}/advertise"><img src="{$baseUrl}/images/theme/banneFr_ad_btn.jpg" alt="Advertise with us"></a></div>  
        <!--<div class="top-nav-btnI"><a href="{$baseUrl}/index.php/ijme/pages/view/advertise"><img src="{$baseUrl}/images/theme/banneFr_ad_btn.jpg" alt="Advertise with us"></a></div>  -->
 </div>
</div>
 

<nav class="navbar navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand">Navigation</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li>
                <a href="{$baseUrl}/index.php/ijme/index">Home</a>
                <!--<a href="{$wp_url}">Home</a>-->
            </li>
            <li>
                <a href="{$baseUrl}/index.php/ijme/issue/current">Online First</a><!--
                <a href="{$wp_url}/issues/online-first/">Online First</a>-->
            </li>
            <li>
                <a href="{$baseUrl}/index.php/ijme/issue/view/137">Current Issue</a><!--
                <a href="{$wp_url}/issues/{$current_issue_slug}">Current Issue</a>-->
            </li>
            <li>
                <a href="{$baseUrl}/index.php/ijme/pages/view/archives">Archives</a><!--
                <a href="{$wp_url}/issues">Archives</a>-->
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" href="{$baseUrl}/index.php/ijme/login/">Submit / Review</a>
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="{$baseUrl}/index.php/ijme/pages/view/submission-guidelines">Submission Guidelines</a><!--
                        <a href="{$wp_url}/submission-guidelines">Submission Guidelines</a>-->
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" href="{$baseUrl}/index.php/ijme/pages/view/about-overview">Ijme</a><!--
                <a class="dropdown-toggle" href="{$wp_url}/ijme">Ijme</a>-->
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="{$baseUrl}/index.php/ijme/pages/view/editorial-team">Editorial team</a><!--
                        <a href="{$wp_url}/editorial-team">Editorial team</a>-->
                    </li>
                    <li>
                        <a href="{$baseUrl}/index.php/ijme/pages/view/about-history">History</a><!--
                        <a href="{$wp_url}/about-history">History</a>-->
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" href="{$baseUrl}/index.php/ijme/pages/view/fmes-overview">Fmes</a><!--
                <a class="dropdown-toggle" href="{$wp_url}/fmes">Fmes</a>-->
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="{$baseUrl}/index.php/ijme/pages/view/fmes-history">History</a><!--
                        <a href="{$wp_url}/fmes-history">History</a>-->
                    </li>
                </ul>
            </li>
            <li>
                <a href="{$baseUrl}/index.php/ijme/pages/view/bioethics-resources">Resources</a><!--
                <a href="{$wp_url}/resources">Resources</a>-->
            </li>
            <li>
                <a href="{$baseUrl}/index.php/ijme/pages/view/opportunities">Opportunities</a><!--
                <a href="{$wp_url}/opportunities">Opportunities</a>-->
            </li>
            <li>
                <a href="{$baseUrl}/index.php/ijme/contact">Contact</a><!--
                <a href="{$wp_url}/contact">Contact</a>-->
            </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>