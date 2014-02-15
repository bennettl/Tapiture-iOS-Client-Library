package model;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
"apiVersion",
"swaggerVersion",
"basePath",
"resourcePath",
"apis",
"models"
})
public class SwaggerApi extends Model  {

@JsonProperty("apiVersion")
private String apiVersion;
@JsonProperty("swaggerVersion")
private String swaggerVersion;
@JsonProperty("basePath")
private String basePath;
@JsonProperty("resourcePath")
private String resourcePath;
@JsonProperty("apis")
private List<Api> apis = new ArrayList<Api>();
 
 
@JsonProperty("apiVersion")
public String getApiVersion() {
return apiVersion;
}

@JsonProperty("apiVersion")
public void setApiVersion(String apiVersion) {
this.apiVersion = apiVersion;
}

@JsonProperty("swaggerVersion")
public String getSwaggerVersion() {
return swaggerVersion;
}

@JsonProperty("swaggerVersion")
public void setSwaggerVersion(String swaggerVersion) {
this.swaggerVersion = swaggerVersion;
}

@JsonProperty("basePath")
public String getBasePath() {
return basePath;
}

@JsonProperty("basePath")
public void setBasePath(String basePath) {
this.basePath = basePath;
}

@JsonProperty("resourcePath")
public String getResourcePath() {
return resourcePath;
}

@JsonProperty("resourcePath")
public void setResourcePath(String resourcePath) {
this.resourcePath = resourcePath;
}

@JsonProperty("apis")
public List<Api> getApis() {
return apis;
}

@JsonProperty("apis")
public void setApis(List<Api> apis) {
this.apis = apis;
}
 
@JsonProperty("apiName")
public String getName()
{
	if( this.resourcePath == null )
	{
		return this.resourcePath;
	}
	String name = this.resourcePath.replaceAll("/", "");
	char c = name.charAt(0);
	name = Character.toUpperCase(c) + name.substring(1);
	return name;
}

public void renameApis()
{
	String name = this.resourcePath.replaceAll("/", "");
	char c = name.charAt(0);
	name = Character.toUpperCase(c) + name.substring(1);
	
	for( Api api : this.apis )
	{
		api.setApiName(name);
	}
}
 

}
 
