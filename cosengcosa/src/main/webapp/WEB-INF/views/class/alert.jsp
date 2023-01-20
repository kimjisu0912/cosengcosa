<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- sweatalert -->
<script>
	var msg = "<c:out value='${msg}'/>";
	var url1 = "<c:out value='${url1}'/>";
	var url2 = "<c:out value='${url2}'/>";
	alert(msg);
	location.href = url1+"&"+url2;
</script>