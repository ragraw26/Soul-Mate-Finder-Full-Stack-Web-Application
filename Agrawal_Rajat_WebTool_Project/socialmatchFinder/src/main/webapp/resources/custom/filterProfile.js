var text;

$(document).ready(function(){

	$("#submit").on('click', function(){
		
		debugger;	
		$.ajax(
			{
				type : "GET",
				data : {gender : $("#gender").val(), country : $("#country" ).val(),city : $("#city" ).val() },
				url : "searchAllUsers",
				datatype : "json",
				success : function(data) {					
						debugger;
						$("#searchArea").html(data);
				},
				error : function(xhr, ajaxOptions, thrownError) {
						
                        alert(xhr.status);
                        alert(thrownError);
						}
			});	
	});
});