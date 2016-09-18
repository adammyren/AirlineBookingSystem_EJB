var return_active = false;
function toggleReturn(){
	if(return_active){
		$("#return_date").prop("disabled",false);
	}
	else{
		$("#return_date").prop("disabled",true);
	}
	return_active = !return_active;
}

/*function toggleReturn() {
	$("#return_date").toggle(0);
}*/

var register_active = false;
function toggleRegister() {

	$("#email").toggle(0);
	$("#password_repeat").toggle(0);
	if (register_active) {
		$("#toggle_button").text("Login");
		$("#login_heading").text("Register New User");
		$("#login_button").attr("value", "Register");
		$("#email").attr("required", true);
		$("#password_repeat").attr("required", true);
	} else {
		$("#toggle_button").text("Register New User");
		$("#login_heading").text("Login");
		$("#login_button").attr("value", "Login");
		$("#email").attr("required", false);
		$("#password_repeat").attr("required", false);

	}
	register_active = !register_active;
}

function showConfirm(number, nr_of_elements) {
	for (i = 1; i <= nr_of_elements; i++) {
		$("#confirm" + i).attr("type", "hidden");
		$("#input" + i).prop("disabled", false);
	}
	$("#input" + number).prop("disabled", true);
	$("#confirm" + number).attr("type", "submit");
}
