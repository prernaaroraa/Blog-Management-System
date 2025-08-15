<%@page import="com.dto.CommentInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.BlogInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Create Blog</title><link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://unpkg.com/sheryjs/dist/Shery.css" />
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
       <%@ include file="Navbar.jsp" %>
  <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-3xl">
    <h1 class="text-2xl font-bold mb-6">Your Blog</h1>
    <%BlogInfo b = (BlogInfo)request.getAttribute("blog");
    userid=(Integer)session.getAttribute("uniqueid");
    %>
    
    <form action="EditBlogServlet" class="space-y-4">
      <div>
        <label for="title" class="block text-gray-700 font-bold">Title:</label>
        <%= b.getTitle() %>
      </div>
		<div>
        <label for="category" class="block text-gray-700 font-bold">Category:</label>
          <%= b.getCategory()%>
      </div>
      <div>
        <label for="contentContainer" class="block text-gray-700 font-bold">Content:</label>
        <div id="contentContainer" class="space-y-4">
          <div>
            <%=b.getContent() %>
            
          </div>
        </div>
      </div>
      <%
      if(b.getUserid() == userid || userid == 5 )
      {
      %>
      <button onclick="this.form.action='EditBlogServlet'; this.form.submit();" type="submit" name="editblog" value=<%=b.getBlogid() %> class="w-full bg-green-600 text-white p-3 rounded transition hover:bg-green-700">EDIT</button>
      <button onclick="this.form.action='DeleteBlogServlet'; this.form.submit();" type="submit" name="deleteblog" value=<%=b.getBlogid() %> class="w-full bg-green-600 text-white p-3 rounded transition hover:bg-green-700">DELETE</button>
   <%} %>
    </form>
    <%if(userid !=0){%>
    <h2>Comments</h2>
    <form action="CommentServlet" class="mt-6">
            <textarea name="text" 
              class="w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent"
              rows="3" required></textarea>
            <button type="submit" name="blogid"
            value="<%= b.getBlogid()%>"
              class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mt-2">Add
              Comment</button>
          </form>
          <%}
          %>
          <%
	ArrayList<CommentInfo> al =(ArrayList<CommentInfo>)request.getAttribute("comment");
    if(al!=null){
	for (int i = 0; i < al.size(); i++) {
    CommentInfo c = (CommentInfo)al.get(i);
%>
<%=c.getComment() %>
<% 
if(c.getUserid() == userid || userid == 5 )
      {
	%>
	<form action="DeleteCommentServlet">
	
	<button onclick="this.form.action='DeleteCommentServlet'; this.form.submit();" type="submit" name="commentid" value=<%=c.getCommentid() %> class="w-full bg-green-600 text-white p-3 rounded transition hover:bg-green-700">DELETE</button>
	</form>
	<% 
	request.setAttribute("blogi", b.getBlogid());
      }
%>

<%}
	}%>
    <a href="/" class="text-blue-500 hover:underline mt-4 block">Back to Home</a>
  </div>
  <!--  Gsap is needed for Basic Effects -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
  
  <!-- Scroll Trigger is needed for Scroll Effects -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
  
  <!-- Three.js is needed for 3d Effects -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/0.155.0/three.min.js"></script>
  
  <!-- ControlKit is needed for Debug Panel -->
  <script src="https://cdn.jsdelivr.net/gh/automat/controlkit.js@master/bin/controlKit.min.js"></script>
  <script  type="text/javascript"  src="https://unpkg.com/sheryjs/dist/Shery.js"></script>

  <script>
    Shery.mouseFollower();
    Shery.makeMagnet(".magnet-target" /* Element to target.*/, {
  //Parameters are optional.
  ease: "cubic-bezier(0.23, 1, 0.320, 1)",
  duration: 1,
});
    
  </script>
</body>
</html>
    