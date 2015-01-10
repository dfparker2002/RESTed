<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page import="java.util.Vector, org.apache.sling.api.resource.Resource"%>
<%@include file="/apps/rested/global.jsp"%>

<%
	String dest = slingRequest.getParameter("to");
	pageContext.setAttribute("destinationPath", dest);

	Vector parents = new Vector();
	Resource p = resource.getParent();
	while (p != null) {
		parents.insertElementAt(p, 0);
		p = p.getParent();
	}
%>

<a href="${slingRequest.requestURI}?to=/">home</a>

<c:forEach var="parent" begin="1" items="<%=parents%>">
	<a href="${slingRequest.requestURI}?to=${parent.path}">${parent.name}</a>
</c:forEach>

<table>
	<c:forEach var="child" items="${sling:listChildren(sling:getResource(resourceResolver,destinationPath))}">
		<tr>
			<td>
				<a href="${slingRequest.requestURI}?to=${child.path}">${child.name}</a>
			</td>
			<td>
				${child.resourceType}
			</td>
		</tr>
	</c:forEach>
</table>
