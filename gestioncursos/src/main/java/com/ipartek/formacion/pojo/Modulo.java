package com.ipartek.formacion.pojo;

import java.io.Serializable;

public class Modulo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final int CODIGO_MODULO = -1;
	private int codigo;
	private String nombre;
	private Duracion duracion;
	private String referencia;
	
	public Modulo() {
		super();
		setCodigo(CODIGO_MODULO);
		setNombre("");
		setReferencia("");
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Duracion getDuracion() {
		return duracion;
	}
	public void setDuracion(Duracion duracion) {
		this.duracion = duracion;
	}
	public String getReferencia() {
		return referencia;
	}
	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}
	
	
}
