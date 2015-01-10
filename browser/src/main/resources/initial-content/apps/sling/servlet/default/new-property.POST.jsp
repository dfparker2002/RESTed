<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page import="org.apache.sling.api.resource.ModifiableValueMap" %>
<%@include file="/apps/rested/global.jsp"%>
<%

	String name = request.getParameter("property_name");
	String value = request.getParameter("property_value");
	String redirect = request.getParameter(":redirect");

	ModifiableValueMap map = resource.adaptTo(ModifiableValueMap.class);
	if (map != null) {
		map.put(name, value);
		resource.getResourceResolver().commit();
	}

	response.sendRedirect("http://localhost:8080" + redirect);
%>
