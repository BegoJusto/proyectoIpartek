<%@page import="java.util.Enumeration"%>
<%@page import="com.ipartek.formacion.pojo.TipoCurso"%>
<%@page import="com.ipartek.formacion.controller.Constantes"%>
<%@page import="com.ipartek.formacion.pojo.Curso"%>
<%@page import="com.ipartek.formacion.pojo.Modulo"%>
<%@page import="com.ipartek.formacion.pojo.Alumno"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<jsp:include page="../includes/header.jsp"/>	


		<%
		Curso curso = (Curso) request.getAttribute(Constantes.ATT_CURSO);
		int op = -1;
		String tGuardar ="";
		if(curso!=null){
			
			op = Constantes.OP_UPDATE;
			tGuardar = "Guardar";

		}else{

			curso = new Curso();
			op = Constantes.OP_CREATE;
			tGuardar = "Crear";
		}
		%>
		<div id="wrapper">
		<a class="btn btn-warning" href="<%=Constantes.SERVLET_CURSOS %>">Atras</a>

		
		<%
		if(curso!=null){
		%>
		
			<form class="form-inline" name="formcurso" id="formcurso" method='post'  action="<%=Constantes.SERVLET_CURSOS%>">
				<input type="hidden"  id="<%=Constantes.PAR_OPERACION %>" name="<%=Constantes.PAR_OPERACION %>"   value="<%=op %>"/>
				<input type="hidden"  id="<%=Constantes.PAR_CODIGO %>"  name="<%=Constantes.PAR_CODIGO %>"  value="<%=curso.getCodigo()%>"/>
				<input type="hidden"  id="<%=Constantes.PAR_TIPO_CURSO %>"  name="<%=Constantes.PAR_TIPO_CURSO %>"  value="<%=curso.getCodigo()%>"/>
				
				<div class="form-group">
					<label  class="col-xs-2 col-md-4"  for="<%=Constantes.PAR_NOMBRE%>">Nombre: </label>
					<input type="text" class="col-xs-10" name="<%=Constantes.PAR_NOMBRE%>"  id="<%=Constantes.PAR_NOMBRE%>"  value="<%=curso.getNombre() %>" />
				</div>
				
				<div class="form-group">
					<label  class="col-xs-2" >Módulos: </label>
					<div class="col-xs-10" >
					<%
					List<Modulo> modulos = (List<Modulo>) request.getAttribute(Constantes.ATT_LISTADO_MODULOS);
					int nHoras = 0;
					if(modulos != null){
						for(Modulo m : modulos){
							Map<Integer,Modulo> mods =(Map<Integer,Modulo>) curso.getModulos();
							boolean presente = false;
							if(presente){
								presente = true;
								nHoras += m.getDuracion().getDuracion();
							}
							%>
							<input type="checkbox"  <%= presente ? "checked" : "" %>  
							name=""  value="<%=m.getCodigo()%>">
					<%
						}
					}
					
					%>
					</div>
				</div>
				
				<div class="form-group">
					<label  class="col-xs-2" >Alumnos: </label>
					<div class="col-xs-10" >
					<%
					List<Alumno> alumnos = (List<Alumno>) request.getAttribute(Constantes.ATT_LISTADO_ALUMNOS);
					if(alumnos != null && alumnos.size() > 0){
						for(Alumno alumno : alumnos){
							%>
							<input type="checkbox"  <%=  curso.getAlumnos().containsKey(alumno.getDni()) ? "checked" : "" %> 
							name="<%=Constantes.PAR_LISTA_DE_ALUMNOS %>"  value="<%= alumno.getCodigo() %>" />
							<%= alumno.getNombre() + " " + alumno.getApellidos()%> 
					<%	}
							
					}
					
					%>
					</div>
				</div>
				
				<div class="form-group">
					<label  class="col-xs-2">Nº Horas: </label>
					<input type="text" class="col-xs-10" name=""  id=""  value="<%=nHoras %>" />
				</div>
				
				<div class="row">
				<div class="form-group">
					<label class="col-xs-2 col-md-4" >Tipo de Curso:</label>
					<div class="col-xs-10">
						<select name="<%=Constantes.PAR_TIPO_CURSO%>">
						<%
						TipoCurso[] tipoCursos =  TipoCurso.values();
							if(tipoCursos != null){
								for(TipoCurso tipCur: tipoCursos) {
						%>
							<option <%=curso.getTipoCurso().equals(tipCur) ? "selected" : "" %>
							value="<%= tipCur.getCodigo()%>"> <%= tipCur.getValor() %> </option>
							<%
								}
							}
							%>
						</select>
					</div>
				</div>
				</div>
				<button type="submit" class="btn btn-success"><%= tGuardar %></button>
			</form>
			
			
			
			
			
	<%	}
		%>
<%@ include file="../includes/footer.jsp" %>