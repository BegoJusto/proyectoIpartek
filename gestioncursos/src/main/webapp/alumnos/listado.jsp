<%@page import="com.ipartek.formacion.controller.Constantes"%>
<%@page import="com.ipartek.formacion.pojo.Alumno"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

<main>

		<a class="btn btn-warning" href="index.jsp">Atras</a>
		
		<a class="btn btn-info" href="<%=Constantes.SERVLET_ALUMNOS+"?" + Constantes.PAR_CODIGO+"=" + Alumno.CODIGO_ALUMNO%>"> Añadir Alumno</a>
<!--  		<span class="fa fa-plus" aria-hidden="true">Alumnos</span></a>  -->
		<%		
			List<Alumno> alumnos = (List<Alumno>) request.getAttribute("listado_alumnos");
			if(alumnos!=null){
				int i=1;
				String formulario ="";
				for(Alumno alumno: alumnos){
					
					formulario = "<form class='col-xs-2' action='" + Constantes.SERVLET_ALUMNOS + "' method='post'>";
					//la variable opercion
					formulario +="<input type='hidden' " + "name='"+ Constantes.PAR_OPERACION + "' value='"+Constantes.OP_DELETE+"'/>";
					//la variable del codigo del curso
					formulario +="<input type='hidden' "+ "name='" + Constantes.PAR_CODIGO + "' value='" + alumno.getCodigo()+
					 "'/>";
					//el boton de borrar
					formulario +="<button class='btn btn-danger'>Borrar</button>";
					formulario +="</form>";
					%>
					<div class="row ">
						<a class="btn btn-info left-aligned col-xs-10 col-md-6" href='<%=Constantes.SERVLET_ALUMNOS %>?<%=Constantes.PAR_CODIGO%>"="<%=alumno.getCodigo()  %>'>
							<%=alumno.getNombre()+ " " + alumno.getApellidos() %> </a>
						<%= formulario %>				
					</div>
					<%
					i++;
				}
			}
		%>
</main>
<%@include file="../includes/footer.jsp" %>					