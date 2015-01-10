<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<sling:adaptTo adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap" var="properties" />

<form method="post" action="${resource.path}" enctype="multipart/form-data">
	<fieldset>
		<legend>rendering scripts</legend>

	 	<label for="sling:resourceType">sling:resourceType</label>
		<input id="sling:resourceType" type="text" name="sling:resourceType" value="${resource.resourceType}" />
		<br>

	 	<label for="sling:resourceSuperType">sling:resourceSuperType</label>
		<input id="sling:resourceSuperType" type="text" name="sling:resourceSuperType" value="${resource.resourceSuperType}" />
		<br>

		<label for="jcr:primaryType">jcr:primaryType</label>
		<input id="jcr:primaryType" type="text" name="jcr:primaryType" value="${properties["jcr:primaryType"]}" disabled />
		<br>

		<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI()%>" />
		<button type="submit">update</button>
	</fieldset>
</form>
