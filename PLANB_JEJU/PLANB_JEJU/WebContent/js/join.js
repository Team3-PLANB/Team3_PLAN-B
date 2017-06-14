/**
 * 2017 06 14
 * join / login tap hidden
 */

$(document).ready(function() {
	$('#social_login').hide();
	$('.nav').find('#login_tab').click(function() {
		$('#social_join').hide();
		$('#social_login').show();
	});
	$('.nav').find('#join_tab').click(function() {
		$('#social_login').hide();
		$('#social_join').show();
	});
});