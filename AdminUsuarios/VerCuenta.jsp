<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp"/>
</head>
<script>

	function guardar(){
		if(validar())
			document.cuenta.submit();
	}
	function acc(com){

		if(com==5){
			document.cuenta.action='<c:url value="/AdminUsuarios/AdminCuenta.x"/>';
			document.getElementById("carga").style.display='';
			document.getElementById("carga2").style.display='none';
		}
		document.cuenta.accion.value=com;
		document.cuenta.submit();
	}

	function validar(){
	var nuevoPerfil="";
		for (var i=1;i<=(document.cuenta.per.length+1);i++){
			if(i!=2){
			alert("i="+(i)+"="+document.getElementById(i).checked);
				if(document.getElementById(i).checked){
					if(nuevoPerfil=="")
						nuevoPerfil=i;
					else
						nuevoPerfil=nuevoPerfil+","+i;
				}
			}
		}
		if(nuevoPerfil==""){
			alert("El Usuario debe tener por lo menos 1 perfil");
			return false;
		}
		document.cuenta.perfiles.value=nuevoPerfil;
		return true;
	//	alert("nuevo Perfil="+nuevoPerfil+"--"+document.cuenta.perfil.value)
	}
</script>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
	<form name="cuenta" action='<c:url value="/AdminUsuarios/llenar1.jsp"/>'>
	<input type="hidden" name="accion" value="3">
	<input type="hidden" name="id" value='<c:out value="${requestScope.infoCuenta.id}"/>'>
	<input type="hidden" name="perfiles" value="">
		<table class="tablas" align="center">
		<caption>Detalle de Cuenta de usuario</caption>
			<tr>
				<th><b>Nick:</b></th>
				<th><b>Nombre:</b></th>
				<th><b>Apellidos:</b></th>
			</tr>
			<tr>
				<td><input type="text" name="nick" value='<c:out value="${requestScope.infoCuenta.nick}"/>'></td>
				<td align="center"><c:out value="${requestScope.infoCuenta.nombre}"/></td>
				<td align="center"><c:out value="${requestScope.infoCuenta.apellido}"/></td>
			</tr>
			<tr>
				<td align="center"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar()"></td>
				<td><img src='<c:url value="/comp/img/Borrar.gif"/>' onclick="acc(4)"></td>
				<td id="carga2"><img src='<c:url value="/comp/img/AsigClave.gif"/>' onclick="acc(5)"></td>
				<td id="carga" style="display:none"><img src="<c:url value="/comp/img/cargando2.gif"/>"> Enviando Clave...</td>
			</tr>

			<tr>
				<td colspan="3" align="center">
					<table class="tablas" width="100%">
					<CAPTION>Perfiles de usuario</CAPTION>
					<tr>
						<th>&nbsp;</th>
						<th>id</th>
						<th>Perfil</th>
					</tr>
						<c:forEach begin="0" items="${requestScope.listaPerfiles}" var="lista" varStatus="st">
							<tr <c:if test="${(st.count mod 2)!=0}">class="trb"</c:if>>
							<c:if test="${lista.id!=2}">
								<td>
								<input type="checkbox" name="per" id='<c:out value="${st.count}" />'
								<c:forTokens items="${requestScope.infoCuenta.perfiles}" delims="," var="p">
								<c:if test="${st.count==p}">checked</c:if>
								</c:forTokens>
								>
								</td>
								<td><c:out value="${lista.id}"/></td>
								<td><c:out value="${lista.nombre}"/></td>
							</c:if>

							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>

		</table>
	</form>
</body>
<% session.removeAttribute(""); %>
</html>