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
    <%BlogInfo b = (BlogInfo)request.getAttribute("blog"); %>
    
    <form action="REditBlogServlet"  class="space-y-4">
      <div>
        <label for="title" class="block text-gray-700 font-bold">Title:</label>
        <input type="text" name="title" id="title" value="<%= b.getTitle() %>" class="w-full border rounded px-3 py-2" required>
      </div>
		<div>
        <label for="category">Category</label>
        <select name="category" id="category" required>
          <option value="Nature">Nature</option>
          <option value="Technology">Technology</option>
          <option value="Food">Food</option>
        </select>
      </div>
      <div>
        <label for="contentContainer" class="block text-gray-700 font-bold">Content:</label>
        <div id="contentContainer" class="space-y-4">
          <div>
            <textarea name="blogContent" rows="10" class="w-full border rounded px-3 py-2" required><%=b.getContent() %></textarea>
            
          </div>
        </div>
      </div>
      
      <button onclick="this.form.action='REditBlogServlet'; this.form.submit();" type="submit" name="blogid" value="<%=b.getBlogid() %>" class="w-full bg-green-600 text-white p-3 rounded transition hover:bg-green-700">EDIT</button>
    </form>
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
    