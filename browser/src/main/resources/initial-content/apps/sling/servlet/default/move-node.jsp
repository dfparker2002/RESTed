<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<p>move ${resource.path}

<%
	String dest = slingRequest.getParameter("to");
	pageContext.setAttribute("destinationPath", dest);
%>

<p>to:

<sling:include path="${destinationPath}" replaceSelectors="path-chooser" />

<form method="POST" action="${resource.path}" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI().replace(".remove","")%>/.." />

	<input type="hidden" name=":operation" value="move" />
	<input type="hidden" name=":dest" value="${destinationPath}/" />

	<button type="submit" value="${resource.path}">move</button>
</form>

<a href="${appPath}.html${contentPath}/..">cancel</a>
