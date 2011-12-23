// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
google.load("visualization", "1", {packages:["corechart"]});

$(function() {
	$("table.sort").tablesorter({ sortList: [[1,1]] });
	$("button.show_chart").bind("click", function(e) {
		e.preventDefault();
		$(this).fadeTo("slow", 0);
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Knige');
		data.addColumn('number', 'Prodaja');
		var values = [];
		$(this).parents('div.genre').find("table tbody tr").each(function(index) {
			values[index] = [$(this).find("td").first().text(), $(this).find("td").last().text()*1]
		});
		data.addRows(values);

		var options = {
		  width: '100%', height: '100%',
		  title: 'Prodaja knjig v žanru: ' + $(this).parents("h1").text()
		};
		var id = $(this).parents('div.genre').find(".top_chart").attr("id");
		var chart = new google.visualization.ColumnChart(document.getElementById(id));
		chart.draw(data, options);
	})
});	



