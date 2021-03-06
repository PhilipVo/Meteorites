$(document).ready(function() {
	$('.bttn').click(function() {
		$.post('/events/'+$(this).attr('id'), function(res) {});
		$(this).toggleClass("join going");
		var id = 'count' + $(this).attr('id');
		var count = parseInt($('#'+id).text());
		$('#'+id).text($(this).text() == 'Join' ? count + 1: count - 1);		
		$(this).text($(this).text() == 'Join' ? 'Going!' : 'Join');
		return false;
	});

	$('form').submit(function() {
		if ($(this).attr('submit') == 'message') 		
			$.post($(this).attr('action'), $(this).serialize(), function(res) {
				$('#messages').html(res);
			});
		else {
			var id = $(this).prev().attr('id')
			$.post($(this).attr('action'), $(this).serialize(), function(res) {
				if (id)
					$('#'+id).after(res);
				else
					$('.comments').before(res);
				// else
				// 	$().html(res);
				$('textarea#com').val('');		
			});			
		}
		return false;
	});	

	$('.comments').hide();

	$('.messages').click(function() {
		$(this).parent().next().next().toggle();
	})	
});