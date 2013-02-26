<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script>
<!--
	function borrar_combo(combo){
		for(var i = combo.length - 1; i >= 0; i--) { if(navigator.appName == "Netscape") combo.options[i] = null; else combo.remove(i); }
		combo.options[0] = new Option("---","");
	}

	<c:choose>
	  <c:when test="${requestScope.para==1}">
		borrar_combo(parent.document.servicios.idServ);
	  	<c:forEach begin="0" items="${requestScope.ajaxServicios}" var="serv" varStatus="st">
			parent.document.servicios.idServ.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${serv.nombre}"/>','<c:out value="${serv.id}"/>');
		</c:forEach>
	  </c:when>
	  <c:when test="${requestScope.para==2}">
	  	<c:forEach begin="0" items="${requestScope.ajaxPerfiles}" var="perf" varStatus="st">
			parent.document.getElementById('per<c:out value="${perf}"/>').checked="checked";
		//	alert('i=<c:out value="${perf}"/>');
		</c:forEach>
	  </c:when>
	 </c:choose>
//-->
</script>