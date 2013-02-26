package org.apache.jsp.adminArticulos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class NuevoArticulo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\n");
      out.write("<head>\r\n");
      if (_jspx_meth_c_005fimport_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("<script>\r\n");
      out.write("\tvar tip=0;\r\n");
      out.write("\tfunction cambioTipo(boton){\r\n");
      out.write("\t\tdocument.filtro.tipog.value=boton;\r\n");
      out.write("\t\tajaxGrupos(document.filtro.facultad);\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction ajaxGrupos(obj){\r\n");
      out.write("\t\tvar val=obj.value;\r\n");
      out.write("\t\t//document.filtro.facultad.value=val;\r\n");
      out.write("\t\tdocument.frmAjaxGrupo.accion.value=\"1\";\r\n");
      out.write("\t//\talert(val);\r\n");
      out.write("\t\tif(val!=0){\r\n");
      out.write("\t\t\tdocument.frmAjaxGrupo.dato[0].value=val;\r\n");
      out.write("\t\t\tdocument.frmAjaxGrupo.dato[1].value=document.filtro.tipog.value;\r\n");
      out.write("\t \t\tdocument.frmAjaxGrupo.target=\"frameOculto\";\r\n");
      out.write("\t\t\tdocument.frmAjaxGrupo.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction ajaxInvestig(obj){\r\n");
      out.write("\t\tvar val=obj.value;\r\n");
      out.write("\t\tdocument.frmAjaxGrupo.accion.value=\"2\";\r\n");
      out.write("\t\tif(val!=0){\r\n");
      out.write("\t\t\tdocument.frmAjaxGrupo.dato[0].value=val;\r\n");
      out.write("\t \t\tdocument.frmAjaxGrupo.target=\"frameOculto\";\r\n");
      out.write("\t// \t\talert(document.frmAjaxGrupo.accion.value+\" - \"+val);\r\n");
      out.write("\t\t\tdocument.frmAjaxGrupo.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction cambio(valor){\r\n");
      out.write("\t\tif(valor==1){\r\n");
      out.write("\t\t\tdocument.getElementById(\"r1\").style.display='';\r\n");
      out.write("\t\t\tdocument.getElementById(\"r2\").style.display='none';\r\n");
      out.write("\t\t\tdocument.filtro.tipo.value=1;\r\n");
      out.write("\t\t\ttip=1;\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tdocument.getElementById(\"r1\").style.display='none';\r\n");
      out.write("\t\t\tdocument.getElementById(\"r2\").style.display='';\r\n");
      out.write("\t\t\tdocument.filtro.tipo.value=2;\r\n");
      out.write("\t\t\ttip=2;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction enviar(){\r\n");
      out.write("\t\tif(validar())\r\n");
      out.write("\t\t\tdocument.filtro.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction validar(){\r\n");
      out.write("\t\tmensaje=\"\";\r\n");
      out.write("\t\tif(document.filtro.titulo.value==\"\"){\r\n");
      out.write("\t\t\tmensaje=mensaje+\"\\n-) Titulo del Artículo\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(tip==1){\r\n");
      out.write("\t\t\tif(document.filtro.investigador.value==\"0\"){\r\n");
      out.write("\t\t\t\tmensaje=mensaje+\"\\n-) Nombre Investigador\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(tip==2){\r\n");
      out.write("\t\t\tif(document.filtro.nombreAutor.value==\"\"){\r\n");
      out.write("\t\t\t\tmensaje=mensaje+\"\\n-) Nombre Investigador\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(document.filtro.apellidoAutor.value==\"\"){\r\n");
      out.write("\t\t\t\tmensaje=mensaje+\"\\n-) Apellido Investigador\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(document.filtro.de.value==\"\"){\r\n");
      out.write("\t\t\t\tmensaje=mensaje+\"\\n-) Procedencia del artículo\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tif(mensaje!=\"\"){\r\n");
      out.write("\t\t\tmensaje=\"Los siguientes campos son obligatorios: \"+mensaje;\r\n");
      out.write("\t\t\talert (mensaje);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t\treturn true;\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body onLoad=\"mensajeAlert(document.getElementById('msg'));\">\r\n");
      out.write("<br>\r\n");
      out.write("\t<form action='");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("' method=\"post\">\r\n");
      out.write("\t\t<table>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td><input type=\"image\" src=\"");
      if (_jspx_meth_c_005furl_005f1(_jspx_page_context))
        return;
      out.write("\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</form>\r\n");
      out.write("\t<form name=\"filtro\" method=\"post\" action='");
      if (_jspx_meth_c_005furl_005f2(_jspx_page_context))
        return;
      out.write("'>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"accion\" value=\"1\">\r\n");
      out.write("\t\t<table class=\"tablas\" align=\"center\" width=\"400px\">\r\n");
      out.write("\t\t<caption>Nuevo artículo para Revista Científica</caption>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"100%\" class=\"renglones\"><b>Título Artículo</b></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"100%\"><input style=\"width:100%\" type=\"text\" name=\"titulo\" value=\"\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"renglones\" width=\"80px\"><b>Tipo Artículo</b></td>\r\n");
      out.write("\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"tipo\">\r\n");
      out.write("\t\t\t\t\t<b>Interno</b> <input type=\"radio\" name=\"a\" onclick=\"cambio(1)\">\r\n");
      out.write("\t\t\t\t\t<b>Externo</b> <input type=\"radio\" name=\"a\" onclick=\"cambio(2)\" checked=\"checked\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr id=\"r1\">\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"100%\">\r\n");
      out.write("\t\t\t\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"renglones\"><b>Facultad:</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"115px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<select name=\"facultad\" onchange=\"ajaxGrupos(this)\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"1\">Tecnológica</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"2\">Ingeniería</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"3\">Medio Ambiente</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"4\">Educación</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"5\">Asab</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<b>Grupo</b><input type=\"radio\" name=\"boton\" checked value=\"1\" onClick=\"cambioTipo(1)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"tipog\" value=\"1\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<b>Semillero</b><input type=\"radio\" name=\"boton\" value=\"2\" onClick=\"cambioTipo(2)\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"4\" class=\"renglones\"><b><span id=\"para\">Grupo Investigación</span></b></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"4\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<select style=\"width:100%\" name=\"grupo\" onchange=\"ajaxInvestig(this)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value='0'>----------------------------------------</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"4\" class=\"renglones\"><b>Nombre Investigador:</b></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"4\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<select style=\"width:100%\" name=\"investigador\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value='0'>----------------------------------------</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr id=\"r2\">\r\n");
      out.write("\t\t\t\t<td colspan=\"6\">\r\n");
      out.write("\t\t\t\t\t<table width=\"100%\">\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"renglones\"><b>Nombres</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"text\" name=\"nombreAutor\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"renglones\"><b>Apellidos</b></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"text\" name=\"apellidoAutor\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"4\" class=\"renglones\"><b>De</b></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"4\"><input style=\"width:100%;\" type=\"text\" name=\"de\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" align=\"center\"><img src='");
      if (_jspx_meth_c_005furl_005f3(_jspx_page_context))
        return;
      out.write("' onclick=\"enviar()\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("\t<table>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td style=\"display:none\"><iframe name=\"frameOculto\" id=\"frameOculto\"></iframe></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<form method=\"post\" name=\"frmAjaxGrupo\" action='");
      if (_jspx_meth_c_005furl_005f4(_jspx_page_context))
        return;
      out.write("'>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"dato\" value=''>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"dato\" value=''>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"accion\" value='1'>\r\n");
      out.write("\t</form>\r\n");
      out.write("<script>\r\n");
      out.write("\tajaxGrupos(document.filtro.facultad);\r\n");
      out.write("\tcambio(document.filtro.boton.value);\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fimport_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f0 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    _jspx_th_c_005fimport_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fimport_005f0.setParent(null);
    // /adminArticulos/NuevoArticulo.jsp(7,0) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fimport_005f0.setUrl("/general.jsp");
    int[] _jspx_push_body_count_c_005fimport_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fimport_005f0 = _jspx_th_c_005fimport_005f0.doStartTag();
      if (_jspx_th_c_005fimport_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fimport_005f0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fimport_005f0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fimport_005f0.doFinally();
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f0);
    }
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f0.setParent(null);
    // /adminArticulos/NuevoArticulo.jsp(91,15) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/adminArticulos/AdminArticulosRevista.x");
    int _jspx_eval_c_005furl_005f0 = _jspx_th_c_005furl_005f0.doStartTag();
    if (_jspx_th_c_005furl_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f1 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f1.setParent(null);
    // /adminArticulos/NuevoArticulo.jsp(94,33) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f1.setValue("/comp/img/Buscar.gif");
    int _jspx_eval_c_005furl_005f1 = _jspx_th_c_005furl_005f1.doStartTag();
    if (_jspx_th_c_005furl_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f2 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f2.setParent(null);
    // /adminArticulos/NuevoArticulo.jsp(98,43) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f2.setValue("/adminArticulos/llenarArchivo.jsp");
    int _jspx_eval_c_005furl_005f2 = _jspx_th_c_005furl_005f2.doStartTag();
    if (_jspx_th_c_005furl_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f2);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f3 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f3.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f3.setParent(null);
    // /adminArticulos/NuevoArticulo.jsp(181,45) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f3.setValue("/comp/img/Enviar.gif");
    int _jspx_eval_c_005furl_005f3 = _jspx_th_c_005furl_005f3.doStartTag();
    if (_jspx_th_c_005furl_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f3);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f4 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f4.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f4.setParent(null);
    // /adminArticulos/NuevoArticulo.jsp(191,49) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f4.setValue("/adminArticulos/Ajax.x");
    int _jspx_eval_c_005furl_005f4 = _jspx_th_c_005furl_005f4.doStartTag();
    if (_jspx_th_c_005furl_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f4);
    return false;
  }
}
