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
		combo.options[0] = new Option("-----------------","0");
	}

	<c:choose>
	  <c:when test="${requestScope.para==1}">
	  		borrar_combo(parent.document.nuevo.idProyectoCurr);

			<c:forEach begin="0" items="${sessionScope.ajaxProyCur}" var="pro" varStatus="st2">
				<c:if test="${sessionScope.integrante.idProyectoCurr==pro.codigo}">
				parent.document.nuevo.idProyectoCurr.options[<c:out value="${st2.count}"/>] = new Option('<c:out value="${pro.nombre}"/>','<c:out value="${pro.codigo}"/>','selected');
				</c:if>
				<c:if test="${sessionScope.integrante.idProyectoCurr!=pro.codigo}">
				parent.document.nuevo.idProyectoCurr.options[<c:out value="${st2.count}"/>] = new Option('<c:out value="${pro.nombre}"/>','<c:out value="${pro.codigo}"/>');
				</c:if>
			</c:forEach>

		</c:when>
	</c:choose>
//-->
</script>