
var args = require('system').args;
var page = require("webpage").create();
// var url = "http://live.7msport.com/";
var url = args[1];
var id = args[2];

var fs = require("fs");

page.open(url, function() {
	if (!id) {
		fs.write("index.html", page.content, "w");
	  	phantom.exit();
	}else{
		result = page.evaluate(function(id) {
	      return document.getElementById(id).innerHTML;
	    }, id);

	  	fs.write("webpage/"+id+".html", result, "w");
	  	phantom.exit();
	}
    
});
