<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="planaccion" class="cidc.planAccion.obj.PlanAccionDatos" scope="session"/>
<jsp:setProperty name="planaccion" property="*"/>
<jsp:useBean id="actividad" class="cidc.planAccion.obj.Actividades" scope="session"/>
<jsp:setProperty name="actividad" property="*"/>
<c:import url="/planAccion/PlanAccion.x"/>
