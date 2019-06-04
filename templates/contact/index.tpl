{**
 * templates/about/index.tpl
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal index.
 *
 *}
{strip}
{assign var="pageTitle" value="Contact Us"}
{include file="common/header.tpl"}
{/strip}

<div class="row contact">
	<div class="col-md-4">
		{if $captcha_mismatched}<span style="color: red;">Captcha code you entered is incorrect.</span><br/>{/if}
		{if $not_valid_email}<span style="color: red;">Please enter a valid email</span><br/>{/if}
		{if $not_valid_subject}<span style="color: red;">Please enter subject</span><br/>{/if}
		{if $sent_sucessfully}<span><strong>Your message has been successfully submitted.</strong></span>{/if}
		<form action="" id="contact-form" method="post">
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="name">Your Name</label>
					<div class="controls">
						<input type="text" name="name" id="name">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="email">Email Address</label>
					<div class="controls">
						<input type="text" name="email" id="email">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="subject">Subject</label>
					<div class="controls">
						<input type="text" name="subject" id="subject">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="subject">Query</label>
					<div class="controls">
						<select class="form-control" name="query">
						<option value="editorial">Editorial</option>
						<option value="technical">Technical</option>
						<option value="asd">Advertisements/ Subscription/Donations</option>
					      </select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="message">Your Message</label>
					<div class="controls">
						<textarea style="min-height: 75px;" name="message" id="message" rows="3"></textarea>
					</div>
				</div>
				{*<div class="control-group">
					<script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k=6Lcu7-gSAAAAAJiur-bU11sYseuCZ38snm8pjjhB"></script>

<noscript>
&lt;iframe src="http://www.google.com/recaptcha/api/noscript?k=6Lcu7-gSAAAAAJiur-bU11sYseuCZ38snm8pjjhB" height="300" width="500" frameborder="0"&gt;&lt;/iframe&gt;&lt;br/&gt;
&lt;textarea name="recaptcha_challenge_field" rows="3" cols="40"&gt;&lt;/textarea&gt;
&lt;input type="hidden" name="recaptcha_response_field" value="manual_challenge"/&gt;
</noscript>
<script type="text/javascript"
       src="http://www.google.com/recaptcha/api/challenge?k=6LdPrewSAAAAABLuTUVwXmyBQ1EEIiuuUxq0JBCh">
    </script>
    <noscript>
       <iframe src="http://www.google.com/recaptcha/api/noscript?k=6LdPrewSAAAAABLuTUVwXmyBQ1EEIiuuUxq0JBCh"
           height="300" width="500" frameborder="0"></iframe><br>
       <textarea name="recaptcha_challenge_field" rows="3" cols="40">
       </textarea>
       <input type="hidden" name="recaptcha_response_field"
           value="manual_challenge">
    </noscript>
<span class="captcha_error">Please enter valid captcha</span>

				</div>*}
				<div class="control-group">
					<img src="{$baseUrl}/{$captcha_img}">
				</div>
				<input type="hidden" name="captcha_code_hash" value="{$captcha_hash}">
				<div class="control-group">
					<input type="text" name="captcha_code" placeholder="Please enter the above captcha">
				</div>
				<div class="control-group">
					<input style="width:76px;" type="submit"  class="button" name="submit_response" value="Submit">
					<!-- <button type="reset" class="btn">
						Cancel
					</button> -->
				</div>
				{*<div class="control-group">
					<button name="submit" type="submit" class="btn btn-danger">
						Submit
					</button>
					<button type="reset" class="btn">
						Cancel
					</button>
				</div>*}

			</fieldset>
		</form>

		<script>
			$(document).ready(function() {
				$('#contact-form').validate({
					rules : {
						name : {
							minlength : 2,
							required : true
						},
						email : {
							required : true,
							email : true
						},
						subject : {
							minlength : 2,
							required : true
						},
						message : {
							minlength : 2,
							required : true
						}

					},
					highlight : function(element) {
						$(element).closest('.control-group').removeClass('success').addClass('error');
						$('.captcha_error').css('display', 'block');
					},
					success : function(element) {
						element.text('').addClass('valid').closest('.control-group').removeClass('error').addClass('success');
					}
				});
			});
		</script>
	</div>
	<div class="col-md-8 address-map">
		<h4>Address</h4>

		<table class="table table-striped">
			<tr>
				<td>
					Registered office:
				</td>
				<td>
					Forum for Medical Ethics Society, 0-18, Bhavna, Veer Savarkar Marg, Prabhadevi, Mumbai - 400 025 INDIA.
				</td>
			</tr>
			<tr>
				<td>
					Operational office:
				</td>
				<td>
					Indian Journal of Medical Ethics, c/o Cehat Survey 2804-5, Aram Society Road, Vakola, Santacruz (E), Mumbai - 400 055.
				</td>
			</tr>
			<tr>
				<td>
					Editorial correspondence:
				</td>
				<td>
					<a href="mailto:ijme.editorial@gmail.com">ijme.editorial@gmail.com</a>
				</td>
			</tr>
			<tr>
				<td>
					Subscription correspondence:
				</td>
				<td>
					<a href="mailto:ijmemumbai@gmail.com">ijmemumbai@gmail.com</a>
				</td>
			</tr>
			<tr>
				<td>
					Telephone:
				</td>
				<td>
					07506265856
				</td>
			</tr>
		</table>

		<!-- <h4>View map</h4>
		<div class="row">
			<div class="col-md-12">
				<iframe style="border: 1px solid rgb(194, 194, 194); border-radius: 5px;" width="99%" height="295" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=aram+society+vakola&amp;aq=&amp;sll=19.079998,72.854502&amp;sspn=0.01454,0.026157&amp;ie=UTF8&amp;hq=&amp;hnear=Aaram+Society,+St+Anthony+Rd,+Vakola,+Mumbai+Suburban,+Maharashtra+400055&amp;ll=19.07884,72.85531&amp;spn=0.001818,0.00327&amp;t=m&amp;z=14&amp;output=embed"></iframe>
			</div>
		</div> -->
	</div>
</div>

{include file="common/footer.tpl"}

