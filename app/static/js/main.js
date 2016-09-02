$(document).ready(function() {
	$('.btn').click(function() {
		$.post('/events/'+$(this).attr('id'), function(res) {});
		$(this).toggleClass("join going");
		var count = parseInt($(this).parent().prev().text());
		$(this).parent().prev().text($(this).text() == 'Join' ? count + 1: count - 1);
		$(this).text($(this).text() == 'Join' ? 'Going!' : 'Join');
	});
});