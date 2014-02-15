package model;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Model
{

	public final static ObjectMapper OBJECT_MAPPER = new ObjectMapper();

	static
	{
		OBJECT_MAPPER.configure( DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	}
	public Model()
	{
		 
	}
	
    public String toString()
    {
    	try { 
    		return OBJECT_MAPPER.writeValueAsString(this); 
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return super.toString();
    }

}
