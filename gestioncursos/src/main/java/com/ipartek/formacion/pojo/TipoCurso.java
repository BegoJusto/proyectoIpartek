package com.ipartek.formacion.pojo;

public enum TipoCurso {
	FUNDACION_TRIPARTITA(1, "Fundación Tripartita"),
	HOBETUZ(2, "Hobetuz"),
	LANBIDE(3,"Lanbide");
	
	private int codigo;
	private String valor;
	
	TipoCurso(int codigo, String valor){
		this.codigo = codigo;
		this.valor = valor;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}
