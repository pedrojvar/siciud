<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="parametrosInf" class="cidc.informes.obj.ParametrosInformeObj" scope="session"/>
<jsp:setProperty name="parametrosInf" property="*"/>
<jsp:useBean id="sentenciaSql" class="cidc.informes.obj.SQLObj" scope="session"/>
<jsp:setProperty name="sentenciaSql" property="*"/>
<c:import url="/Informes/AdminInformes.x"/>