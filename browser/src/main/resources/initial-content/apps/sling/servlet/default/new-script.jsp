<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page import="org.apache.sling.api.resource.*, java.util.*" %>
<%@include file="/apps/rested/global.jsp"%>
<%
	String type = slingRequest.getParameter("type");
	String rtype = null;

	if ("sling:resourceType".equals(type)) {
		rtype = resource.getResourceType();
	}
	else if ("sling:superResourceType".equals(type)) {
		rtype = resource.getResourceSuperType();
	}
	else if ("jcr:primaryType".equals(type)) {
		ValueMap map = resource.adaptTo(ValueMap.class);
		if (map != null) {
			rtype = map.get("jcr:primaryType", String.class);
		}
	}
	else {
		rtype = resource.getResourceType();
	}
	
	if (rtype == null) {
		rtype = "nt:unstructured";
	}	

	rtype = rtype.replace(':', '/');

	//prepare different search paths
	pageContext.setAttribute("appsPath", "/apps/" + rtype);
	pageContext.setAttribute("libsPath", "/libs/" + rtype);
	pageContext.setAttribute("defaultPath", "/apps/sling/servlet/default/" + rtype);
%>

<sling:adaptTo adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap" var="properties" />

<form method="get" action="">
	for node type:
	<select name="type">
		<option value="sling:resourceType">sling:resourceType : ${resource.resourceType}</option>
		<option value="jcr:primaryType">jcr:primaryType : ${properties["jcr:primaryType"]}</option>
		<option value="sling:superResourceType">sling:superResourceType : ${resource.resourceSuperType}</option>
	</select>
	<input type="submit" value="change" id="submit"/>
</form>

<h3>scripts in ${pageScope.appsPath}</h3>
<p>Apps path is used for scripts overriding scripts in the Libs.

<ul>
	<sling:listChildren var="children" resource="${sling:getResource(resourceResolver,appsPath)}"/>

	<c:forEach var="child" items="${children}">
		<li><a href="${appPath}.html${child.path}">${child.name}</a></li>
	</c:forEach>

	<form method="post" action="${appsPath}" enctype="multipart/form-data">
		<input type="hidden" name=":operation" value="import" />
		<input type="hidden" name=":contentType" value="json" />

		<input type="text" name=":name" placeholder="new selector script" />
		<input type="hidden" name=":redirect" value="xxx" />
		<input type="hidden" name=":errorpage" value="xxx" />
		<input type="hidden" name=":content" value="{ 'jcr:primaryType':'nt:file','jcr:content':{'jcr:primaryType':'nt:resource','jcr:data':'','jcr:mimeType':'text/plain'} }" />
							
		<button type="submit">add</button>
	</form>
</ul>

<h3>scripts in ${libsPath}</h3>
<p>Libs path is normally reserved for 'system' scripts.

<ul>
	<sling:listChildren var="children" resource="${sling:getResource(resourceResolver,pageScope.libsPath)}"/>

	<c:forEach var="child" items="${children}">
		<li><a href="${appPath}.html${child.path}">${child.name}</a></li>
	</c:forEach>

	<form method="post" action="${libsPath}" enctype="multipart/form-data">
		<input type="hidden" name=":operation" value="import" />
		<input type="hidden" name=":contentType" value="json" />

		<input type="text" name=":name" placeholder="new selector script" />
		<input type="hidden" name=":redirect" value="xxx" />
		<input type="hidden" name=":errorpage" value="xxx" />
		<input type="hidden" name=":content" value="{ 'jcr:primaryType':'nt:file','jcr:content':{'jcr:primaryType':'nt:resource','jcr:data':'','jcr:mimeType':'text/plain'} }" />
							
		<button type="submit">add</button>
	</form>
</ul>

<h3>scripts in ${defaultPath}</h3>
<p>The default path is used by the sling for looking up default selectors.

<ul>
	<sling:listChildren var="children" resource="${sling:getResource(resourceResolver,pageScope.defaultPath)}"/>

	<c:forEach var="child" items="${children}">
		<li><a href=""${appPath}.html${child.path}">${child.name}</a></li>
	</c:forEach>

	<form method="post" action="${defaultPath}" enctype="multipart/form-data">
		<input type="hidden" name=":operation" value="import" />
		<input type="hidden" name=":contentType" value="json" />

		<input type="text" name=":name" placeholder="new selector script" />
		<input type="hidden" name=":redirect" value="xxx" />
		<input type="hidden" name=":errorpage" value="xxx" />
		<input type="hidden" name=":content" value="{ 'jcr:primaryType':'nt:file','jcr:content':{'jcr:primaryType':'nt:resource','jcr:data':'','jcr:mimeType':'text/plain'} }" />
							
		<button type="submit">add</button>
	</form>
</ul>
