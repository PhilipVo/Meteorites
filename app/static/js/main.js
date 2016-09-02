$(document).ready(function() {
	$('.btn').click(function() {
		$.post('/events/'+$(this).attr('id'), function(res) {});
		$(this).toggleClass("join going");
		$(this).text($(this).text() == 'Join' ? 'Going!' : 'Join');
	});
});