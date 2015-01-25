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
			<h1>node properties</h1>
			<hr>

			<sling:include path="${contentPath}" replaceSelectors="edit-properties" />
			<sling:include path="${contentPath}" replaceSelectors="new-property" />
			<sling:include path="${contentPath}" replaceSelectors="list-mixins" />
			<sling:include path="${contentPath}" replaceSelectors="list-scripts" />
		</div>
	</body>
</html>
