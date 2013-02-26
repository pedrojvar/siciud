package cidc.general.obj;

public class Colores {

	public double dame_numero_aleatorio(int superior, int inferior)
	{
		int numPosibilidades = (superior + 1) - inferior;
		double aleat = Math.random() * numPosibilidades;
		aleat = Math.floor(aleat);
		aleat = (inferior + aleat);
		return aleat;
	}

	public String dame_color_aleatorio()
	{
		   String color_aleat="";
		   String hexadecimal[] = new String[16];
		   hexadecimal[0] = "0";
		   hexadecimal[1] = "1";
		   hexadecimal[2] = "2";
		   hexadecimal[3] = "3";
		   hexadecimal[4] = "4";
		   hexadecimal[5] = "5";
		   hexadecimal[6] = "6";
		   hexadecimal[7] = "7";
		   hexadecimal[8] = "8";
		   hexadecimal[9] = "9";
		   hexadecimal[10] = "A";
		   hexadecimal[11] = "B";
		   hexadecimal[12] = "C";
		   hexadecimal[13] = "D";
		   hexadecimal[14] = "E";
		   hexadecimal[15] = "F";
		   int inferior = 0;
		   int superior = hexadecimal.length-1;
		   for
		   (int i=0;i<6;i++)
		   {
		      color_aleat += hexadecimal[(int) dame_numero_aleatorio(superior, inferior)];
		   }
		   return color_aleat;
		}

}
