$(function(){
	var dataset = [5,10,15,20,25];
	
	var graph1 = d3.select("#graph1");
	
	graph1.selectAll("div")
				.data(dataset)
				.enter()
				.append("div")
				.attr("class","bar").style("height",function(d){
					return d + "px";
				});
});