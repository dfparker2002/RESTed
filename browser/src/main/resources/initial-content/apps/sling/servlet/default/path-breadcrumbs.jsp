<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page trimDirectiveWhitespaces="true" %>
<%@page import="java.util.Vector, org.apache.sling.api.resource.Resource"%>
<%@include file="/apps/rested/global.jsp"%>

<%
	Vector parents = new Vector();
	Resource p = resource.getParent();
	while (p != null) {
		parents.insertElementAt(p, 0);
		p = p.getParent();
	}
%>

<a href="${appPath}.html/"><i class="fa fa-home"></i></a>

<c:forEach var="parent" begin="1" items="<%=parents%>">
	<a href="${appPath}.html${parent.path}">${parent.name}</a>
</c:forEach>

<c:if test = "${resource.path ne '/'}">
	<form method="post" action="${resource.path}.path-breadcrumbs.html" enctype="multipart/form-data">

		<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI()%>" />
		<input type="text" name="new_name" value="${resource.name}" />

		<button type="submit">rename</button>
		<a href="${appPath}.remove.html${contentPath}">remove</a>
	</form>
</c:if>
