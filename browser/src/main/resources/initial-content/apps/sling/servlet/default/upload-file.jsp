<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>

<form method="post" action="${resource.path}" enctype="multipart/form-data">
	<fieldset>
		<legend>upload file</legend>
		<input type="file" name="*" />
		<input type="hidden" name="*@TypeHint" value="nt:file" />
		<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURI().replace(".create","")%>/.." />

		<button type="submit">submit</button>
	</fieldset>
</form>
