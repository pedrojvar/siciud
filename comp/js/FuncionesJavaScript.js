function eliminaFormatoMoneda(valorMoneda){
	var vect=new Array();
	vect=valorMoneda.split(',');
	var num="";
	num=vect[0].substring(vect[0].lastIndexOf('$')+1,vect[0].length);
	for(var i=1;i<vect.length;i++){
		num=num+vect[i];
	}
	return num;
}

function validarExtArchivo(validar,archivo){
	var ext=archivo.value.substring(archivo.value.lastIndexOf('.')+1,archivo.value.length);
	if(ext!=validar){
		return false;
	}else{
		return true;
	}
}