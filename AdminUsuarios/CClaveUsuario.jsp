<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<jsp:useBean id="crypto" scope="session" class="cidc.general.obj.EncriptarURL"/>
<c:import url="/general.jsp"/>
</head>
<script>
	function guardar(){
		var formulario=document.clave;

		if(validar(formulario)){
			formulario.action='<c:url value="/AdminUsuarios/AdminCuenta.x"/>';
			formulario.submit();
		}
	}

	function validar(formulario){
		if(formulario.nick.value!=""){
			if(formulario.clave.value.length >= 4){
				if(formulario.clave.value!=formulario.verif.value){
					alert("la clave de confirmación no coincide");
					return false;
				}
			}else{
				alert("La clave debe ser mínimo de 4 caracteres");
				return false;
			}
			if(formulario.clave.value.length > 10){
				alert("la clave no debe superar los 10 caracteres");
				return false;
			}else{
				return true;
			}
		}else{
			alert("El campo del nombre de usuario no puede estar vacio");
			return false;
		}
		return true;
	}
</script>
<body onLoad="mensajeAlert(document.getElementById('msg'));">

<br>
	<form method="POST" name="clave"  method="post">
		<input type="hidden" name="accion" value="1">
		<table class="tablas" width="250px" align="center">
		<caption>Cambiar Nick y Clave de Usuario</caption>
			<tr>
				<td class="renglones"><b>Propietario</b></td>
				<td><c:out value="${sessionScope.loginUsuario.nombre}" default="nickname"/></td>
			</tr>
			<tr>
				<td class="renglones"><b>Usuario</b></td>
				<td><input style="width:100%" type="text" name="nick" maxlength="15" value='<c:out value="${sessionScope.loginUsuario.nick}" default="nickname"/>'></td>
			</tr>
			<tr>
				<td class="renglones"><b>Nueva Clave</b></td>
				<td><input style="width:100%" type="password" name="clave"></td>
			</tr>
			<tr>
				<td class="renglones"><b>Confirma Clave</b></td>
				<td><input style="width:100%" type="password" name="verif"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="letraRoja">La longitud de la clave debe estar ente 4 y 10 caracteres</p></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><img src='<c:url value="/comp/img/Enviar.gif"/>' onclick="guardar()"></td>
			</tr>
		</table>
	</form>
</body>
</html>