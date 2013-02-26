<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<c:import url="/general.jsp"/>
<script>
	function ver(id){
		document.res.id.value=id;
		document.res.submit();
	}
</script>
</head>
<body>
	<br>
	<div align="center">
	<a href='<c:url value="/Resultados/Convocatorias/AdminResConv.x?ano=${requestScope.ano}" />'><img border="0" src='<c:url value="/comp/img/Atras.gif" />'></a>
	</div>
	<br>

	<table align="center" class="tablas" cellspacing="1" width="95%">
		<caption>Proyectos Inscritos</caption>
		<tr>
			<td class="renglones"><b>#</b></td>
			<td align="center" class="renglones"><b>Nombre Proyecto Investigación</b></td>
			<td width="170px" align="center" class="renglones"><b>Director Proyecto</b></td>
			<td width="75px" class="renglones" align="center"><b>Estado</b></td>
		</tr>
		<c:forEach begin="0" items="${requestScope.listado}" var="lista" varStatus="st">
		<tr <c:if test="${st.count mod 2==0}">class="trb"</c:if>>
			<td class="texto"><c:out value="${st.count}"/></td>
			<td class="texto"><c:out value="${lista.nombrePropuesta}"/></td>
			<td width="170px" class="texto"><c:out value="${lista.nombreInvestigador}"/></td>
			<td align="center" width="75px">
				<c:if test="${lista.estado==1}"><img src='<c:url value="/comp/img/est9.gif"/>' ></c:if>
				<c:if test="${lista.estado==2}"><img src='<c:url value="/comp/img/est9.gif"/>' ></c:if>
				<c:if test="${lista.estado==3}"><img src='<c:url value="/comp/img/est7.gif"/>' ></c:if>
				<c:if test="${lista.estado==4}"><img src='<c:url value="/comp/img/est8.gif"/>' ></c:if>
				<c:if test="${lista.estado==5}"><b>No evaluado</b></c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	</form>
</body>
</html>
