<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<p>Are you really sure you want to remove this node?
<form method="POST" action="${ctxPath}${resource.path}" enctype="multipart/form-data">
	<input type="hidden" name=":operation" value="delete" />
	<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI().replace(".remove","")%>/.." />

	<button type="submit" name=":applyTo" value="${resource.path}">remove</button>
</form>
