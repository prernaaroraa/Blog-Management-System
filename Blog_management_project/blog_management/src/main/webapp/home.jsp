<!DOCTYPE html>
<%@page import="com.dto.BlogInfo"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/sheryjs/dist/Shery.css" />
    
</head>

<body class="bg-green-50 min-h-screen flex flex-col">

    <!-- Navbar -->
    <%@ include file="Navbar.jsp" %>

    <main class="container mx-auto py-8 w-3/5 flex-grow">
    <%userid=(Integer)session.getAttribute("uniqueid");%>
        <%
            // Example ArrayList of BlogInfo objects, replace with your actual data retrieval logic
            ArrayList<BlogInfo> blogs = (ArrayList<BlogInfo>) request.getAttribute("blogs");
            if (blogs != null) {
                for (BlogInfo blog : blogs) {
        %>
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden mb-6">
                        <div class="p-6">
                            <div>
                                <h2 class="text-2xl font-bold mb-2 "><%= blog.getTitle() %></h2>
                                <p class="text-gray-600 mb-4"><%= blog.getContent() %></p>
                                <h3 class="text-md font-bold mb-2 text-gray-400">Category: <%= blog.getCategory() %></h3>
                            </div>
                            <form class="flex justify-between" action="ShowBlogServlet">
                                <button onclick="this.form.action='ShowBlogServlet'; this.form.submit();" name="blogid" value="<%= blog.getBlogid() %>" type="submit" class="text-blue-500 hover:underline">Read more</button>
                               <% if(blog.getUserid() == userid || userid == 5 )
                               { %>
                                <button onclick="this.form.action='DeleteBlogServlet'; this.form.submit();" name="deleteblog" value="<%= blog.getBlogid() %>" type="submit" class="text-white border-2 border-red-500 hover:bg-white hover:text-red-500 bg-red-500 rounded-md py-1 px-2">Delete</button>
                            <%} %>
                            </form>
                        </div>
                    </div>
        <%
                }
            }
        %>
    </main>

    <footer class="bg-gray-900 p-4">
        <div class="container mx-auto text-white text-center">
            &copy; 2024 Blog Website. All rights reserved.
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/0.155.0/three.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/automat/controlkit.js@master/bin/controlKit.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/sheryjs/dist/Shery.js"></script>
    <script>
        // Example animation initialization
        Shery.mouseFollower();
        Shery.makeMagnet(".magnet-target", {
            ease: "cubic-bezier(0.23, 1, 0.320, 1)",
            duration: 1,
        });
        gsap.from("nav div:nth-child(2) a", {
            y: -100,
            stagger: 0.1
        });
        gsap.from("nav div:nth-child(1)", {
            y: -100,
            opacity: 0,
            stagger: 0.1,
            duration: 0.5
        });
    </script>
</body>
</html>
