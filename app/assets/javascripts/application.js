// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require_tree .
//= require jquery.turbolinks
// form-check-inline


// var divName = "";

// function clicker(name) {
// 	// this.id = namer
// 	console.log($(divName).text());
// divName = name; 
// console.log($(divName).text()); 
// };


function remove_fields(link){
	console.log("Passes Test");
	// $(link).prev("input[type=hidden").value = true;
	$(link).prevAll("input[type=hidden]").first().val("1");
	$(link).closest(".fields").hide();
	// $(link).up(".dual_fields").hide();
	
	// console.log($(link).closest(".fields"));
};

$("button").click(function(){
        $("fieldset").clone().appendTo("fieldset");
        console.log("Passed click");
    });

