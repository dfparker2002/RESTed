<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page import="javax.jcr.Property" %>
<%@include file="/apps/rested/global.jsp"%>
<%
	Property prop = currentNode.getProperty("jcr:content/jcr:data");
	String text = prop.getString();
	
	pageContext.setAttribute("text", text);
%>
<form method="POST" action="${ctxPath}${resource.path}/_jcr_content" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>" />
	<input type="hidden" name="_charset_" value="UTF-8" />
	<div class="texteditor">
		<button type="submit">save</button>
		<textarea name="jcr:data" autocomplete="off" autocorrect="off" autocapitalize="off" 
spellcheck="false">${sling:encode(text,'HTML')}</textarea>
	</div>
</form>
