<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<%
	String dest = slingRequest.getParameter("to");
	pageContext.setAttribute("destinationPath", dest);
%>

<p>copy ${resource.parent.path}
<form method="POST" action="${resource.path}" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI().replace(".move","")%>/.." />

	<input type="hidden" name=":operation" value="move" />
	<input type="text" name=":dest" value="${resource.name}" />

	<button type="submit" value="${resource.path}">clone</button>
</form>

<p>to:

<sling:include path="${destinationPath}" replaceSelectors="path-chooser" />

<form method="POST" action="${resource.path}" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="${appPath}.html${destinationPath}" />

	<input type="hidden" name=":operation" value="copy" />
	<input type="hidden" name=":dest" value="${destinationPath}/" />
	<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />

	<button type="submit" value="${resource.path}">copy</button>
</form>

<a href="${appPath}.html${contentPath}/..">cancel</a>
