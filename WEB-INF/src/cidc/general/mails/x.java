package cidc.general.mails;

public class x{

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int cont=0,numLetraASCII;
		char letra;

		StringBuffer codigo = new StringBuffer();
		while(cont<15){
		    numLetraASCII=(int)(Character.MAX_HIGH_SURROGATE*Math.random());//Esto es para que de numero del 0 al maximo numero de la codificacion UTF-16
		   	if(numLetraASCII>=48 && numLetraASCII<=57){
		   		letra=(char)numLetraASCII;//Es un caracter numerico
			    cont++;
			    codigo.append(letra);
		    }
		   	if(numLetraASCII>=65 && numLetraASCII<=90){
		   		letra=(char)numLetraASCII;//Es una letra mayuscula
		   	    cont++;
		   	    codigo.append(letra);
		    }
		    if(numLetraASCII>=97&& numLetraASCII<=122){
		       letra=(char)numLetraASCII;//Es una letra minuscula
		   	    cont++;
		        codigo.append(letra);
		    }
		}
	//	System.out.println("Caracter= "+codigo);
	}

}
