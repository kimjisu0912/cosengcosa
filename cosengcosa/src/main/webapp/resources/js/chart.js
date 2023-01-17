/**
 * myPageMain Chart 관련 js
 */

window.onload = function() { // 페이지 로드 시 실행
	
	drawChart();
}

function drawChart () { 

	var myChart = echarts.init(document.getElementById('chart')); // echarts init 메소드로 id=chart인 DIV에 차트 초기화

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