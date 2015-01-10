<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<p>copy ${resource.path}

<%
	String dest = slingRequest.getParameter("to");
	pageContext.setAttribute("destinationPath", dest);
%>

<p>to:

<sling:include path="${destinationPath}" replaceSelectors="path-chooser" />

<form method="POST" action="${resource.path}" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI().replace(".remove","")%>/.." />

	<input type="hidden" name=":operation" value="copy" />
	<input type="hidden" name=":dest" value="${destinationPath}/" />
	<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />

	<button type="submit" value="${resource.path}">copy</button>
</form>

<a href="${appPath}.html${contentPath}/..">cancel</a>
