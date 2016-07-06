package com.ipartek.formacion.service;

import java.util.ArrayList;
import java.util.List;

import com.ipartek.formacion.pojo.Duracion;
import com.ipartek.formacion.pojo.Genero;
import com.ipartek.formacion.pojo.Idioma;

public class Util {
	private static final int LONGITUD_DNI = 9;
	public static boolean validarDni(String dni){
		boolean valido = false;
		dni = dni.toUpperCase();
		
		int nDni = Integer.parseInt(dni.substring(0, LONGITUD_DNI-1));
		char lDni = dni.substring(dni.length()-2, dni.length()-1).charAt(0);
		if(calcularLetra(nDni)==lDni){
			valido = true;
		}
			
		return valido;
	}
	private static char calcularLetra(int nDni){
		char letra = 0;
		final char [] letras = {'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E', 'T'};
		letra = letras[nDni % letras.length];
		return letra;
	}
	public static Genero parseGenero(String genero){
		Genero aux = Genero.MASCULINO;
		int codigo = Integer.parseInt(genero);
		if(codigo == Genero.FEMENINO.getCodigo()){
			aux = Genero.FEMENINO;
		}
		return aux;
	}
	public static Duracion parseDuracion(String duracion){
		Duracion d = Duracion.QUINCE;
		int codigo = Integer.parseInt(duracion);
		if(codigo == Duracion.VEINTE.getCodigo()){
			d = Duracion.VEINTE;
		}
		else {
			if(codigo == Duracion.CUARENTAYCINCO.getCodigo()){
				d = Duracion.CUARENTAYCINCO;
			}
			else {
				if(codigo == Duracion.OCHENTA.getCodigo()){
					d = Duracion.OCHENTA;
				}
				else {
					if(codigo == Duracion.NOVENTA.getCodigo()){
						d = Duracion.NOVENTA;
					}
				}
			}
		}
		return d;
	}
	
	public static List<Idioma> parseIdioma(String[] idiomas){
		List<Idioma> aux = null;
		aux = new ArrayList<Idioma>();
		for(int i = 0; i < idiomas.length; i++){
			Idioma idioma = Idioma.CASTELLANO;
			int codigoIdioma = Integer.parseInt(idiomas[i]);
			if(codigoIdioma == Idioma.EUSKERA.getCodigo()){
				idioma = Idioma.EUSKERA;				
			}
			else{
				if(codigoIdioma == Idioma.INGLES.getCodigo()){
					idioma = Idioma.INGLES;
				}
			}
			
			aux.add(idioma);
		}
		
		return aux;
	}
	
	public static boolean tryParseInt(String cadena){
		boolean exito = true;
		 int numero;
		try{
			numero = Integer.parseInt(cadena);
		}
		catch(NumberFormatException e){
			exito = false;
		}
		return exito;
	}
}
