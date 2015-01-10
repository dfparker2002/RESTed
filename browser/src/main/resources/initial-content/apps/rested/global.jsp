<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.regex.*, java.util.*"%>
<sling:defineObjects /><%

String requrl = slingRequest.getRequestURI();
String contentPath = "/";
String appPath = "";
String appSelectors = "";
String appExtension = "";
String ctxPath = slingRequest.getContextPath();

Pattern pp = Pattern.compile("^/(.*?)(\\.\\w+)/(.*?)$");
Matcher m = pp.matcher(requrl);
if (m.find()) {
	String s = m.group(1);
	int x = s.indexOf('.');
	if (x > 0) {
		appPath = "/"+s.substring(0, x);
		appSelectors = s.substring(x);
	}
	else {
		appPath = "/"+s;
		appSelectors = "";
	}
	contentPath = "/"+m.group(3);
}

pageContext.setAttribute("contentPath", contentPath);
pageContext.setAttribute("appSelectors", appSelectors);
pageContext.setAttribute("appExtension", appExtension);
pageContext.setAttribute("appPath", appPath);
pageContext.setAttribute("ctxPath", ctxPath);
pageContext.setAttribute("icons", new IconMap());

%><%!

class IconMap extends HashMap {
	public Object get(Object key) {
		if ("nt:file".equals(key)) {
			return "fa-file-o";
		}
		else if ("sling:Folder".equals(key) || "nt:folder".equals(key)) {
			return "fa-folder";
		}
		else {
			return "fa-cube";
		}
	}
}

%>
