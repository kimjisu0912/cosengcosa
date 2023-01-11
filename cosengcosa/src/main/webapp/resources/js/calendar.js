/**
 * 
 */
 	$(function() {
 	
 		
		$('#datePicker1').datepicker({
		    closeText: "닫기",
	        prevText: "이전달",
	        nextText: "다음달",
	        currentText: "오늘",
	        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
	        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
	        dayNames: ["일","월","화","수","목","금","토"],
	        dayNamesShort: ["일","월","화","수","목","금","토"],
	        dayNamesMin: ["일","월","화","수","목","금","토"],
			changeMonth: true, // month 셀렉트박스 사용
			changeYear: true, // year 셀렉트박스 사용
	        weekHeader: "Wk",
	        dateFormat: "yy-mm-dd",
	        firstDay: 0,
	        isRTL: false,
	        showMonthAfterYear: true,
	        todayHighlight : true ,
	        toggleActive : true,
	        yearSuffix: "",
	        //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
            onClose: function( selectedDate ) {    
               // 시작일(fromDate) datepicker가 닫힐때
               // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
               $("#datePicker2").datepicker( "option", "minDate", selectedDate );
            }  
		    
		});//datepicker1 end
		
		$('#datePicker2').datepicker({
		    closeText: "닫기",
	        prevText: "이전달",
	        nextText: "다음달",
	        currentText: "오늘",
	        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
	        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
	        dayNames: ["일","월","화","수","목","금","토"],
	        dayNamesShort: ["일","월","화","수","목","금","토"],
	        dayNamesMin: ["일","월","화","수","목","금","토"],
			changeMonth: true, // month 셀렉트박스 사용
			changeYear: true, // year 셀렉트박스 사용
	        weekHeader: "Wk",
	        dateFormat: "yy-mm-dd",
	        firstDay: 0,
	        isRTL: false,
	        showMonthAfterYear: true,
	        todayHighlight : true ,
	        toggleActive : true,
	        yearSuffix: "",
	        //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
            onClose: function( selectedDate ) {    
               // 시작일(fromDate) datepicker가 닫힐때
               // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
               $("#datePicker1").datepicker( "option", "maxDate", selectedDate );
            }
		    
		});//datepicker2 end
	
		//input을 datepicker로 선언
        $("#datePicker1").datepicker();                    
        $("#datePicker2").datepicker();
        
        //From의 초기값을 오늘 날짜로 설정
        $('#datePicker1').datepicker('setDate', '-3M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후) today : 오늘
        //To의 초기값을 내일로 설정
        $("#datePicker2").datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	
	
	
	
	
	});//ready end
	
	
	
	