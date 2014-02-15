package model;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL) 
@JsonPropertyOrder({
"path",
"description",
"operations",
"apiName"
})
public class Api extends Model {

@JsonProperty("apiName")
private String apiName;
@JsonProperty("path")
private String path;
@JsonProperty("description")
private String description;
@JsonProperty("operations")
private List<Operation> operations = new ArrayList<Operation>();
 
@JsonProperty("path")
public String getPath() {
return path;
}

@JsonProperty("path")
public void setPath(String path) {
this.path = path;
}

@JsonProperty("description")
public String getDescription() {
return description;
}

@JsonProperty("description")
public void setDescription(String description) {
this.description = description;
}

@JsonProperty("operations")
public List<Operation> getOperations() {
return operations;
}

@JsonProperty("operations")
public void setOperations(List<Operation> operations) {
this.operations = operations;
}

@JsonProperty("apiName")
public String getApiName()
{
	return apiName;
}

public void setApiName(String apiName)
{
	this.apiName = apiName;
}


public void updateOperationPaths()
{
	for(Operation op : this.operations)
	{
		op.setPath(this.path);
	}
}
 
}
 
