/**
 * myPageMain Chart 관련 js
 */
window.onload = function() { // 페이지 로드 시 실행
	drawChart();
	drawHeatChart()
}

function drawChart () { 
	// echarts init 메소드로 id=chart인 DIV에 차트 초기화
	var myChart = echarts.init(document.getElementById('chart')); 
option = { // 차트를 그리는데 활용 할 다양한 옵션 정의
	tooltip: {
	    trigger: 'item'
	  },
	  legend: {
	    top: '5%',
	    left: 'center'
	  },
	  series: [
	    {
	      name: 'Skill',
	      type: 'pie',
	      radius: ['40%', '70%'],
	      avoidLabelOverlap: false,
	      itemStyle: {
	        borderRadius: 10,
	        borderColor: '#fff',
	        borderWidth: 2
	      },
	      label: {
	        show: false,
	        position: 'center'
	      },
	      emphasis: {
	        label: {
	          show: true,
	          fontSize: 40,
	          fontWeight: 'bold'
	        }
	      },
	      labelLine: {
	        show: false
	      },
	      data: [
	        { value: data.ja, name: 'Java' },
	        { value: data.db, name: 'DataBase' },
	        { value: data.js, name: 'JavaScript' },
	        { value: data.sp, name: 'Spring' },
	        { value: data.bs, name: 'BootStrap' },
	        { value: data.kt, name: 'Kotlin' },
	        { value: data.hl, name: 'Html' },
	        { value: data.jq, name: 'jQuery' },
	        { value: data.aj, name: 'ajax' }
	      ]
	    }
	  ]
};
    
	myChart.setOption(option); // 차트 디스플레이
} 

function drawHeatChart () { 
  var heatChart = echarts.init(document.getElementById('heatchart'));
	option = {
	  title: {
	    top: 0,
	    left: 'center',
	    text: '나의 학습열정',
	    textStyle: {
	    fontSize: 30,
	    fontStyle: "normal",
	    fontWeight: "bolder"
    	},
	  },
	  tooltip: {
	  size: 10},
	  visualMap: {
	    min: 1,
	    max: 11,
	    type: 'piecewise',
	    splitNumber: 10,
	    orient: 'horizontal',
	    left: 'center',
	    top: 65,
	    inRange: {
	     color: ['#f9e6ff','#330066']
	    },
	  },
	  calendar: {
	    top: 120,
	    left: 30,
	    right: 30,
	    cellSize: ['auto', 20],
	    range: '2023',
	    itemStyle: {
	      borderWidth: 0.5
	    },
	    yearLabel: { show: false }
	  },
	  series: {
	    type: 'heatmap',
	    coordinateSystem: 'calendar',
	    data: heatData
	  }
	};
        heatChart.setOption(option);  
};