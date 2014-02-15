package model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
"name",
"description",
"paramType",
"required",
"allowMultiple",
"dataType"
})
public class Parameter extends Model  {

@JsonProperty("name")
private String name;
@JsonProperty("description")
private String description;
@JsonProperty("paramType")
private String paramType;
@JsonProperty("required")
private java.lang.Boolean required;
@JsonProperty("allowMultiple")
private java.lang.Boolean allowMultiple;
@JsonProperty("dataType")
private String dataType; 

@JsonProperty("name")
public String getName() {
	return name;
}
// Parameter name is the name of the variable, the only reason we need this is since 
// password name is "passsword' but password parameter name is '[password MD5String]'
@JsonProperty("parameterName")
public String getParameterName(){
	// If it's a password, include MD5String method to its name
	if (this.name.indexOf("password") == -1 ){
		return this.name;
	} else{
		return "[" + this.name + " MD5String]";	
	}
}

@JsonProperty("name")
public void setName(String name) {
	this.name = name;
}

@JsonProperty("description")
public String getDescription() {
return description;
}

@JsonProperty("description")
public void setDescription(String description) {
this.description = description;
}

@JsonProperty("paramType")
public String getParamType() {
return paramType;
}

@JsonProperty("paramType")
public void setParamType(String paramType) {
	
	char c = Character.toUpperCase(paramType.charAt(0));	
	this.paramType = c + paramType.substring(1);
}

@JsonProperty("required")
public java.lang.Boolean getRequired() {
return required;
}

@JsonProperty("required")
public void setRequired(java.lang.Boolean required) {
this.required = required;
}

@JsonProperty("allowMultiple")
public java.lang.Boolean getAllowMultiple() {
return allowMultiple;
}

@JsonProperty("allowMultiple")
public void setAllowMultiple(java.lang.Boolean allowMultiple) {
this.allowMultiple = allowMultiple;
}

@JsonProperty("dataType")
public String getDataType() {
return dataType;
}

@JsonProperty("dataType")
public void setDataType(String dataType) {
	char c = Character.toUpperCase(dataType.charAt(0));	
	this.dataType = c + dataType.substring(1); 
	if( this.dataType.toLowerCase().equals("int") || this.dataType.toLowerCase().equals("long")){
		this.dataType = "NSNumber *";
	} else if(this.dataType.toLowerCase().equals("file")){
		this.dataType = "NSData *";
	} else if(this.dataType.toLowerCase().equals("string")){
		this.dataType = "NSString *";
	}
}
 
} 

