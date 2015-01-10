<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<sling:adaptTo adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap" var="properties" />

<form id="delform" method="post" action="${resource.path}" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI()%>" />
</form>

<form method="post" action="${ctxPath}${resource.path}" enctype="multipart/form-data">
	<fieldset>
		<legend>properties</legend>
			
		<c:forEach var="property" items="${properties}">
			<c:if test="${fn:startsWith(property.key, 'jcr:')}">
					
				<label>${property.key}</label>
				<input disabled type="text" value="${property.value}"/>
				<br>

			</c:if>
		</c:forEach>

		<c:forEach var="property" items="${properties}">
			<c:if test="${not fn:startsWith(property.key, 'jcr:')}">

				<label>${property.key}</label>
				<input type="text" name="${property.key}" value="${property.value}" required />
				<input type="submit" name="${property.key}@Delete" value="remove" form="delform" />
				<br>
			
			</c:if>
		</c:forEach>

		<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI()%>" />
		<button type="submit">update</button>
	</fieldset>
</form>
