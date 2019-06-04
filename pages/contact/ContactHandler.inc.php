<?php

/**
 * @file pages/about/AboutHandler.inc.php
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class AboutHandler
 * @ingroup pages_editor
 *
 * @brief Handle requests for editor functions. 
 */

import('classes.handler.Handler');

class ContactHandler extends Handler {
	/**
	 * Constructor
	 **/
	function ContactHandler() {
		parent::Handler();
	}

	/**
	 * Display about index page.
	 * @param $args array
	 * @param $request PKPRequest
	 */
	function index($args, &$request) {
		$this->validate();
		$this->setupTemplate();

		$templateMgr =& TemplateManager::getManager();
		$journalDao =& DAORegistry::getDAO('JournalDAO');
		$journalPath = $request->getRequestedJournalPath();
		
		function generateCode($characters) {
			/* list all possible characters, similar looking characters and vowels have been removed */
			$possible = '23456789bcdfghjkmnpqrstvwxyz';
			$code = '';
			$i = 0;
			while ($i < $characters) { 
				$code .= substr($possible, mt_rand(0, strlen($possible)-1), 1);
				$i++;
			}
			return $code;
		}
		$key_value = "ierqw234"; 
		$captcha_response = $_POST['captcha_code'];//this is the captcha value entered
		$captcha_chars_hash = $_POST['captcha_code_hash'];//this is the captcha hash used for decryption
		
		/*
		 * replace ~ with + as while sending the post data we are purposely replacing + with ~ as the browser interprets it a white space character
		 */
		$captcha_chars_hash = str_replace("~", '+', $captcha_chars_hash);
		$correct_captcha = mcrypt_ecb(MCRYPT_BLOWFISH,$key_value,base64_decode($captcha_chars_hash),MCRYPT_DECRYPT);
		
		/*
		 * If $_POST["submit_response"] is set then form is submitted
		 */
		if(isset($_POST["submit_response"])){
			
			/*
			 * We first check if captcha code matches
			 * use trim function as mcrypt_ecb sometimes inserts blank characters
			 */
			if(trim($captcha_response) == trim($correct_captcha))
			{
				//echo "Captcha matched";
				if(isset($_POST["email"]) && $_POST["email"]!=""){
					if( filter_var( $_POST["email"], FILTER_VALIDATE_EMAIL ) ){
						if( isset($_POST["subject"]) && $_POST["subject"]!="" ){
							
							/*
							 * Send mail to the admin(editor or technical or subscription as per the user selection in contact form)
							 */
							switch ($_POST["query"])
							{
							case "editorial":
							  $to = "editorial@ijme.in, sanket@z-aksys.in, shifra@z-aksys.com, ijme.editorial@gmail.com";
							  break;
							case "technical":
							  $to = "sanket@z-aksys.in, admin@ijme.in, shifra@z-aksys.com, ijme.editorial@gmail.com";
							  break;
							case "asd":
							  $to = "sanket@z-aksys.in, subscription.donation@ijme.in, shifra@z-aksys.com, ijme.editorial@gmail.com";
							  break;
							default:
							  $to = "sanket@z-aksys.in";
							}
							$from_admin = $to;
							$subject = "IJME feedback: ".$_POST["subject"];
							$message = $_POST["message"];
							$from = $_POST["email"];
							$headers = "From:" . $_POST["name"].'<'.$from.'>';
							mail($to,$subject,$message,$headers);
							
							
							/*
							 * Send mail to the user
							 */
							switch ($_POST["query"])
							{
							case "editorial":
							  $from = "editorial@ijme.in";
							  break;
							case "technical":
							  $from = "admin@ijme.in";
							  break;
							case "asd":
							  $from = "subscription.donation@ijme.in";
							  break;
							default:
							  $from = "admin@ijme.in";
							}
							$to = $_POST["email"];
							$subject = "Indian Journal of Medical Ethics";
							$message = "Thank you for your submission. We will get back to you soon.";
							$headers = "From:" . $from;
							mail($to,$subject,$message,$headers);
							
							$templateMgr->assign('sent_sucessfully',true);
						}
						else{
							$templateMgr->assign('not_valid_subject',true);
						}
					}
					else{
						$templateMgr->assign('not_valid_email',true);
					}
				}
				else{
					$templateMgr->assign('not_valid_email',true);
				}
			}
			else{
				$templateMgr->assign('captcha_mismatched',true);
				//echo "Captcha mismatched";
			}		
		}
				
		$code = generateCode(6);
		$captcha_chars_hash = base64_encode(mcrypt_ecb(MCRYPT_BLOWFISH, $key_value, $code, MCRYPT_ENCRYPT));
		$captcha_chars_hash = str_replace("+", '~', $captcha_chars_hash);
		$templateMgr->assign('captcha_img',"captcha/captcha.php?code=".$captcha_chars_hash);
		$templateMgr->assign('captcha_hash',$captcha_chars_hash);
		$templateMgr->assign('is_contact_page',true);

		if ($journalPath != 'index' && $journalDao->journalExistsByPath($journalPath)) {
			$journal =& $request->getJournal();

			$journalSettingsDao =& DAORegistry::getDAO('JournalSettingsDAO');
			$templateMgr->assign_by_ref('journalSettings', $journalSettingsDao->getJournalSettings($journal->getId()));

			$customAboutItems =& $journalSettingsDao->getSetting($journal->getId(), 'customAboutItems');
			if (isset($customAboutItems[AppLocale::getLocale()])) $templateMgr->assign('customAboutItems', $customAboutItems[AppLocale::getLocale()]);
			elseif (isset($customAboutItems[AppLocale::getPrimaryLocale()])) $templateMgr->assign('customAboutItems', $customAboutItems[AppLocale::getPrimaryLocale()]);

			foreach ($this->_getPublicStatisticsNames() as $name) {
				if ($journal->getSetting($name)) {
					$templateMgr->assign('publicStatisticsEnabled', true);
					break;
				} 
			}
			
			// Hide membership if the payment method is not configured
			import('classes.payment.ojs.OJSPaymentManager');
			$paymentManager = new OJSPaymentManager($request);
			$templateMgr->assign('paymentConfigured', $paymentManager->isConfigured());

			$groupDao =& DAORegistry::getDAO('GroupDAO');
			$groups =& $groupDao->getGroups(ASSOC_TYPE_JOURNAL, $journal->getId(), GROUP_CONTEXT_PEOPLE);

			$templateMgr->assign_by_ref('peopleGroups', $groups);
			$templateMgr->assign('helpTopicId', 'user.about');
			$templateMgr->display('contact/index.tpl');
		} else {
			$site =& $request->getSite();
			$about = $site->getLocalizedAbout();
			$templateMgr->assign('about', $about);

			$journals =& $journalDao->getJournals(true);
			$templateMgr->assign_by_ref('journals', $journals);
			$templateMgr->display('contact/site.tpl');
		}
	}


