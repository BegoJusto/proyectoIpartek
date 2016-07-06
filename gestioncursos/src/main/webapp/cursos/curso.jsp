<%@page import="java.util.Enumeration"%>
<%@page import="com.ipartek.formacion.pojo.TipoCurso"%>
<%@page import="com.ipartek.formacion.controller.Constantes"%>
<%@page import="com.ipartek.formacion.pojo.Curso"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

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
		<%=Constantes.SERVLET_CURSOS%>
			<form class="form-inline" name="formcurso" id="formcurso" method='post'  action="<%=Constantes.SERVLET_CURSOS%>">
				<input type="hidden"  id="<%=Constantes.PAR_OPERACION %>" name="<%=Constantes.PAR_OPERACION %>"   value="<%=op %>"/>
				<input type="hidden"  id="<%=Constantes.PAR_CODIGO %>"  name="<%=Constantes.PAR_CODIGO %>"  value="<%=curso.getCodigo()%>"/>
				<input type="hidden"  id="<%=Constantes.PAR_TIPO_CURSO %>"  name="<%=Constantes.PAR_TIPO_CURSO %>"  value="<%=curso.getCodigo()%>"/>
				<div class="form-group">
					<label  for="<%=Constantes.PAR_NOMBRE%>">Nombre: </label>
					<input type="text" class="col-xs-12 col-md-6" name="<%=Constantes.PAR_NOMBRE%>"  id="<%=Constantes.PAR_NOMBRE%>"  value="<%=curso.getNombre() %>" />
				</div>
				<div class="form-group">
					<label class="col-xs-2" >Tipo de Curso:</label>
					<div class="col-xs-10">
						<select name="<%=Constantes.PAR_TIPO_CURSO%>">
						<%
						TipoCurso[] tipoCursos =  (TipoCurso[]) request.getAttribute(Constantes.ATT_LISTADO_CURSOS);
							if(tipoCursos != null){
								for(TipoCurso tipCur: tipoCursos) {
						%>
							<option <%=TipoCurso.values().equals(tipCur.getValor()) ? "selected" : "" %>
							value="<%= tipCur.getValor()%>"> <%= tipCur.getValor()%> </option>
							<%
								}
							}
							%>
						</select>
					</div>
				</div>
				<button type="submit" class="btn btn-success"><%= tGuardar %></button>
			</form>
			
			
			
			
			
	<%	}
		%>
<%@ include file="../includes/footer.jsp" %>