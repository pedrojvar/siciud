<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script>
	function borrar_combo(combo){
		for(var i = combo.length - 1; i >= 0; i--) { if(navigator.appName == "Netscape") combo.options[i] = null; else combo.remove(i); }
		combo.options[0] = new Option("---------------------------------","0");		
	}
	<c:choose>
	  	<c:when test="${requestScope.para==5}">
	  		borrar_combo(parent.document.nuevo.propProyCur);
	  		<c:if test='${requestScope.grupo=="1"}'>
	  		borrar_combo(parent.document.nuevo.propGrupoInv);
	  		borrar_combo(parent.document.nuevo.propInvesPrincId);
	  		</c:if>

			<c:forEach begin="0" items="${sessionScope.ajaxProyCur}" var="pro" varStatus="st2">
				parent.document.nuevo.propProyCur.options[<c:out value="${st2.count}"/>] = new Option('<c:out value="${pro.nombre}"/>','<c:out value="${pro.codigo}"/>');
			</c:forEach>
			<c:forEach begin="0" items="${sessionScope.ajaxGrupo}" var="pro" varStatus="st2">
				parent.document.nuevo.propGrupoInv.options[<c:out value="${st2.count}"/>] = new Option('<c:out value="${pro.nombre}"/>','<c:out value="${pro.codigo}"/>');
			</c:forEach>
		</c:when>
		<c:when test="${requestScope.para==8}">
	  		borrar_combo(parent.document.nuevo.propInvesPrincId);
			<c:forEach begin="0" items="${sessionScope.ajaxInvest}" var="pro" varStatus="st2">
				parent.document.nuevo.propInvesPrincId.options[<c:out value="${st2.count}"/>] = new Option('<c:out value="${pro.nombre}"/>','<c:out value="${pro.codigo}"/>');
			</c:forEach>
		</c:when>
		<c:when test="${requestScope.para==9}">		
  			borrar_combo(parent.document.nuevo.propDirPro);  			
			<c:forEach begin="0" items="${sessionScope.ajaxProfDir}" var="pro" varStatus="st2">
				parent.document.nuevo.propDirPro.options[<c:out value="${st2.count}"/>] = new Option('<c:out value="${pro.director}"/>','<c:out value="${pro.idDirector}"/>');
			</c:forEach>
			borrar_combo(parent.document.nuevo.proyectoinv);			 
		  	<c:forEach begin="0" items="${sessionScope.ajaxProyectos}" var="proyectos" varStatus="st">
				parent.document.nuevo.proyectoinv.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${proyectos.actividad}"/>', '<c:out value="${proyectos.idActividad}"/>');
			</c:forEach>
		</c:when>
	</c:choose>
</script>