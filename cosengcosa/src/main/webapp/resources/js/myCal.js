/**
 * myPageMain Chart 관련 js
 */

window.onload = function() { // 페이지 로드 시 실행
	
	drawCal();
}
function drawCal () { 

	var myCal = echarts.init(document.getElementById('myCal'));	
	
	function getVirtualData(year) {
		
		
		const date = +echarts.time.parse(year + '-01-01');
		const end = +echarts.time.parse(year + '-12-31');
		const dayTime = 3600 * 24 * 1000;
		const data = [];
		for (let time = date; time <= end; time += dayTime) {
		    data.push([
		      echarts.time.format(time, '{yyyy}-{MM}-{dd}', false),
		      Math.floor(Math.random() * 10000)
		    ]);
		  }
		  return data;
		};
		
	option = {
	  visualMap: {
	    show: false,
	    min: 0,
	    max: 10000
	  },
	  calendar: {
	    range: '2023'
	  },
	  series: {
	    type: 'heatmap',
	    coordinateSystem: 'calendar',
	    data: getVirtualData('2023')
	  }
	};
	  
	myCal.setOption(option); // 차트 디스플레이	  
};