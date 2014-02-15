package model;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
 @JsonPropertyOrder({
"httpMethod",
"summary",
"responseClass",
"nickname",
"parameters",
"path",
"argumentString",
"name"
})

public class Operation extends Model  {

@JsonProperty("path")
private String path;
@JsonProperty("httpMethod")
private String httpMethod;
@JsonProperty("summary")
private String summary;
@JsonProperty("responseClass")
private String responseClass;
@JsonProperty("nickname")
private String nickname;
@JsonProperty("postAnnotation")
private String postAnnotation;
@JsonProperty("parameters")
private List<Parameter> parameters = new ArrayList<Parameter>();
@JsonProperty("queryParameters")
private List<Parameter> queryParameters = new ArrayList<Parameter>();
@JsonProperty("pathParameters")
private List<Parameter> pathParameters = new ArrayList<Parameter>();
@JsonProperty("bodyParameters")
private List<Parameter> bodyParameters = new ArrayList<Parameter>();

//// Return if path has url component, use for mustache conditional
//@JsonProperty("pathHasURLComponent")
//public boolean pathHasURLComponent() {
//	return path.contains("url");
//}

@JsonProperty("httpMethod")
public String getHttpMethod() {
	return httpMethod;
}

@JsonProperty("httpMethod")
public void setHttpMethod(String httpMethod) {
	this.httpMethod = httpMethod;
}

@JsonProperty("summary")
public String getSummary() {
	return summary;
}

@JsonProperty("summary")
public void setSummary(String summary) {
	this.summary = summary;
}

@JsonProperty("responseClass")
public String getResponseClass() {
	return responseClass;
}

@JsonProperty("responseClass")
public void setResponseClass(String responseClass) {
	this.responseClass = responseClass;
}

@JsonProperty("nickname")
public String getNickname() {
	return nickname;
}

@JsonProperty("nickname")
public void setNickname(String nickname) {
	this.nickname = nickname;
}

@JsonProperty("parameters")
public List<Parameter> getParameters() {
	return parameters;
}

@JsonProperty("queryParameters")
public List<Parameter> getQueryParameters() {
	return queryParameters;
}

@JsonProperty("pathParameters")
public List<Parameter> getPathParameters() {
	return pathParameters;
}

@JsonProperty("bodyParameters")
public List<Parameter> getBodyParameters() {
	return bodyParameters;
}

@JsonProperty("parameters")
public void setParameters(List<Parameter> parameters) {
	this.parameters = parameters;
	
	// Set query/body/path parameters
	for( int i = 0; i < this.parameters.size(); i++ )
	{ 
		Parameter p = this.parameters.get(i);
		
		// Only allow 'Query' parameters to be part of dictionary
		if (p.getParamType().equals("Path")){
			this.pathParameters.add(p);
		} else if (p.getParamType().equals("Query")){
			this.queryParameters.add(p);
		} else if (p.getParamType().equals("Body")){
			this.bodyParameters.add(p);
		}
	}
}

public String getPath()
{
	return path;
}

public void setPath(String path)
{
	this.path = path;
}

@JsonProperty("title")
public String getTitle()
{
	if( this.nickname == null )
	{
		return null;
	}
	
	Character c = Character.toUpperCase(this.nickname.charAt(0));
	return c + this.nickname.substring(1);
}


@JsonProperty("postAnnotation")
public String getPostAnnotation()
{
	if( this.postAnnotation != null )
	{
		return this.postAnnotation;
	}
	
	boolean needsAnnotation = false;
	
	for( int i = 0; i < this.parameters.size(); i++ )
	{ 
		Parameter p = this.parameters.get(i);
		if( p.getParamType().toLowerCase().equals("body") )
		{
			needsAnnotation = true;
			break;
		}
	}
	
	if( needsAnnotation )
	{ 
		for( int i = 0; i < this.parameters.size(); i++ )
		{ 
			Parameter p = this.parameters.get(i);
			p.setParamType("Part");
		}
		
		this.postAnnotation = "@Multipart";
		return this.postAnnotation;
	}
	else
	{
		return null;
	}
}
	
/************************** Function Prototype  **************************/

// Use for method name (with callback parameters)
@JsonProperty("argumentString")
public String argumentString()
{
	// Path parameter, use to build path
	// Query parameter, use to query dictionary 
	StringBuilder sb 			= new StringBuilder();
	String completetionString 	= "success:(void (^)(id responseObject))successBlock \n\t\t\t\tfailure:(void (^)(NSError *error))failureBlock";
	
	// No parameters
	if (this.parameters.isEmpty()){
		sb.append("With" + completetionString);
	}
	
	// One or more parameters
	for( int i = 0; i < this.parameters.size(); i++ )
	{ 
		Parameter p   = this.parameters.get(i);
		
		String pName  = this.capitalize(p.getName()); // capitalize paramenter names
		
		// If its the first argument preend "with" else, prepend "and"
		String prefix = "";
		if (i == 0){
			prefix = "With";		
		} else{
			prefix = "and";	
		}
		
		sb.append(prefix + pName + ":(" + p.getDataType() + ")" +  p.getName());
		
 		// As long as its not the last parameter, newline and tabs
		// If it is last, append callbackfunction
 		if( i < (this.parameters.size() - 1) ){
			sb.append("\n\t\t\t\t");
		} else {
 			sb.append("\n\t\t\t\t" + completetionString);
 		}
	}
	
	return sb.toString();
}

/************************** Function Body  **************************/

// Returns dictionary params
@JsonProperty("paramsString")
public String paramsString(){
	
	// If there are not query parameters, then return nil
	if (this.queryParameters.isEmpty()){
		return "nil";
	}
	
	// Build dictionary with query parameters
	StringBuilder sb = new StringBuilder();
	sb.append("@{"); // dictionary begins
	
	for( int i = 0; i < this.queryParameters.size(); i++ )
	{ 
		Parameter qp = this.queryParameters.get(i);
		
		sb.append("\n\t\t\t\t\t\t\t\t\t\t\t\t\t@\"" + qp.getName() + "\"\t : " + qp.getParameterName());
		
		 // If parameter is not last, add ',' delimiter
 		if ( i < (this.queryParameters.size() - 1) ){
			sb.append(", ");
		} 
	}
	
	sb.append("\n\t\t\t\t\t\t\t\t\t\t\t\t}"); // dictionary ends
	return sb.toString();
}

//Builds the formatted string for path
@JsonProperty("pathString")
public String pathString(){
	StringBuilder sb = new StringBuilder();

	// Build path with path parameters
	// Path begins, first %@ corresponds to self.baseURL
	sb.append("[NSString stringWithFormat:@\""); 
	sb.append(this.path);
	
	// If there are no parameters, then end path
	if (this.parameters.isEmpty()){
		// [NSString stringWithFormat:@"this.path"];
		sb.append("\"];");
		return  sb.toString();
	} else{
		// [NSString stringWithFormat:@"%@/this.path?%@",
		sb.append("?%@\", ");
	}
	
	// Appending params to format string
	for( int i = 0; i < this.pathParameters.size(); i++ )
	{ 
		Parameter pp = this.pathParameters.get(i);
		sb.append(pp.getName());
		// If parameter is not last, add ',' delimiter
//		if ( i < (this.pathParameters.size() - 1) ){
			sb.append(", ");
//		} 
	}
	
	// path ends
	// [params queryString]  converts params dict to query string. Make sure ti include NSDictioanry+QueryString category
	sb.append("[params queryString]]"); 
	
	String formattedPathString = sb.toString().replaceAll("\\{.+?\\}", "%@"); // replace anything inside {--} with %@  
	
	return formattedPathString;
}

// Returns AFHTTPRequestOperationManagerString base on different http methods (MULTI-FORM POST, GET, or POST)
@JsonProperty("AFHTTPRequestOperationManagerString")
public String AFHTTPRequestOperationManagerString(){
	StringBuilder sb = new StringBuilder();
	// Initialize request manger and make sure it accepts application/javascript
	sb.append("AFHTTPRequestOperationManager *manager  = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];\n");
	sb.append("\tmanager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@\"application/javascript\", @\"application/json\", @\"text/html\", @\"text/plain\", nil];\n\n");
	
	// Determine if this is a multiform post
	// It will be if there is a NSData type
	for( int i = 0; i < this.bodyParameters.size(); i++ )
	{ 
		Parameter bp = this.bodyParameters.get(i);
		if (bp.getDataType().indexOf("NSData") != -1){
			this.httpMethod = "MultiForm Post";
		}
	}

	if (this.httpMethod == "MultiForm Post"){
		//MULTI-FORM POST
		sb.append("\t[manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {\n");
		sb.append("NSString *randomString = [NSString genRandStringLength:25];\n");
		sb.append("\t\t[formData appendPartWithFileData:file name:randomString fileName:[NSString stringWithFormat:@\"%@.png\", randomString] mimeType:@\"application/octet-stream\"];");
		sb.append("\t} success:^(AFHTTPRequestOperation *operation, id responseObject){\n");
		sb.append("\t\tsuccessBlock(responseObject);\n");
		sb.append("\t} failure:^(AFHTTPRequestOperation *operation, NSError *error){\n");
		sb.append("\t\tfailureBlock(error);\n");
		sb.append("\t}];");
	} else{
		// POST/GET 
		sb.append("\t[manager " + this.httpMethod + ":path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){\n");
		sb.append("\t\tsuccessBlock(responseObject);\n");
		sb.append("\t} failure:^(AFHTTPRequestOperation *operation, NSError *error){\n");
		sb.append("\t\tNSLog(@\"Error: %@ ***** %@\", operation.responseString, error);\n");
		sb.append("\t\tfailureBlock(error);\n");
		sb.append("\t}];");
	}
	return sb.toString();
}

// Helper function
public String capitalize(String input){
	String output = input.substring(0, 1).toUpperCase() + input.substring(1);
	return output;
}
} 
