<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<table>
	<thead>
		<tr>
			<th>name</th>
			<th>resource type</th>
		</tr>
	</thead>
	<tbody>

		<c:forEach var="child" items="${sling:listChildren(resource)}">
			<tr>
				<td><a href="${appPath}.html${child.path}">${child.name}</a></td>
				<td>${child.resourceType}</td>
			</tr>
		</c:forEach>

	</tbody>
</table>
