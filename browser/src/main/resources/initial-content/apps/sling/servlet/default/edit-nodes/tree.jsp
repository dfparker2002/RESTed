<%@page session="false" contentType="text/html; charset=utf-8" %>
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

<div class="columns">
	<table>
		<tr>
			<c:forEach var="parent" begin="0" items="<%=parents%>">
				<td>
					<a href="${appPath}.tree.html${parent.path}">${parent.name}&nbsp;</a>
					<ul>
						<c:forEach var="child" items="${sling:listChildren(parent)}">
							<li><a href="${appPath}.tree.html${parent.path}/${child.name}"><i class="fa ${icons[child.resourceType]}"></i> - ${child.name}</a> </li>
						</c:forEach>
					</ul>
				</td>
			</c:forEach>
			<td>
				<a href="${appPath}.tree.html${resource.path}">${resource.name}</a>
				<ul>
					<c:forEach var="child" items="${sling:listChildren(resource)}">
						<li><a href="${appPath}.tree.html${resource.path}/${child.name}"><i class="fa ${icons[child.resourceType]}"></i> - ${child.name}</a></li>
					</c:forEach>
				</ul>
			</td>
		</tr>
	</table>
</div>
