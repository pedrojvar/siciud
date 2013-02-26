<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<script>
<!--
	function borrar_combo(combo){
		for(var i = combo.length - 1; i >= 0; i--) { if(navigator.appName == "Netscape") combo.options[i] = null; else combo.remove(i); }
		combo.options[0] = new Option("---","0");
	}

	<c:choose>
	  <c:when test="${sessionScope.idCombo==2}">
	  	borrar_combo(parent.document.entidades.entidad2);
	  	<c:forEach begin="0" items="${sessionScope.ajaxTablas}" var="tabla" varStatus="st">
	  	parent.document.entidades.entidad2.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${tabla.etiquetaTabla}"/>','<c:out value="${tabla.idTabla}"/>');
		</c:forEach>
	  </c:when>
	  <c:when test="${sessionScope.idCombo==3}">
	  	borrar_combo(parent.document.entidades.entidad3);
	  	<c:forEach begin="0" items="${sessionScope.ajaxTablas}" var="tabla" varStatus="st">
	  	parent.document.entidades.entidad3.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${tabla.etiquetaTabla}"/>','<c:out value="${tabla.idTabla}"/>');
		</c:forEach>
	  </c:when>
	  <c:when test="${sessionScope.idCombo==4}">
	  	borrar_combo(parent.document.entidades.entidad4);
	  	<c:forEach begin="0" items="${sessionScope.ajaxTablas}" var="tabla" varStatus="st">
	  	parent.document.entidades.entidad4.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${tabla.etiquetaTabla}"/>','<c:out value="${tabla.idTabla}"/>');
		</c:forEach>
	  </c:when>
	</c:choose>
//-->
</script>