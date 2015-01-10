<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page import="org.apache.sling.api.resource.ModifiableValueMap,
                org.apache.sling.api.resource.Resource,
                javax.jcr.Session" %>
<%@include file="/apps/rested/global.jsp"%>
<%

	String name = request.getParameter("new_name");
	String redirect = request.getParameter(":redirect");
	String destPath = null;

	Resource p = resource.getParent();
	destPath = p.getPath() + "/" + name;

	String sourcePath = resource.getPath();

	Session session = resourceResolver.adaptTo(Session.class);
	session.move(sourcePath, destPath);	
	session.save();

	response.sendRedirect("http://localhost:8080" + redirect + "/../" + name);
%>
