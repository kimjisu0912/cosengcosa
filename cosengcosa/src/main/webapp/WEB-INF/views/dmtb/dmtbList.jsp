<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<form method="post" id="frmdmtb">
<div class="row my-5" id="global-content">
	<div class="col"></div>
	<div class="col-8">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">동적테이블</h2>
			</div>
		</div>  		
		<div class="d-grid gap-2 d-md-block text-end">
			<button type="button" class="btn btn-primary" onclick="add();">추가</button>
			<button type="submit" class="btn btn-success" onclick="apply();">적용</button>
			<button type="button" class="btn btn-secondary" onclick="cancel();">취소</button>
		</div>
		<div class="row my-3">
			<div class="col">
				<table class="table" id="mytable">
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="20%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr class="table-dark">
							<th>NO</th>
							<th></th>
							<th>이름</th>
							<th>코드</th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>		
					</thead>
					<tbody class="text-secondary">
					<c:forEach var="d" items="${dmList}" varStatus="status">
						<tr>
							<td><span class="id_row_num" id="id_row_num"><c:out value="${ d.dmtbNo }"/></span></td>
							<td><input name="dmtbName[]" value="${ d.dmtbName }"/></td>
							<td><input name="dmtbCode[]" value="${ d.dmtbCode }"/></td>
							<td><button type="button" onclick="moveUp(this);" style="border: 0px;"><img src="resources/images/chevron-up.svg"></button></td>
							<td><button type="button" onclick="moveDown(this);" style="border: 0px;"><img src="resources/images/chevron-down.svg"></button></td>
							<td><button type="button" onclick="moveTop(this);" style="border: 0px;"><img src="resources/images/chevron-double-up.svg"></button></td>
							<td><button type="button" onclick="moveBottom(this);" style="border: 0px;"><img src="resources/images/chevron-double-down.svg"></button></td>
							<td><button type="button" onclick="trash(this);" style="border: 0px;"><img src="resources/images/trash.svg"></button></td>
						</tr>
					</c:forEach>
					</tbody>					
				</table>
			</div>			
		</div>
		
	</div>
	<div class="col"></div>
	<input type="hidden" value="0" id="tb_cnt">
</div>
</form>
<script type="text/javascript">
/*
function numbering(){
	var cnt = 1;
	$('#tb_dtl tr td:first-child span').each(function() {
		$(this).children().val(cnt++);
	});
}
*/
//행번호 매기기
function fnSetRowNo(){
    var span = $("#mytable tbody tr td span");  
    var span_cnt = span.length; // tbody안의 tr안에 td안에 span 태그들의 갯수
    console.log(span_cnt);
    if(span_cnt == 1){ // span이 한개일경우 순번 붙이기
        $("#id_row_num").text("1")
    }else{ // span이 여러개일경우 순번 붙이기
        $.each(span,function(i){
            $(this).text(i+1);
        });
    } 
}

function add(){
	var trlength = $('#mytable >tbody tr').length;
	console.log(trlength);
	if(trlength < 10){
		var cnt = $("#tb_cnt").val();
		cnt++;
		var str = "";
		str += '<tr id="tr'+cnt+'">';
		str += '<td><span class="id_row_num" id="id_row_num"><c:out value="${ d.dmtbNo }"/></span></td>';
		str += '<td><input name="dmtbName[]" value="${ d.dmtbName }"/></td>';
		str += '<td><input id="dcode'+cnt+'" name="dmtbCode[]" value="${ d.dmtbCode }"/></td>';
		str += '<td><button type="button" onclick="moveUp(this)" style="border: 0px;"><img src="resources/images/chevron-up.svg"></button></td>';
		str += '<td><button type="button" onclick="moveDown(this)" style="border: 0px;"><img src="resources/images/chevron-down.svg"></button></td>';
		str += '<td><button type="button" onclick="moveTop(this)" style="border: 0px;"><img src="resources/images/chevron-double-up.svg"></button></td>';
		str += '<td><button type="button" onclick="moveBottom(this)" style="border: 0px;"><img src="resources/images/chevron-double-down.svg"></button></td>';
		str += '<td><button type="button" onclick="trash(this)" style="border: 0px;"><img src="resources/images/trash.svg"></button></td>';
		str += '</tr>';
		
		$("#mytable > tbody:last").append(str);
		$("#tb_cnt").val(cnt);
		const rand = Math.random();
		$("#dcode"+cnt).val(rand);
		$("#hdmtbNo"+cnt).val(++trlength);
		fnSetRowNo();
	}else{
		alert("최대 10개까지만 가능합니다.");
		return false;
	}
	
}


function moveUp(el){
	var $tr = $(el).parent().parent(); 
	$tr.prev().before($tr);
	fnSetRowNo();
}

function moveDown(el){
	var $tr = $(el).parent().parent();
	$tr.next().after($tr);
	fnSetRowNo();
}

function moveTop(el){
	var $tr = $(el).closest('tr');
	$tr.closest('table').find('tr:eq(1)').before($tr);
	// $tr.closest('table') - 클릭한 요소의 부모 table 요소
	// .find('tr:first').before($tr) - 첫번째 tr 찾아서 그 앞에 클릭한 tr 요소 넣기(이동)
	fnSetRowNo();
}

function moveBottom(el){
	var $tr = $(el).closest('tr');
	$tr.closest('table').find('tr:last').after($tr);
	fnSetRowNo();
}

function trash(el){
	var tr = $(el).parent().parent();
	$(tr).remove();
	fnSetRowNo();
}

function apply(){
	$("#frmdmtb").attr("action", "applyDmtb").submit();
}

function cancel(){
	location.reload();
}
/*
function trash2(){
	$("input[name=delchk]:checked").each(function() {
        var tr = $(this).parent().parent();
		$(tr).remove();
	});
	numbering();
}
*/
</script>   