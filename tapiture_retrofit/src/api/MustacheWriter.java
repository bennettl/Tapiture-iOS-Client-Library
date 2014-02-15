package api;

import java.io.File;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import com.google.common.io.Files;

public class MustacheWriter
{
	private static Logger Logger						= LoggerFactory.getLogger(MustacheWriter.class.getCanonicalName());
	private static String INTERFACE_TEMPLATE_PATH 		= "./templates/iOS_InterfaceService.mustache";
	private static String IMPLEMENTATION_TEMPLATE_PATH 	= "./templates/iOS_ImplementationService.mustache";
	private Map<String, Object> scopes 					= null;
	
	public MustacheWriter(JsonNode source)
	{
		this.scopes = model.Model.OBJECT_MAPPER.convertValue(source,new TypeReference<Map<String, Object>>() {});
		System.out.println(scopes);
	}
	
	public void writeTemplates(String path)
	{
		try
		{
			// Write interface file (.h)
			 File file			 	= new File(path + "Service.h");
			 Writer writer 			= Files.newWriter(file, Charset.defaultCharset());
			 MustacheFactory mf 	= new DefaultMustacheFactory();
			 Mustache mustache 		= mf.compile(INTERFACE_TEMPLATE_PATH);
			 mustache.execute(writer, this.scopes);
			 writer.flush();
			 writer.close();
			 // Write implementation file (.m)
			 file			 	= new File(path + "Service.m");
			 writer 			= Files.newWriter(file, Charset.defaultCharset());
			 mf 				= new DefaultMustacheFactory();
			 mustache 			= mf.compile(IMPLEMENTATION_TEMPLATE_PATH);
			 mustache.execute(writer, this.scopes);
			 writer.flush();
			 writer.close();
			 
		} catch (Exception e)
		{
			Logger.error(e.getMessage(),e);
		}	
	}
}
