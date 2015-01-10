<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@include file="/apps/rested/global.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>${contentPath}</title>
		<link rel="stylesheet" type="text/css" href="${ctxPath}/apps/rested/styles.css">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="menu">
			<a href="${appPath}.authenticate.html${contentPath}">login</a>
			<a href="/system/console">console</a>
			<form action="${appPath}.search.html${contentPath}">
				<input type="text" name="q" value="${param.q}"/>
				<button type="submit">search</button>
			</form>
		</div>

		<div class="breadcrumb">
			<sling:include path="${contentPath}" replaceSelectors="path-breadcrumbs${appSelectors}" />
		</div>

		<div class="tools">
			<sling:include path="${contentPath}" replaceSelectors="path-tools${appSelectors}" />
		</div>

		<div class="content">
			<sling:include path="${contentPath}" replaceSelectors="edit-nodes${appSelectors}" />
		</div>
	</body>
</html>
