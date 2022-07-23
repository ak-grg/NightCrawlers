$(document).ready(function() {
	//on click signup hide login and show registration form

	$("#signup").click(function(){
		$("#first").slideUp("fast" , function(){
			$("#second").slideDown("fast");
		});
	});
	//on click signin hide registeration and show login form

	$("#signin").click(function(){
		$("#second").slideUp("fast" , function(){
			$("#first").slideDown("fast");
		});
	});


});