<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<sling:adaptTo adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap" var="properties" />

<table>
	<tbody>

		<c:forEach var="property" items="${properties}">
			<c:if test="${!fn:startsWith(property.key, 'jcr:') and !fn:startsWith(property.key, 'sling:')}">

				<tr>
					<td>${property.key} :</td>
					<td>${property.value}</td>
				</tr>

			</c:if>
		</c:forEach>

	</tbody>
</table>
