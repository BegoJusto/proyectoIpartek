package com.ipartek.formacion.pojo;

public enum Duracion {
	QUINCE(1, 15),
	VEINTE(2, 20),
	CUARENTAYCINCO(3, 45),
	OCHENTA(4, 80),
	NOVENTA(5, 90);
	
	
	private int codigo;
	private int duracion;
	
	Duracion(int codigo, int duracion){
		this.codigo = codigo;
		this.duracion = duracion;
		
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public int getDuracion() {
		return duracion;
	}

	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}
	

}
