//= require jquery
//= require jquery_ujs
//= require jquery.tablesort.js


google.load("visualization", "1", {packages:["corechart"]});

jQuery(document).ready(function() {
	$("table.sort").tablesorter({ sortList: [[1,1]] });
	$("button.scatter").bind("click", function(e) {
		$(this).animate({opacity: 0}, "slow", function() {$(this).hide();});
        var data = new google.visualization.DataTable();
        data.addColumn('number', 'y');
        data.addColumn('number', 'x');
		var values = [];
		$(this).parents('div.genre').find("table tbody tr").each(function(index) {
			values[index] = [$(this).find("td").first().text()*1000, $(this).find("td").last().text()*1000]
		});
		data.addRows(values);
		
        var options = {
		  width: '100%', height: 700,
          title: 'Združevanje žanrov',
          legend: 'none'
        };
		jQuery("div.scatter_chart").height(700);
		var id = $(this).parents('div.genre').find(".scatter_chart").attr("id");
        var chart = new google.visualization.ScatterChart(document.getElementById(id));
		chart.draw(data, options);
		
	});
	$("button.show_chart").bind("click", function(e) {
		e.preventDefault();
		$(this).animate({opacity: 0}, "slow", function() {$(this).hide();});
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



