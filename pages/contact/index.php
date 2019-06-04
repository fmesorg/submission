<?php

/**
 * @defgroup pages_about
 */
 
/**
 * @file pages/about/index.php
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @ingroup pages_about
 * @brief Handle requests for about the journal functions. 
 *
 */

switch($op) {
	case 'index':
		define('HANDLER_CLASS', 'ContactHandler');
		import('pages.contact.ContactHandler');
		break;
}

?>
