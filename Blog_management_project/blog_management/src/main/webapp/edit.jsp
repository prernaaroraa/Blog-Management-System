<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/sheryjs/dist/Shery.css" />
    <style>
        body {
            padding-top: 64px;
        }
    </style>
</head>

<body class="bg-green-50 min-h-screen flex flex-col">
<%@include file="Navbar.jsp" %>
    

    <main class="flex items-center justify-center min-h-[600px] bg-green-50">
        <div class="flex w-full max-w-4xl shadow-lg rounded-lg overflow-hidden bg-white">
            <div class="flex-1 bg-cover bg-center flex flex-col justify-center items-center p-8"
                style="background-image: url('https://plus.unsplash.com/premium_photo-1714675222078-f7a808907c38?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');">
                <h2 class="text-xl font-bold text-gray-800 mb-2 bg-white bg-opacity-75 p-4 rounded">BlogLogo</h2>
                <p class="text-gray-600 text-center bg-white bg-opacity-75 p-4 rounded">Join our community and share your thoughts with the world!</p>
            </div>
            <div class="flex-1 flex flex-col justify-center items-center p-8">
                <h1 class="text-2xl font-bold text-gray-700 mb-4">Edit your Account Information</h1>
                <form action="EditProfileServlet" method="post" class="w-full">
                    <!-- Dummy Success Message -->
                    <!-- <div class="text-green-500 mb-4">Profile updated successfully!</div> -->

                    <!-- Dummy Error Message -->
                    <!-- <div class="text-red-500 mb-4">Error updating profile.</div> -->

                    <div class="w-full mb-4">
                        <label for="username" class="block text-gray-600 mb-2">Username</label>
                        <input type="text" id="username" name="t1" value="<%= session.getAttribute("username") %>" required
                            class="w-full p-3 border border-gray-300 rounded focus:border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200">
                    </div>
                    <div class="w-full mb-4">
                        <label for="password" class="block text-gray-600 mb-2">Password</label>
                        <input type="password" id="password" name="t2" value="<%= session.getAttribute("password") %>" required
                            class="w-full p-3 border border-gray-300 rounded focus:border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200">
                    </div>
                    <div class="w-full mb-4">
                        <label for="email" class="block text-gray-600 mb-2">Email ID</label>
                        <input type="text" id="email" name="t3" value="<%= session.getAttribute("email") %>" required
                            class="w-full p-3 border border-gray-300 rounded focus:border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200">
                    </div>
                    <div class="w-full mb-4">
                        <label for="firstname" class="block text-gray-600 mb-2">First Name</label>
                        <input type="text" id="firstname" name="t4" value="<%= session.getAttribute("firstname") %>" required
                            class="w-full p-3 border border-gray-300 rounded focus:border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200">
                    </div>
                    <div class="w-full mb-4">
                        <label for="lastname" class="block text-gray-600 mb-2">Last Name</label>
                        <input type="text" id="lastname" name="t5" value="<%= session.getAttribute("lastname") %>" required
                            class="w-full p-3 border border-gray-300 rounded focus:border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200">
                    </div>
                    <div class="w-full mb-4">
                        <label for="contact" class="block text-gray-600 mb-2">Contact Number</label>
                        <input type="text" id="contact" name="t6" value="<%= session.getAttribute("contact") %>" required
                            class="w-full p-3 border border-gray-300 rounded focus:border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200">
                    </div>
                    <button type="submit" class="w-full bg-green-600 text-white p-3 rounded transition hover:bg-green-700">Edit</button>
                </form>
            </div>
        </div>
    </main>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/0.155.0/three.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/automat/controlkit.js@master/bin/controlKit.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/sheryjs/dist/Shery.js"></script>
    <script>
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
            duration: .5
        });
    </script>
</body>

</html>
