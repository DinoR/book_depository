google.load("visualization","1",{packages:["corechart"]}),jQuery(document).ready(function(){$("table.sort").tablesorter({sortList:[[1,1]]}),$("button.show_chart").bind("click",function(a){a.preventDefault(),$(this).animate({opacity:0},"slow",function(){$(this).hide()});var b=new google.visualization.DataTable;b.addColumn("string","Knige"),b.addColumn("number","Prodaja");var c=[];$(this).parents("div.genre").find("table tbody tr").each(function(a){c[a]=[$(this).find("td").first().text(),$(this).find("td").last().text()*1]}),b.addRows(c);var d={width:"100%",height:"100%",title:"Prodaja knjig v žanru: "+$(this).parents("h1").text()},e=$(this).parents("div.genre").find(".top_chart").attr("id"),f=new google.visualization.ColumnChart(document.getElementById(e));f.draw(b,d)})})