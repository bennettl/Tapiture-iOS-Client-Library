package api;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import model.Api;
import model.SwaggerApi;

import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
 
public class SwaggerImporter
{
	public final static String BASE_URL = "http://staging.tapiture.com:9012/api/resources.json";
	public final static String EXPORT_PREFIX = "./export/objc/";
	
	static
	{
		try
		{ 
			new File(EXPORT_PREFIX).mkdirs();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public final static ObjectMapper OBJECT_MAPPER = new ObjectMapper();
	
	static
	{
		OBJECT_MAPPER.configure( DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	}
	
	public final static PoolingHttpClientConnectionManager HTTP_MANAGER = new PoolingHttpClientConnectionManager();

	private static Logger Logger = LoggerFactory.getLogger(SwaggerImporter.class.getCanonicalName());
  
	private SwaggerApi baseApi = null;
	
	private List<SwaggerApi> apis = new ArrayList<SwaggerApi>();
	
	private String path = null;
	
	private String host = null; 
	
	public SwaggerImporter(String apiPath)
	{
		 this.path = apiPath;
		 
		 try
		{
			 
			URL url = new URL(this.path);
			this.host = url.getProtocol() +"://" +  url.getHost() + ":" + url.getPort();
			
		} catch (Exception e)
		{
			Logger.error(e.getMessage(),e);
		}
	}
	
	public void loadApi()
	{
		String data = loadUrlString(this.path);
		
		try
		{
			this.baseApi = (SwaggerApi)OBJECT_MAPPER.readValue(data, SwaggerApi.class);
			
			Logger.debug("baseApi: " + baseApi);
			
			if( baseApi != null )
			{
				for( Api rootApi : baseApi.getApis() )
				{
					Logger.debug("Loading api for " + rootApi.getDescription() + " loaded at " + rootApi.getPath());
					
					String apiPath = rootApi.getPath();
					
					if( apiPath.indexOf("{format}") > 0 )
					{ 
						apiPath = this.host  +  apiPath.substring(0,apiPath.indexOf("{format}")) + "json";
						
						Logger.debug("found api path: " +   apiPath);
						
						String apiData = loadUrlString(apiPath);
						
						SwaggerApi api =  (SwaggerApi)OBJECT_MAPPER.readValue(apiData, SwaggerApi.class);
						
						Logger.debug("loaded api: " + api);
						
						api.renameApis();
						
						for( Api a : api.getApis() )
						{
							a.updateOperationPaths();
						}
						
						this.apis.add(api);
						
					}
				}
				 
			}

		} catch (Exception e)
		{
			Logger.error(e.getMessage(),e); 
		}
 		
		
	}
	
	public void writeApis()
	{
		for( SwaggerApi api : this.apis )
		{
			try
			{
 				JsonNode node 				= OBJECT_MAPPER.readTree(api.toString());
 				MustacheWriter writer		= new MustacheWriter(node);
 				String path 				= EXPORT_PREFIX + "BL"+ api.getName(); 
 				writer.writeTemplates(path);
				System.out.println(node);
			} catch (Exception e)
			{
				Logger.error(e.getMessage(),e);
			}
		}
	}
	
	public static String loadUrlString(String url)
	{
		CloseableHttpClient httpclient = HttpClients.custom().setConnectionManager(HTTP_MANAGER).build();

		try
		{ 
			Logger.debug("Loading url : " + url);
			
			HttpGet get = new HttpGet(url);

			ResponseHandler<String> responseHandler = new BasicResponseHandler();

			return httpclient.execute(get, responseHandler);
			  
		} catch(Exception e)
		{
			Logger.error(e.getMessage(),e);
			return null;
		}
			 
	}

	public static void main(String[] args)
	{
		SwaggerImporter importer = new SwaggerImporter(BASE_URL);
		
		importer.loadApi();
		
		importer.writeApis();
		

	}

}
