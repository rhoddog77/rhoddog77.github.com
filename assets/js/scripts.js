$(init);

function init() {
	$("#portfolioContent").css("display", "none");
}


function showDiv(myVar) {
	if(myVar == "home") {
		$('#homeContent').css("display", "block");
		$('#portfolioContent').css("display", "none");
	} else if(myVar == "portfolio") {
		$('#homeContent').css("display", "none");
		$('#portfolioContent').css("display", "block");
	}
}