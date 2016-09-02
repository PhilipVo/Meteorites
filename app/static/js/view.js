$(document).ready(function() {
	$('.bttn').click(function() {
		$.post('/events/'+$(this).attr('id'), function(res) {});
		$(this).toggleClass("join going");
		$(this).text($(this).text() == 'Join' ? 'Going!' : 'Join');
	});

	$('form').submit(function() {
		console.log($(this).attr('action'))
		$.post($(this).attr('action'), $(this).serialize(), function(res) {
			$('#messages').html(res);
		});
		return false;
	});	

	$('.comments').hide();

	$('.messages').click(function() {
		$(this).parent().next().next().toggle();
	})	
});