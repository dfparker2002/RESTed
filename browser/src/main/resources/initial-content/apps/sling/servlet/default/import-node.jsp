<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<%
	String dest = slingRequest.getParameter("to");
	pageContext.setAttribute("destinationPath", dest);
%>

<p>import ${resource.path}

<p>to:

<sling:include path="${destinationPath}" replaceSelectors="path-chooser" />

<hr>
<form method="POST" action="${resource.path}.import-node" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="${appPath}.html${destinationPath}" />

	<input type="hidden" name="to" value="${destinationPath}/" />
	<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />

	<button type="submit" value="${resource.path}">import content</button>
</form>

<form method="POST" action="${resource.path}.import-htmlpage" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="${appPath}.html${destinationPath}" />

	<input type="hidden" name="to" value="${destinationPath}/" />
	<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />

	<button type="submit" value="${resource.path}">import content as Page</button>
</form>

<form method="POST" action="${resource.path}.import-pdfpage" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="${appPath}.html${destinationPath}" />

	<input type="hidden" name="to" value="${destinationPath}/" />
	<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />

	<button type="submit" value="${resource.path}">PDF as Page</button>
</form>

<a href="${appPath}.html${contentPath}/..">cancel</a>
