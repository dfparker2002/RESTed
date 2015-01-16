<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<table>
	<thead>
		<tr>
			<th>name</th>
			<th>resource type</th>
			<th>path</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<sling:findResources query="SELECT * FROM [nt:base] AS n WHERE LOCALNAME(n) LIKE '%${param.q}%' AND ISDESCENDANTNODE('${resource.path}')" language="JCR-SQL2" var="result" />

		<c:forEach var="found" items="${result}">
			<tr>
				<td>
					<a href="${appPath}.html${found.path}"><i class="fa ${icons[found.resourceType]}"></i> - ${found.name}</a>
				</td>
				<td>
					${found.resourceType} <span class="actions"><a href="${appPath}.renderer.html${found.path}"><i class="fa fa-arrow-circle-right"></i></a></span>
				</td>
				<td>
					${found.path}
				</td>
				<td>
					<div class="actions">
						<sling:include resource="${found}" replaceSelectors="path-actions" />
					</div>
				</td>
			</tr>
		</c:forEach>

	</tbody>
</table>
