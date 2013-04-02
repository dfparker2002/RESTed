<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@page import="java.io.*,
                  java.net.*,
									javax.jcr.*,
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%

String cpath = slingRequest.getRequestPathInfo().getResourcePath();
String rpath = slingRequest.getRequestPathInfo().getSuffix();
Resource res = resource.getResourceResolver().resolve(rpath);
Node node = res.adaptTo(Node.class);

String parentPath = "/";
if (resource.getParent() != null) parentPath = resource.getParent().getPath();

%><!DOCTYPE html>
<html>
	<sling:include resource="<%=res %>" resourceType="components/head" replaceSelectors="edit" />
	<body>
    <div class="container-fluid">
			<div class="modal">
  <div class="modal-header">
    <h3>Move <a href="#"><%= resource.getPath() %></a>
		<br/>To
		
		<sling:include resource="<%=res %>" resourceType="components/breadcrumb" replaceSelectors="view" />
	
		</h3>
  </div>

  <div class="modal-body">

<% if (node.hasNodes()) { %>
	<h4>change destination path</h4>
	<sling:include resource="<%=res %>" resourceType="components/pathlist" replaceSelectors="view" />
<% }  %>

  </div>
<FORM ID="PATHSFORM" METHOD="POST" ACTION="<%=resource.getPath() %>" ENCTYPE="MULTIPART/FORM-DATA">
  <div class="modal-footer">
    <a href="<%= parentPath + ".edit.html" %>" class="btn">Cancel</a>
		<INPUT TYPE="HIDDEN" NAME=":operation" VALUE="move" />
		<INPUT TYPE="HIDDEN" NAME=":dest" VALUE="<%=res.getPath()+"/"%>" />
    <BUTTON class="btn btn-primary" TYPE="SUBMIT">Move</BUTTON>
  </div>
</FORM>
</div>
		</div>
	</body>
</html>