	/**
	 * Setup common template variables.
	 * @param $subclass boolean set to true if caller is below this handler in the hierarchy
	 */
	function setupTemplate($subclass = false) {
		parent::setupTemplate();
		$templateMgr =& TemplateManager::getManager();
		$journal =& Request::getJournal();
		
		AppLocale::requireComponents(LOCALE_COMPONENT_OJS_MANAGER, LOCALE_COMPONENT_PKP_MANAGER);

		if (!$journal || !$journal->getSetting('restrictSiteAccess')) {
			$templateMgr->setCacheability(CACHEABILITY_PUBLIC);
		}
		if ($subclass) $templateMgr->assign('pageHierarchy', array(array(Request::url(null, 'about'), 'about.aboutTheJournal')));
	}


	/**
	 * Display group info for a particular group.
	 * @param $args array
	 */
	function displayMembership($args) {
		$this->addCheck(new HandlerValidatorJournal($this));
		$this->validate();
		$this->setupTemplate(true);

		$journal =& Request::getJournal();
		$templateMgr =& TemplateManager::getManager();
		$groupId = (int) array_shift($args);

		$groupDao =& DAORegistry::getDAO('GroupDAO');
		$group =& $groupDao->getById($groupId);

		if (	!$journal || !$group ||
			$group->getContext() != GROUP_CONTEXT_PEOPLE ||
			$group->getAssocType() != ASSOC_TYPE_JOURNAL ||
			$group->getAssocId() != $journal->getId()
		) {
			Request::redirect(null, 'about');
		}

		$groupMembershipDao =& DAORegistry::getDAO('GroupMembershipDAO');
		$allMemberships =& $groupMembershipDao->getMemberships($group->getId());
		$memberships = array();
		while ($membership =& $allMemberships->next()) {
			if (!$membership->getAboutDisplayed()) continue;
			$memberships[] =& $membership;
			unset($membership);
		}

		$countryDao =& DAORegistry::getDAO('CountryDAO');
		$countries =& $countryDao->getCountries();
		$templateMgr->assign_by_ref('countries', $countries);

		$templateMgr->assign_by_ref('group', $group);
		$templateMgr->assign_by_ref('memberships', $memberships);
		$templateMgr->display('about/displayMembership.tpl');
	}

	

