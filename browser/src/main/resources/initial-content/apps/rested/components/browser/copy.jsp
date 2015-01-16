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
			<h1>copy node</h1>
			<hr>

			<sling:adaptTo adaptable="${sling:getResource(resourceResolver,contentPath)}" adaptTo="javax.jcr.Node" var="node" />
			
			<c:choose>
				<c:when test="${not empty node}">
					<sling:include path="${contentPath}" replaceSelectors="copy-node" />
				</c:when>
				<c:otherwise>
					This is not a JCR Node, do you want to import instead?

					<a href="${appPath}.import.html${contentPath}?to=/">import</a>
					<a href="${appPath}.html${contentPath}/..">cancel</a>
				</c:otherwise>
			</c:choose>

		</div>
	</body>
</html>
