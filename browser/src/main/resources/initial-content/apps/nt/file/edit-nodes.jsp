<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<c:set var="content" value="${sling:getRelativeResource(resource,'jcr:content')}" />
<sling:adaptTo var="properties" adaptable="${content}" adaptTo="org.apache.sling.api.resource.ValueMap" />

<c:choose>

	<c:when test="${fn:startsWith(properties['jcr:mimeType'], 'text/')}">
		<sling:include replaceSelectors="edit-text" />
	</c:when>
	<c:when test="${fn:startsWith(properties['jcr:mimeType'], 'application/xml')}">
		<sling:include replaceSelectors="edit-text" />
	</c:when>
	<c:when test="${fn:startsWith(properties['jcr:mimeType'], 'image/')}">
		<sling:include replaceSelectors="view-image" />
	</c:when>
	<c:when test="${fn:endsWith(properties['jcr:mimeType'], '/javascript')}">
		<sling:include replaceSelectors="edit-text" />
	</c:when>


</c:choose>

