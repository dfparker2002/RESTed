<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<form method="post" action="${ctxPath}${resource.path}" enctype="multipart/form-data">
	<fieldset>
		<legend>create new node</legend>
		<label for="node_name">node name</label>
		<input id="node_name" type="text" name=":name" value="" required placeholder="node name"/>

		<input type="hidden" name=":operation" value="import" />
		<input type="hidden" name=":contentType" value="json" />

		<label class="control-label" for="node_type">node type</label>
		
		<select name=":content">
			<option value="{ 'jcr:primaryType':'sling:Folder' }">Sling Folder</option>
			<option value="{ 'jcr:primaryType':'nt:unstructured' }">Unstructured Node</option>
			<option value="{ 'jcr:primaryType':'nt:file','jcr:content':{'jcr:primaryType':'nt:resource','jcr:data':'','jcr:mimeType':'text/plain'} }">Empty Text File</option>
		</select>

		<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI().replace(".create","")%>/.." />
		<button type="submit">create</button>
	</fieldset>
</form>
