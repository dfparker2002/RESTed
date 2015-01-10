<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>
<%@page import="org.apache.sling.api.resource.ValueMap,javax.jcr.nodetype.NodeTypeIterator,javax.jcr.Session"%>
<%
	
	ValueMap map = resource.adaptTo(ValueMap.class);
	Object values[] = null;

	if (map != null) {
		values = (Object[])map.get("jcr:mixinTypes");
	}
	if (values == null) values = new Object[0];


	Session ses = resource.adaptTo(Session.class);
	if (ses != null) {
		NodeTypeIterator types = ses.getWorkspace().getNodeTypeManager().getMixinNodeTypes();

		pageContext.setAttribute("mixinNodeTypes", types);
		pageContext.setAttribute("mixinValues", values);
	}
%>

<form method="post" action="${resource.path}" enctype="multipart/form-data">
<fieldset>
	<legend>mixins</legend>
		<label for="sling:resourceType">jcr:mixinTypes</label>
	 	<input type="hidden" name="jcr:mixinTypes@Delete" value="true"/>

		<c:forEach var="value" items="${mixinValues}">
			<input type="hidden" name="jcr:mixinTypes" value="${value}" />
			<button type="submit" name="jcr:mixinTypes@DeleteValue" value="${value}">x</button>
 		</c:forEach>

		<select name=":mixin_type">
			<c:forEach var="value" items="${mixinNodeTypes}">
				<option value"${value.name}">${value.name}</option>
			</c:forEach>
		</select>
		<button type="submit" name="jcr:mixinTypes@ValueFrom" value=":mixin_type">update</button>
</fieldset>
</form>