	/**
	 * Display a list of public stats for the current journal.
	 * WARNING: This implementation should be kept roughly synchronized
	 * with the reader's statistics view in the About pages.
	 */
	function statistics() {
		$this->validate();
		$this->setupTemplate(true);

		$journal =& Request::getJournal();
		$templateMgr =& TemplateManager::getManager();
		$templateMgr->assign('helpTopicId','user.about');

		$statisticsYear = Request::getUserVar('statisticsYear');
		if (empty($statisticsYear)) $statisticsYear = date('Y');
		$templateMgr->assign('statisticsYear', $statisticsYear);

		$sectionIds = $journal->getSetting('statisticsSectionIds');
		if (!is_array($sectionIds)) $sectionIds = array();
		$templateMgr->assign('sectionIds', $sectionIds);

		foreach ($this->_getPublicStatisticsNames() as $name) {
			$templateMgr->assign($name, $journal->getSetting($name));
		}
		$fromDate = mktime(0, 0, 0, 1, 1, $statisticsYear);
		$toDate = mktime(23, 59, 59, 12, 31, $statisticsYear);

		$journalStatisticsDao =& DAORegistry::getDAO('JournalStatisticsDAO');
		$articleStatistics = $journalStatisticsDao->getArticleStatistics($journal->getId(), null, $fromDate, $toDate);
		$templateMgr->assign('articleStatistics', $articleStatistics);

		$limitedArticleStatistics = $journalStatisticsDao->getArticleStatistics($journal->getId(), $sectionIds, $fromDate, $toDate);
		$templateMgr->assign('limitedArticleStatistics', $limitedArticleStatistics);

		$sectionDao =& DAORegistry::getDAO('SectionDAO');
		$sections =& $sectionDao->getJournalSections($journal->getId());
		$templateMgr->assign('sections', $sections->toArray());

		$issueStatistics = $journalStatisticsDao->getIssueStatistics($journal->getId(), $fromDate, $toDate);
		$templateMgr->assign('issueStatistics', $issueStatistics);

		$reviewerStatistics = $journalStatisticsDao->getReviewerStatistics($journal->getId(), $sectionIds, $fromDate, $toDate);
		$templateMgr->assign('reviewerStatistics', $reviewerStatistics);

		$allUserStatistics = $journalStatisticsDao->getUserStatistics($journal->getId(), null, $toDate);
		$templateMgr->assign('allUserStatistics', $allUserStatistics);

		$userStatistics = $journalStatisticsDao->getUserStatistics($journal->getId(), $fromDate, $toDate);
		$templateMgr->assign('userStatistics', $userStatistics);

		if ($journal->getSetting('publishingMode') == PUBLISHING_MODE_SUBSCRIPTION) {
			$allSubscriptionStatistics = $journalStatisticsDao->getSubscriptionStatistics($journal->getId(), null, $toDate);
			$templateMgr->assign('allSubscriptionStatistics', $allSubscriptionStatistics);

			$subscriptionStatistics = $journalStatisticsDao->getSubscriptionStatistics($journal->getId(), $fromDate, $toDate);
			$templateMgr->assign('subscriptionStatistics', $subscriptionStatistics);
		}

		$templateMgr->display('about/statistics.tpl');
	}

	/**
	 * @see StatisticsHandler::_getPublicStatisticsNames()
	 */
	function _getPublicStatisticsNames() {
		import ('pages.manager.ManagerHandler');
		import ('pages.manager.StatisticsHandler');
		return StatisticsHandler::_getPublicStatisticsNames();
	}
}

?>
