<?php

/**
 * @file StaticPagesHandler.inc.php
 *
 * Copyright (c) 2003-2008 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @package plugins.generic.staticPages
 * @class StaticPagesHandler
 *
 * Find the content and display the appropriate page
 *
 */

import('core.Handler');

class StaticPagesHandler extends Handler {
	function index( $args ) {
		Request::redirect(null, null, null, 'view', Request::getRequestedOp());
	}
	
	function view ($args) {
		if (count($args) > 0 ) {
			$conference = &Request::getConference();
			$conferenceId = $conference->getConferenceId();
			$path = $args[0];

			$staticPagesPlugin = &PluginRegistry::getPlugin('generic', 'StaticPagesPlugin');
			$templateMgr = &TemplateManager::getManager();

			$staticPagesDAO =& DAORegistry::getDAO('StaticPagesDAO');
			$staticPage = $staticPagesDAO->getStaticPageByPath($conferenceId, $path);

			if ( !$staticPage ) {
				Request::redirect(null, null, 'index');
			}
			
			// and assign the template vars needed
			$templateMgr->assign('title', $staticPage->getStaticPageTitle());
			$templateMgr->assign('content',  $staticPage->getStaticPageContent());
			$templateMgr->display($staticPagesPlugin->getTemplatePath().'content.tpl');
		}
	}
}

?>
