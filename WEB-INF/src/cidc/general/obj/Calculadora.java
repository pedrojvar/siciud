package cidc.general.obj;

import java.util.ArrayList;
import java.util.List;

import com.japisoft.formula.*;
import cidc.general.db.CursorDB;
import cidc.general.servlet.ServletGeneral;
import cidc.indicadores.bancoVariables.db.BancoVariablesDB;

public class Calculadora
{
	CursorDB cursor=new CursorDB();
	BancoVariablesDB objVariableDB = new BancoVariablesDB(cursor, 2);

	public String operarFormula (String formula)
	{
		//System.out.println("Formula desde BD> " + formula);
		char [] f = formula.toCharArray();
		String variable="", reconstruccion="", respuesta = "";
		List listaVariables=new ArrayList();
		boolean bandera=false;
		for (int i =0; i<f.length; i++)
		{
			if(f[i]=='['){
				bandera=true;
				i++;
			}
			if(f[i]==']')
			{
				bandera=false;
				listaVariables.add(variable);
				variable="";
			}
			if(bandera)
				variable+=f[i];

		}

		for(int j=0; j<listaVariables.size();j++)
		{
			////System.out.println("LISTA VARIABLES-> "+listaVariables.get(j));
		}

		List listaValores = objVariableDB.consultaValorVariables(listaVariables);
		bandera=false;
		int contador=0;
		for(int k=0; k<f.length;k++)
		{
			if(f[k]=='[')
			{
				bandera=true;
				reconstruccion+=listaValores.get(contador);
				contador++;
			}
			if(f[k]==']')
			{
				bandera=false;
				k++;
			}
			if(!bandera && (k<f.length))
			{
				reconstruccion+=f[k];
			}

		}

		//System.out.println("Reconstrucción="+reconstruccion);

		FormulaFactory mFac = FormulaFactory.getInstance();
		Formula mForm = mFac.getFormula(reconstruccion);

		try
		{
			respuesta = String.valueOf(mForm.evaluate());
		}
		catch( Throwable ex )
		{
			respuesta = "error";
		}
		return respuesta;
	}
}
