<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<form method="post" action="${resource.path}.new-property.html" enctype="multipart/form-data">
	<fieldset>
		<legend>create new property</legend>
		
		<input type="text" name="property_name" value="" placeholder="name" required/>
		<input type="text" name="property_value" value="" placeholder="value" required/>

		<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI()%>" />
		<button type="submit">create</button>
	</fieldset>
</form>
