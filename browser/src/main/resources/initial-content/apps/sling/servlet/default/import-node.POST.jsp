<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page import="java.io.*,
                  java.net.*,
									javax.jcr.*,
									java.util.*,
                  org.apache.sling.api.resource.*,
									org.apache.sling.commons.mime.MimeTypeService,
									org.apache.jackrabbit.commons.JcrUtils,
                  utils.*" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects />
<%!
	void resImport(Session ses, Node root, Resource res, MimeTypeService service) throws Exception {
		String type = res.getResourceType();
		String name = res.getName();
		Node node = null;

		if (name.startsWith(".")) return;

		if ("nt:folder".equals(type)) {
			node = JcrUtils.getOrAddNode(root, name, "sling:Folder");

			Iterator<Resource> children = res.listChildren();
			for (;children.hasNext();) {
				resImport(ses, node, children.next(), service);
			}
		}
		else if ("nt:file".equals(type)) {
			String mime = service.getMimeType(name);
			InputStream in = res.adaptTo(InputStream.class);
			JcrUtils.putFile(root, name, mime, in);
		}
	}
%>
<%
	String redirect = request.getParameter(":redirect");
	String dest = slingRequest.getParameter("to");
	MimeTypeService service = sling.getService(MimeTypeService.class);
	Session ses = resourceResolver.adaptTo(Session.class);
	Node root = ses.getNode(dest);

	Iterator<Resource> children = resource.listChildren();
	for (;children.hasNext();) {
		resImport(ses, root, children.next(), service);
	}

	root.save();
	response.sendRedirect("http://localhost:8080" + redirect);
%>
