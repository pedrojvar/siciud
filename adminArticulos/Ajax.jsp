<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script>
<!--
	function borrar_combo(combo){
		for(var i = combo.length - 1; i >= 0; i--) {
			if(navigator.appName == "Netscape")
				combo.options[i] = null;
			else
				combo.remove(i);
		}
		combo.options[0] = new Option("----------------------------------------","");
	}
	<c:choose>
	 <c:when test="${requestScope.para==1}">
	  		borrar_combo(parent.document.filtro.grupo);
	  		borrar_combo(parent.document.filtro.investigador);
		  	<c:forEach begin="0" items="${sessionScope.ajaxGrupos}" var="grupos" varStatus="st">
				parent.document.filtro.grupo.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${grupos.nombre}"/>','<c:out value="${grupos.codigo}"/>');
			</c:forEach>
		</c:when>
		<c:when test="${requestScope.para==2}">
			borrar_combo(parent.document.filtro.investigador);
			<c:forEach begin="0" items="${sessionScope.ajaxInvestigador}" var="pro" varStatus="st2">
				parent.document.filtro.investigador.options[<c:out value="${st2.count}"/>] = new Option('<c:out value="${pro.nombre}"/>','<c:out value="${pro.codigo}"/>');
			</c:forEach>
		</c:when>
	</c:choose>
//-->
</script>