    <style>
        body {
            padding-top: 64px;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>

    <header class="fixed top-0 w-full z-10 bg-white shadow-md flex items-center">
        <nav class="container mx-auto px-6 py-4 flex justify-between items-center">
            <div class="text-2xl font-bold magnet-target"><a href="HomeServlet" >BlogSite</a></div>
            <div class="flex items-center gap-6 text-lg text-green-600">
                <% Integer userid = (Integer) session.getAttribute("uniqueid"); %>
                <% if (userid != null && userid == 5) { %>
                    <a href="AdminDashboardServlet" class="font-semibold hover:underline">Admin Dashboard</a>
                <% } %>
                <% if (userid != null) { %>
                    <a href="HomeServlet" class="font-semibold hover:underline">Home</a>
                    <a href="ProfileServlet" class="font-semibold hover:underline">Profile</a>
                    <div class="relative dropdown">
                        <div class="hover:text-green-700 hover:bg-white hover:shadow-green-400 hover:shadow-md hover:border-green-500 text-green-600 px-2 py-1 font-semibold rounded-md">
                            Select Category
                        </div>
                        <div class="dropdown-content text-green-600 px-2 py-1 font-semibold rounded-md border-green-400 border-2">
                            <form action="CategoryServlet">
                                <input type="submit" class="block w-full px-4 py-2 hover:bg-gray-100 rounded-md" name="category" value="Nature">
                                <input type="submit" class="block w-full px-4 py-2 hover:bg-gray-100 rounded-md" name="category" value="Technology">
                                <input type="submit" class="block w-full px-4 py-2 hover:bg-gray-100 rounded-md" name="category" value="Food">
                            </form>
                        </div>
                    </div>
                    <a href="LogOut" class="font-semibold hover:underline">LogOut</a>
                <% } else { %>
                    <a href="login(T).jsp" class="font-bold hover:underline">Login</a>
                    <div class="green-box bg-green-600 rounded-lg text-white px-2 py-1">
                        <a href="SignUp.jsp">Get Started</a>
                    </div>
                <% } %>
            </div>
        </nav>
    </header>