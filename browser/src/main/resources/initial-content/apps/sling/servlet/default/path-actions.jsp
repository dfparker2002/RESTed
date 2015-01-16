<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<a href="${appPath}.remove.html${resource.path}"><i class="fa fa-trash"></i></a>
<a href="${appPath}.properties.html${resource.path}"><i class="fa fa-pencil"></i></a>
<a href="${appPath}.copy.html${resource.path}?to=${contentPath}"><i class="fa fa-copy"></i></a>
<a href="${appPath}.move.html${resource.path}?to=${contentPath}"><i class="fa fa-share"></i></a>

<c:if test = "${resource.resourceType ne '/'}">

	<c:choose>
		<c:when test="${fn:contains(resource.name, '.')}">
			<a href="${ctxPath}${resource.path}" target="_blank"><i class="fa fa-edit"></i></a>
		</c:when>
		<c:otherwise>
			<a href="${ctxPath}${resource.path}.html" target="_blank"><i class="fa fa-edit"></i></a>
		</c:otherwise>
	</c:choose>

</c:if>
