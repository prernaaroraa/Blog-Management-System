<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/sheryjs/dist/Shery.css" />
    <style>
        body {
            padding-top: 64px; 
            }
    </style>
</head>

<body class="bg-green-50 min-h-screen flex flex-col">
  <%@ include file="Navbar.jsp" %>
    <main class="flex items-center justify-center min-h-[600px] bg-green-50">
        <div class="flex w-full max-w-4xl shadow-lg rounded-lg overflow-hidden bg-white">
            <div class="flex-1 bg-cover bg-center flex flex-col justify-center items-center p-8"
                style="background-image: url('https://plus.unsplash.com/premium_photo-1714675222078-f7a808907c38?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');">
                <h2 class="text-xl font-bold text-gray-800 mb-2 bg-white bg-opacity-75 p-4 rounded">Blog Website</h2>
                <p class="text-gray-600 text-center bg-white bg-opacity-75 p-4 rounded"></p>
            </div>
            <div class="flex-1 flex flex-col justify-center items-center p-8">
                <h1 class="text-2xl font-bold text-gray-700 mb-4">Forgot Your Password</h1>
                <form action="ForgotServlet" class="w-full" method="post">
                 <%
                	String sms = (String) request.getAttribute("sms");
                    if(sms!=null){
                	out.print(sms);
                    }
                	%>
                    <div class="w-full mb-4">
                        <label for="username" class="block text-gray-600 mb-2">Username</label>
                        <input type="text" id="username" name="t1" placeholder="Username" required
                            class="w-full p-3 border border-gray-300 rounded focus:border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200">
                    </div>
                    <div class="w-full mb-4">
                        <label for="password" class="block text-gray-600 mb-2">Email</label>
                        <input type="email" id="Email" name="t2" placeholder="Email" required
                            class="w-full p-3 border border-gray-300 rounded focus:border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200">
                    </div>
                    <button type="submit"
                        class="w-full bg-green-600 text-white p-3 rounded transition hover:bg-green-700">Reset my password</button>
                    <!-- <input type="button" class="w-full bg-green-600 text-white p-3 rounded transition hover:bg-green-700 mt-4 cursor-pointer" value="Sign-up" onclick="this.form.action='signup.jsp'; this.form.submit();"> -->
                </form>
                <% //String sms=(String)request.getAttribute("sms"); 
                //if (sms !=null) { 
                	//out.print(sms); 
                	//} %>
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
        Shery.makeMagnet(".magnet-target" /* Element to target.*/, {
            //Parameters are optional.
            ease: "cubic-bezier(0.23, 1, 0.320, 1)",
            duration: 1,
        });
        gsap.from("nav div:nth-child(2) a", {
            y: -100,
            stagger: 0.1
        });
        gsap.from("nav div:nth-child(1) ", {
            y: -100,
            opacity: 0,
            stagger: 0.1,
            duration: .5
        });
    </script>
</body>

</html>