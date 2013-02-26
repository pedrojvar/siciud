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
		combo.options[0] = new Option("----------------------------------------","0");
		parent.document.nuevo.nombre.value="";
		parent.document.nuevo.idNombre.value="-1";
	}

	<c:choose>
	  <c:when test="${requestScope.para==5}">
	  		borrar_combo(parent.document.nuevo.grupo);
	  		borrar_combo(parent.document.nuevo.proyCur);
		  	<c:forEach begin="0" items="${sessionScope.ajaxGrupos}" var="grupos" varStatus="st">
				parent.document.nuevo.grupo.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${grupos.nombre}"/>','<c:out value="${grupos.codigo}"/>');
			</c:forEach>
			<c:forEach begin="0" items="${sessionScope.ajaxProyCur}" var="pro" varStatus="st2">
				parent.document.nuevo.proyCur.options[<c:out value="${st2.count}"/>] = new Option('<c:out value="${pro.nombre}"/>','<c:out value="${pro.codigo}"/>');
			</c:forEach>

		</c:when>
		<c:when test="${requestScope.para==6}">
			parent.document.nuevo.nombre.value='<c:out value="${sessionScope.ajaxDirector.nombre}" default="No hay nadie"/>';
			parent.document.nuevo.idNombre.value='<c:out value="${sessionScope.ajaxDirector.codigo}" default="0"/>';
		</c:when>
	</c:choose>
//-->
</script>