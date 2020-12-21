<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://kit.fontawesome.com/64d58efce2.js"    crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Sign in & Sign up Form</title>
    </head>

    <body>

        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="Login" method="post" class="sign-in-form">
                        <!---->
                        <h2 class="title">Sign in</h2>
                        <!---->
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="email" placeholder="Username" />
                        </div>
           
                        <!---->
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password" placeholder="Password" />
                        </div>
                        
                        
                        <!---->
                        <input type="submit" value="Login" class="btn solid" />
                        <input type="button"  class="btn solid" value="Forget Password"/>
                        <p class="social-text">Or Sign in with social platforms</p>
                        <!---->
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>

                    <!---->
                    <form action="#" class="sign-up-form" id="form">
                        <!---->
                        <h2 class="title">Sign up</h2>
                        <!---->
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" placeholder="Username" id="username"/>
                            <span class="fas fa-check-circle"></span>
                            <span class="fas fa-exclamation-circle"></span>
                            <small>Error</small>
                        </div>
                        <br>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="email" placeholder="Email" id="email"/>
                            <span class="fas fa-check-circle"></span>
                            <span class="fas fa-exclamation-circle"></span>
                            <small>Error</small>
                        </div>
                        <br>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Password" id="password"/>
                            <span class="fas fa-check-circle"></span>
                            <span class="fas fa-exclamation-circle"></span>
                            <small>Error</small>
                        </div>
                        <br>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Password Again"  id="password2"/>
                            <span class="fas fa-check-circle"></span>
                            <span class="fas fa-exclamation-circle"></span>
                            <small>Error</small>
                        </div>
                        <br>
                        <input type="submit" class="btn" value="Sign up" />
                        <p class="social-text">Or Sign up with social platforms</p>
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>

                </div>
            </div>

            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>New here ?</h3>
                        <p>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
                        ex ratione. Aliquid!
                        </p>
                        <button class="btn transparent" id="sign-up-btn">
                        Sign up
                        </button>
                    </div>
                    <img src="img/log.svg" class="image" alt="" />
                </div>
                <div class="panel right-panel">
                    <div class="content">
                        <h3>One of us ?</h3>
                        <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                        laboriosam ad deleniti.
                        </p>
                        <button class="btn transparent" id="sign-in-btn">
                        Sign in
                        </button>
                    </div>
                    <img src="img/register.svg" class="image" alt="" />
                </div>
            </div>
        </div>
    </body>
</html>
<script src="js/login.js" type="text/javascript"></script>