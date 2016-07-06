<%@page import="com.ipartek.formacion.controller.Constantes"%>
<%@page import="com.ipartek.formacion.pojo.Modulo"%>
<%@page import="java.util.List"%>
<jsp:include page="../includes/header.jsp"/> 


<main >
	<a class="btn btn-warning" href="index.jsp">Atras</a>
		<a class="btn btn-info" href="<%=Constantes.SERVLET_MODULOS+"?"+Constantes.PAR_CODIGO+"="+Modulo.CODIGO_MODULO%>">
		<span class="fa fa-plus" aria-hidden="true">Modulos</span></a> 

		<%		
			List<Modulo> modulos = (List<Modulo>) request.getAttribute("listado_modulos");
			if(modulos!=null){
				int i=1;
				String formulario ="";
				for(Modulo modulo: modulos){
					formulario = "<form class='col-xs-2' action='"+Constantes.SERVLET_MODULOS + "' method='post'>";
					//la variable opercion
					formulario +="<input type='hidden' " + "name='"+Constantes.PAR_OPERACION + "' value='"+Constantes.OP_DELETE+"'/>";
					//la variable del codigo del modulo
					formulario +="<input type='hidden' "+ "name='"+Constantes.PAR_CODIGO + "' value='"+modulo.getCodigo()+"'/>";
					//el boton de borrar
					formulario +="<button class='btn btn-danger'>Borrar</button>";
					formulario +="</form>";
					%>
					<div class="row">
						<a class="btn btn-info col-xs-10 col-md-6" href='<%=Constantes.SERVLET_MODULOS %>?<%=Constantes.PAR_CODIGO%>"="<%=modulo.getCodigo() %>'>
							<%=modulo.getNombre() %> </a>
						<%=formulario %>						
					</div>
					<%
					i++;
				}
			}
		%>
</main>
<%@ include file="../includes/footer.jsp" %>