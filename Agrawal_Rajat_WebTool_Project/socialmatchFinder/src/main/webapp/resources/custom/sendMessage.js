$(document).ready(function() {

	$("#send").click(function() {
			

			var div = $(this).parent().find("#message");
			var message = $(this).parent().find("#message").val();
			var chatArea = $(this).parent().parent().find("#chatArea");
			var userId = $(this).parent().find("#userId").val();
				$.ajax(
						{
							type : "GET",
							data : "userId=" + userId + "&message=" + message,
							url : "sendMessage",
							success : function(data) {
										debugger
										$(chatArea).append(data);
							},
							error : function(xhr, ajaxOptions, thrownError) {
		                        alert(xhr.status);
		                        alert(thrownError);
								}
					});

	});
});