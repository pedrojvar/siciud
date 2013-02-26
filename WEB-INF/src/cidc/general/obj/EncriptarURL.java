package cidc.general.obj;

import java.io.IOException;

import java.io.Serializable;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.AlgorithmParameters;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory ;
import javax.crypto.spec.PBEParameterSpec;



public class EncriptarURL implements Serializable{

	private Cipher encryptCipher;
	private Cipher decryptCipher;
	private sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
	private sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
	final private String charset = "UTF-8";
	final private String defaultEncryptionPassword = "PAOSIDUFHQWER98234QWE378AHASDF93HASDF9238HAJSDF923";
	//PAOSIDUFHQWER98234QWE378AHASDF93HASDF9238HAJSDF923
	final private byte[] defaultSalt = {
	(byte) 0xa3, (byte) 0x21, (byte) 0x24, (byte) 0x2c,
	(byte) 0xf2, (byte) 0xd2, (byte) 0x3e, (byte) 0x19 };
	private String cryptoUrl;
	private String uncryptoUrl;
	
	public String getUncryptoUrl() {
		return uncryptoUrl;
	}
	public void setUncryptoUrl(String uncryptoUrl) {
		this.uncryptoUrl = decrypt(uncryptoUrl);
	}
	public String getCryptoUrl() {
		return cryptoUrl;
	}
	public void setCryptoUrl(String cryptoUrl) {
		
		this.cryptoUrl = encrypt(cryptoUrl);
	}
/**
 * The simplest constructor which will use a default password and salt to encode
 * the string.
 *
 * @return
 *
 * @throws SecurityException
 */
	public EncriptarURL() throws SecurityException {
		setupEncryptor(defaultEncryptionPassword, defaultSalt);
	}
/**
 * Dynamic constructor to give own key and salt to it which going to be used to
 * encrypt and then decrypt the given string.
 *
 * @param encryptionPassword
 * @param salt
 */
	public EncriptarURL(String encryptionPassword, byte[] salt) {
		setupEncryptor(encryptionPassword, salt);
	}
	public void init(char[] pass, byte[] salt, int iterations) throws SecurityException {
		try {
			PBEParameterSpec ps = new javax.crypto.spec.PBEParameterSpec(salt, 20);
			SecretKeyFactory kf = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
			//PBEWithMD5AndDES
			SecretKey k = kf.generateSecret(new javax.crypto.spec.PBEKeySpec(pass));
			encryptCipher = Cipher.getInstance("PBEWithMD5AndDES/CBC/PKCS5Padding");
			encryptCipher.init(Cipher.ENCRYPT_MODE, k, ps);
			decryptCipher = Cipher.getInstance("PBEWithMD5AndDES/CBC/PKCS5Padding");
			decryptCipher.init(Cipher.DECRYPT_MODE, k, ps);
		} catch (Exception e) {
			throw new SecurityException("Could not initialize CryptoLibrary: " + e.getMessage());
		}
	}
/**
 *
 * method to decrypt a string.
 *
 * @param str
 *            Description of the Parameter
 *
 * @return String the encrypted string.
 *
 * @exception SecurityException
 *                Description of the Exception
 */
	public synchronized String encrypt(String str) throws SecurityException {
		String parametros=null;
		String url=null;
		String retorno=null;
		if(str.contains("?")){
			parametros=str.substring(str.lastIndexOf("?"),str.length());
			url=str.substring(1,str.lastIndexOf("?"));
			
		}else
			url=str.substring(1,str.length());
		//System.out.println("---+++->"+url);
		try {
			byte[] utf8 = url.getBytes(charset);
			byte[] enc = encryptCipher.doFinal(utf8);
			if(parametros!=null)
				retorno=URLEncoder.encode(encoder.encode(enc),charset)+".cript"+parametros;
			else
				retorno=URLEncoder.encode(encoder.encode(enc),charset)+".cript";
			System.out.println("---**:)****->"+retorno);
			retorno=retorno.replace("%3D", "");
		}
		catch (Exception e)
		{
			throw new SecurityException("Could not encrypt: " + e.getMessage());
		}
		System.out.println("---******->"+retorno);
		return retorno;
	}
/**
 *
 * method to encrypting a string.
 *
 * @param str
 *            Description of the Parameter
 *
 * @return String the encrypted string.
 *
 * @exception SecurityException
 *                Description of the Exception
 */
	public synchronized String decrypt(String str) throws SecurityException {
		String parametros=null;
		System.out.println("---url a encriptar-->"+str);
		str=str.replace("-", "%3D");
		if(str.contains("?"))
			parametros=str.substring(str.lastIndexOf("?"),str.length());
		String url=str.substring(0,str.lastIndexOf(".cript"));
		try {
			byte[] dec = decoder.decodeBuffer(URLDecoder.decode(url,charset));
			byte[] utf8 = decryptCipher.doFinal(dec);
			if(parametros!=null)
				return new String(utf8, charset)+parametros;
			else
				return new String(utf8, charset);
		} catch (Exception e) {
			throw new SecurityException("Could not decrypt: " + e.getMessage());
		}
	}
	private void setupEncryptor(String defaultEncryptionPassword, byte[] salt) {
		java.security.Security.addProvider(new com.sun.crypto.provider.SunJCE());
		char[] pass = defaultEncryptionPassword.toCharArray();
		int iterations = 3;
		init(pass, salt, iterations);
	}

	
	public synchronized String encriptar2(String url){

		String miClave="miclave";
		SecretKeyFactory kf =null;
		SecretKey clave=null;
	    AlgorithmParameters algParams=null;
	    byte[] encodedAlgParams=null;
		try {
			 Cipher c= Cipher.getInstance("PBEWithMD5AndDES");
			 algParams = c.getParameters();
			 kf = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
			 clave = kf.generateSecret(new javax.crypto.spec.PBEKeySpec(miClave.toCharArray()));
			 c.init(Cipher.ENCRYPT_MODE, clave);
			 byte[] cipherText = c.doFinal("This is just an example".getBytes());
			 encodedAlgParams = algParams.getEncoded();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new String(encodedAlgParams);
	 
	}

	public static void main(String arg[]){
		EncriptarURL s=new EncriptarURL();
		System.out.println("***Encriptado-->"+s.encriptar2("Documentos/Actividades.jsp"));
	//	System.out.println("***Salida-->"+s.decrypt("ktwpLi8Lp58EftVPd1%2BVJxoRsqa2W3578FnX0X2vV8c%3D.cript"));
	}
}
