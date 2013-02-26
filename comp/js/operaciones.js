function num2Decimal(var numero){
	if(numero.length<4)return;
	pos=numero.indexOf('.');
	numero=numero.subString(numero.indexOf('.'),numero.length);
}