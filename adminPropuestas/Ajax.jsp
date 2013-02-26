<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script>
<!--
	function borrar_combo(combo){
		for(var i = combo.length - 1; i >= 0; i--) { if(navigator.appName == "Netscape") combo.options[i] = null; else combo.remove(i); }
		combo.options[0] = new Option("----","");
	}
	<c:choose>
	  <c:when test="${requestScope.para==7}">
		borrar_combo(parent.document.filtro.num);
	  	<c:forEach begin="0" items="${requestScope.ajaxNumeros}" var="num" varStatus="st">
			parent.document.filtro.num.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${num}"/>','<c:out value="${num}"/>');
		</c:forEach>
	  </c:when>
	  <c:when test="${requestScope.para==8}">
	  	borrar_combo(parent.document.filtro.proyectoCur);
	  	<c:forEach begin="0" items="${requestScope.ajaxProyCur}" var="proy" varStatus="st">
			parent.document.filtro.proyectoCur.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${proy.nombre}"/>','<c:out value="${proy.codigo}"/>');
		</c:forEach>
	  </c:when>
	 </c:choose>
//-->
</script>