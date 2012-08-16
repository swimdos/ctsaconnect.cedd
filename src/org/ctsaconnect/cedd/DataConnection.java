/**
 * 
 */
package org.ctsaconnect.cedd;

/**
 * General DataConnection Class
 * @author svwilliams
 * TODO svwilliams change to abstract class and switch to implements on subclasses
 */
public class DataConnection {

	/**
	 * Server address of the Host that the dataconnection will use
	 */
	private String hostName = "";
	
	/**
	 * Default Constructor
	 */
	DataConnection(){
		//TODO svwilliams add log warning for not setting hostName
	}
	
	/**
	 * Constructor with hostname
	 * @param host the name of the server you wish to connect to
	 */
	DataConnection(String host){
		this.setHostName(host);
	}
	
	/**
	 * Tests to see if the connection to the host is possible
	 * 
	 * This method should be overloaded if you are using a method that requires
	 * more information such as port, username, ssh key, etc
	 * @return status of the host
	 */
	public boolean isAlive(){
		//TODO svwilliamsadd server connection test
		return true;
	}

	/**
	 * 
	 * @return
	 */
	public String getHostName() {
		return hostName;
	}

	/**
	 * 
	 * @param hostName
	 */
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	
}
