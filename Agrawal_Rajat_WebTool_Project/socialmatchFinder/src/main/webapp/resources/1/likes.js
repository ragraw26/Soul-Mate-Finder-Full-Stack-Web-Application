$(document).ready(function() {

	$(".wrapper").on('click', '.addLike', function(){
		debugger
		var link = $(this);
		var div = $(this).parent().parent();
		var postId = $(div).find("hidden").attr("value");
		//var like = $(div).find("span");
		var like = $(div).find(".like")
		
		$.ajax(
				{
					type : "GET",
					data : "id=" + postId,
					url : "addLike",
					success : function(data) {
								$(like).html(data);
					},
					error : function(xhr, ajaxOptions, thrownError) {
	                        alert(xhr.status);
	                        alert(thrownError);
							}
			});
	});
});