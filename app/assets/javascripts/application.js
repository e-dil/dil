//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .

$(document).ready(function(){
	// Table of Contents
	$("orth").each(function(i){
	    var o = $(this);
	    o.attr("id", o.attr("xml:id"))
	    $("#toc").append("<a href=\"#"+o.attr("id")+"\">" + o.text() + "</a>");
	});

	// Interlinking
	$("ref").each(function(i){
	    var o = $(this);
	    o.click(function(){ window.location = "/search?q=" + o.attr("target"); });
	});

	$("title").each(function(i){
	    var o = $(this);
		o.click(function(){
			alert(o.attr("xml:id"))
		});
	});
});
