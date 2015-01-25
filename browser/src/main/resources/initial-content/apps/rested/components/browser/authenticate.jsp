<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>${contentPath}</title>
		<link rel="stylesheet" type="text/css" href="${ctxPath}/apps/rested/styles.css">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	</head>
	<body class="dialog-background">

		<div class="dialog">
			<h1>authenticate path ${contentPath}</h1>
			<hr>

			<form method="post" action="${ctxPath}/j_security_check" enctype="multipart/form-data" accept-charset="UTF-8">
				<fieldset>
					<legend>your credentials</legend>

					<input type="hidden" name="_charset_" value="UTF-8">
					<input type="hidden" name="resource" value="${appPath}.html${contentPath}">
					<input type="hidden" name="selectedAuthType" value="form">

					<label class="control-label" for="j_username">name</label>
					<input id="j_username" name="j_username" type="text" accesskey="u">

					<label class="control-label" for="j_password">password</label>
					<input id="j_password" name="j_password" type="password" accesskey="p">

					<a class="btn" href="${ctxPath}/system/sling/logout.html">Logout</a>
					<button type="submit">Login</button>
				</fieldset>
			</form>
		</div>
	</body>
</html>
