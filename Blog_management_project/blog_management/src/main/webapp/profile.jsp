<%@ page import="com.dto.BlogInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/sheryjs/dist/Shery.css" />
    <style>
        body {
            padding-top: 64px;
        }

        .blog {
            transition: transform 0.2s ease-in-out;
        }

        .blog:hover {
            transform: translateY(-4px);
        }

        td, th {
            text-align: center;
        }
    </style>
</head>

<body class="bg-green-50 min-h-screen flex flex-col">
    <%@ include file="Navbar.jsp" %>

    <div class="flex mt-4 h-screen">
        <!-- Sidebar -->
        <div class="w-1/5 h-4/5 p-4 mt-4 bg-white rounded-lg mx-4 shadow-lg">
            <div>
                <h2 class="text-xl font-bold mb-4 underline magnet-target">Profile Options</h2>
                <ul>
                    <li class="mb-2"><a href="HomeServlet" class="text-blue-500 transition hover:text-white hover:bg-blue-400 px-2 py-1 rounded hover:underline">Home</a></li>
                    <li class="mb-2"><a href="edit.jsp" class="text-blue-500 transition hover:text-white hover:bg-blue-400 px-2 py-1 rounded hover:underline">Edit Profile</a></li>
                    <li class="mb-2"><a href="LogOut" class="text-blue-500 transition hover:text-white hover:bg-blue-400 px-2 py-1 rounded hover:underline">Logout</a></li>
                    <li class="mb-2"><a href="createblog.jsp" class="text-blue-500 transition hover:text-white hover:bg-blue-400 px-2 py-1 rounded hover:underline">Create Blog</a></li>
                    <li class="mb-2"><a href="ShowBlogsServlets" class="text-blue-500 transition hover:text-white hover:bg-blue-400 px-2 py-1 rounded hover:underline">All Blogs</a></li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="w-4/5 p-4 flex flex-col gap-4">
            <div class="w-full bg-white p-4 rounded-lg shadow-md">
                <h2 class="text-2xl font-bold font-bold underline mb-4 magnet-target">Profile :</h2>
                <div>
                    <%
                        String username = (String) session.getAttribute("username");
                        String email = (String) session.getAttribute("email");
                        String firstname = (String) session.getAttribute("firstname");
                        String lastname = (String) session.getAttribute("lastname");
                        String contactno = (String) session.getAttribute("contact");
                    %>
                    <p class="text-md my-2 text-gray-500">Username: <%= username %></p>
                    <p class="text-md my-2 text-gray-500">First Name: <%= firstname %></p>
                    <p class="text-md my-2 text-gray-500">Last Name: <%= lastname %></p>
                    <p class="text-md my-2 text-gray-500">Email: <%= email %></p>
                    <p class="text-md my-2 text-gray-500">Contact Number: <%= contactno %></p>
                </div>
                <div class="flex gap-6 mt-4 text-xl">
                    <h2 class="font-semibold">Number of Blogs created :</h2>
                    <%
                        ArrayList<BlogInfo> al = (ArrayList<BlogInfo>) request.getAttribute("blogs");
                        int blogCount = (al != null) ? al.size() : 0;
                    %>
                    <h2 class="font-semibold"><%= blogCount %></h2>
                </div>
            </div>
            <div class="bg-white px-4 py-2 rounded-lg shadow-lg">
                <div class="flex justify-between">
                    <div>
                        <h2 class="text-2xl font-bold underline mb-4 magnet-target">Recent Blogs</h2>
                        <p class="text-gray-500">Here are the blogs you have created recently.</p>
                    </div>
                    <div>
                        <a href="ShowBlogsServlet" class="text-blue-500 hover:underline">View all blogs</a>
                    </div>
                </div>
                <div class="space-y-6">
                    <%
                        if (al != null) {
                            int displayCount = Math.min(al.size(), 2);
                            for (int i = 0; i < displayCount; i++) {
                                BlogInfo b = al.get(i);
                    %>
                    <div class="bg-gray-50 blog rounded-lg shadow-lg overflow-hidden">
                        <div class="p-6">
                            <div>
                                <h2 class="text-2xl font-bold mb-2"><%= b.getTitle() %></h2>
                                <p class="text-gray-600 mb-4"><%= b.getContent() %></p>
                                <h3 class="text-md font-bold mb-2 text-gray-400">Category: <%= b.getCategory() %></h3>
                            </div>
                            <form class="flex justify-between" action="ShowBlogServlet">
                                <button onclick="this.form.action='ShowBlogServlet'; this.form.submit();" name="blogid" value="<%= b.getBlogid() %>" type="submit" class="text-blue-500 hover:underline">Read more</button>
                                <% if (b.getUserid() == (Integer) session.getAttribute("uniqueid") || (Integer) session.getAttribute("uniqueid") == 5) { %>
                                <button onclick="this.form.action='DeleteBlogServlet'; this.form.submit();" name="deleteblog" value="<%= b.getBlogid() %>" type="submit" class="text-white border-2 border-red-500 hover:bg-white hover:text-red-500 bg-red-500 rounded-md py-1 px-2">Delete</button>
                                <% } %>
                            </form>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript libraries -->
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
