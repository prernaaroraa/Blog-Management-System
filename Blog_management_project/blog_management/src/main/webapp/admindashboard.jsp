<!DOCTYPE html>
<%@page import="com.dto.UserInfo"%>
<%@page import="com.dto.BlogInfo"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/sheryjs/dist/Shery.css" />
    <style>
        body {
            padding-top: 64px;
        }

        td, th {
            text-align: center;
        }
    </style>
</head>

<body class="bg-green-50 min-h-screen flex flex-col">

    <!-- Navbar -->
    <%@ include file="Navbar.jsp" %>
    <% ArrayList<UserInfo> al = (ArrayList<UserInfo>) request.getAttribute("users"); 
       ArrayList<BlogInfo> ak = (ArrayList<BlogInfo>) request.getAttribute("blogs"); %>

    <div class="flex mt-4">
        <!-- Sidebar -->
        <div class="w-1/5 h-screen p-4 bg-white mt-4 rounded-lg shadow-lg">
            <h2 class="text-xl font-bold mb-4 underline magnet-target">Basic Admin Routes</h2>
            <ul>
                <li class="text-blue-500 hover:underline transition hover:bg-blue-400 hover:text-white px-4 py-2 rounded"><a href="ALLPOST">All posts</a></li>
                <li class="text-blue-500 hover:underline transition hover:bg-blue-400 hover:text-white px-4 py-2 rounded"><a href="ALLUSER">All users</a></li>
                <li class="text-blue-500 hover:underline transition hover:bg-blue-400 hover:text-white px-4 py-2 rounded"><a href="LogOut">logout</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="w-4/5 p-4 flex flex-col gap-4">
            <div class="flex gap-4">

                <!-- Number of Users -->
                <div class="w-full bg-white p-4 rounded-lg shadow-md flex flex-col justify-center items-center">
                    <h2 class="text-xl font-bold mb-4 text-center underline magnet-target">Number of Users</h2>
                    <p class="text-2xl font-bold text-center"><%= al.size() %></p>
                </div>
                <!-- Number of Posts -->
                <div class="w-full bg-white p-4 rounded-lg shadow-md flex flex-col justify-center items-center">
                    <h2 class="text-xl font-bold mb-4 text-center underline magnet-target">Number of Posts</h2>
                    <p class="text-2xl font-bold text-center"><%= ak.size() %></p>
                </div>
                <!-- Input Field -->
                <div class="w-full bg-white p-4 rounded-lg shadow-md">
                    <form action="DeleteBlogServlet" class="w-full">
                        <%
                        String sms = (String) request.getAttribute("sms");
                        if (sms != null) {
                            out.print(sms);
                        }
                        %>
                        <div class="w-full mb-4">
                            <input type="text" id="blogid" name="deleteblog" placeholder="Enter Blog Id of blog you want to delete" required
                                class="w-full p-3 border border-gray-300 rounded focus:border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200">
                        </div>
                        <button type="submit"
                            class="w-full bg-green-600 text-white p-3 rounded transition hover:bg-white border-2 border-green-500 hover:text-green-600 hover:font-semibold">Delete Blog</button>
                    </form>
                </div>

            </div>

            <!-- All User Info -->
            <div class="w-full bg-white p-4 rounded-lg shadow-md">
                <h2 class="text-xl font-bold mb-4 underline magnet-target">All Users</h2>
                <table class="w-full">
                    <thead>
                        <tr>
                            <th class="py-2 px-4 border-b text-xl hover:underline magnet-target">Username</th>
                            <th class="py-2 px-4 border-b text-xl hover:underline magnet-target">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (UserInfo user : al) {
                            if (user.getUniqueid() != 5) { %>
                            <tr>
                                <td class="py-2 px-4 border-b"><%= user.getUsername() %></td>
                                <td class="py-2 px-4 border-b">
                                    <form action="DeleteUser">
                                        <button onclick="this.form.action='DeleteUser'; this.form.submit();" type="submit" class="text-red-500 hover:underline" name="userid" value="<%= user.getUniqueid() %>">Delete User</button>
                                    </form>
                                </td>
                            </tr>
                            <% } 
                        } %>
                        <!-- More user rows can be added here -->
                    </tbody>
                </table>
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
