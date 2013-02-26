package cidc.logger;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

public class Log {

	public Log() {
		BasicConfigurator.configure();
	}
	
	public void mostrarLog(String mensaje){
		Logger log = Logger.getLogger("Logger SICIUD");
		log.warn("un warning");
		log.error("un error");
	}

}
