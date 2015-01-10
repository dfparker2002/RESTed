<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<table>
	<thead>
		<tr>
			<th>name</th>
			<th>resource type</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="child" items="${sling:listChildren(resource)}">
			<tr>
				<td>
					<a href="${appPath}.html${child.path}"><i class="fa ${icons[child.resourceType]}"></i> - ${child.name}</a>
				</td>
				<td>
					${child.resourceType} <span class="actions"><a href="${appPath}.renderer.html${child.path}"><i class="fa fa-arrow-circle-right"></i></a></span>
				</td>
				<td>
					<div class="actions">
						<sling:include resource="${child}" replaceSelectors="path-actions" />
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
