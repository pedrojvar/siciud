<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<noscript><meta http-equiv="refresh" content="0;url=sinScript.html" /></noscript> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<link type='text/css' rel='stylesheet' href='<c:url value="/comp/css/formatos.css"/>'>
<link type='text/css' rel='stylesheet' href='<c:url value="/comp/css/fondos.css"/>'>
<link type='text/css' rel='stylesheet' href='<c:url value="/comp/css/tablas.css"/>'>
<script type='text/javascript' src='<c:url value="/comp/js/FuncionesJavaScript.js"/>'></script>

<script>

	function mensajeAlert(msg){
		if(msg){
			if(msg.value.length>0)
				alert(msg.value);
			msg.value="";
		}
	}
	if(top==self) top.location="/siciud/index.html";

</script>
<c:if test='${requestScope.msg!=null && requestScope.msg!=""}'>
	<input type="hidden" id='msg' name="msg" value='<c:out value="${requestScope.msg}"/>'>
</c:if>