{**
 * plugins/blocks/user/block.tpl
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- user tools.
 *
 *}
<div class="block after-login" id="sidebarUser">
	{if !$implicitAuth}
		<span class="blockTitle">Login</span>
	{/if}

	{if $isUserLoggedIn}
		{translate key="plugins.block.user.loggedInAs"}
		<strong>{$loggedInUsername|escape}</strong>
		<ul>
			{if $hasOtherJournals}
				<li><a href="{url journal="index" page="user"}">{translate key="plugins.block.user.myJournals"}</a></li>
			{/if}
			<li><a href="{url page="user" op="profile"}">{translate key="plugins.block.user.myProfile"}</a></li>
            <li>|</li>
			<li><a href="{url page="login" op="signOut"}">{translate key="plugins.block.user.logout"}</a></li>
			{if $userSession->getSessionVar('signedInAs')}
				<li><a href="{url page="login" op="signOutAsUser"}">{translate key="plugins.block.user.signOutAsUser"}</a></li>
			{/if}
            <div class="clear"></div>
		</ul>
	{else}
		{if $implicitAuth}
			<a href="{url page="login" op="implicitAuthLogin"}">Journals Login</a>
		{else}
			<form method="post" action="{$userBlockLoginUrl}">
				<table>
					<tr>
						<td width="65"><label for="sidebar-username">{translate key="user.username"}</label></td>
						<td colspan="2"><input type="text" id="sidebar-username" name="username" value="" size="12" maxlength="32" class="textField" /></td>
					</tr>
					<tr>
						<td><label for="sidebar-password">{translate key="user.password"}</label></td>
						<td><input type="password" id="sidebar-password" name="password" value="{$password|escape}" size="12" maxlength="32" class="textField" /></td>
						<td style="width:60px;"><input type="submit" value="{translate key="user.login"}" class="button" /></td>
					</tr>
					<tr>
						<td colspan="3"><input type="checkbox" id="remember" name="remember" value="1" /> <label class="remember" for="remember">{translate key="plugins.block.user.rememberMe"}</label><label class="remember">|&nbsp;<a href="http://216.12.194.36/~ijmein/index.php/ijme/user/register">Register</a></label><label class="remember">|&nbsp;<a href="http://216.12.194.36/~ijmein/index.php/ijme/login/lostPassword">Forgot your password?</a></label></td>
					</tr>
					<tr>
						
					</tr>
				</table>
			</form>
		{/if}
	{/if}
</div>
