<%-- 
    Document   : statistic
    Created on : Dec 17, 2020, 1:10:19 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css"> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <title>TimeLive</title>
    </head>
    <body>
            <!--Phần kết nối và đăng ký-->
    <section class="header">
        <div class="hny-top-menu">
            <div class="top-hd">
                <div class="container-fluid">
                    <div class="row">
                        <ul class="social-top col-md-7">
                            <li class="login-pages">
                                <a class="login" href="login.jsp">
                                    <span class="fa fa-user">       Đăng Nhập   </span>
                                </a>
                            </li>
                            <li><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                            <li><a href="#"><span class="fab fa-instagram"></span></a></li>
                            <li><a href="#"><span class="fab fa-twitter"></span></a></li>
                            <li><a href="https://www.youtube.com/channel/UCA_23dkEYToAc37hjSsCnXA"><span class="fab fa-youtube"></span></a></li>
                        </ul>
                        <ul class="accounts col-md-5">
                            <li class="top_li"><span class="fas fa-phone"></span><a href="tel:+84399469372">+84399469372</a>
                            </li>
    
                            <li class="top_li mr-lg-0"><span class="fas fa-envelope"></span><a href="mailto:info@example.com">Need help? Contact Us </a>
    
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <nav class="navbar navbar-expand-lg navbar-light fill">
        <div class="container">
            <a class="navbar-brand" href="index.html"> 
                <label class="mylogo"><span class="fas fa-clipboard-check" aria-hidden="true"></span>ToDo  </label>List</a> 
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
      
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.html">Trang chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Tạo thời gian biểu
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="login.jsp">Todo</a>
                          <a class="dropdown-item" href="login.jsp">Task</a>
                          <!--<a class="dropdown-item" href="#">Theo tháng</a>-->
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="login.jsp">Routine</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Ví dụ mẫu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên hệ</a>
                    </li>
                </ul>
            </div>
        </div>     
    </nav>
      
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">

            <div class="carousel-item active">
                <img class="d-block w-100" src="item/images/bg2.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                <h5>
                    ƯU ĐIỂM
                </h5>
                <p>
                    Đơn Giản - Dễ Dùng</p>
                </div>
            </div>

            <div class="carousel-item">
                <img class="d-block w-100" src="item/images/bg5.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                <h5>
                    ƯU ĐIỂM
                </h5>
                <p>
                    Thân Thiện</p>
                </div>
            </div>

            <div class="carousel-item">
                <img class="d-block w-100" src="item/images/bg8.jpg" alt="Third slide">
                <div class="carousel-caption d-none d-md-block">
                <h5>
                    ƯU ĐIỂM
                </h5>
                <p>
                    Giúp bạn quản lý thời gian tốt hơn</p>
                </div>
            </div>

        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div id="about" class="container-fluid about1">
        <br>
        <div class="row">
            <div class="col-sm-7">
                <h2>Giới thiệu : </h2>
                <p style="text-indent: 30px;">Thời gian biểu là quỹ thời gian được kê khai để thực hiện các việc làm và cuộc sống khác nhau trong ngày, tuần, tháng. Người lập thời gian biểu sẽ theo đúng quy định về thời gian mà thực hiện nhằm quản lý hiệu quả thời gian. Việc lập thời gian biểu sẽ giúp cho chúng ta những lợi ích tuyệt vời sau đây:</p>
                <p>- Giải quyết công việc theo trình tự, đảm bảo tiến độ đúng với quy định và cho hiệu quả công việc cao.</p>
                <p>- Tất cả các công việc được giải quyết hoàn toàn, bạn sẽ không lo ứ đọng lượng việc cho ngày tiếp theo hay tuần tiếp theo.</p>
                <p>- Khi đưa ra thời gian biểu sẽ tránh cho bạn tập trung quá nhiều vào các việc không quan trọng.</p>
                <p>- Lập thời gian biểu giúp bạn có thời gian nghỉ ngơi đảm bảo sức khỏe tốt, giúp bạn tận hưởng những giây phút tuyệt vời mà cuộc sống ban tặng.</p>
            </div>
            <div div class="col-sm-5">
                <img src="item/images/p7.jpg" class="img-fluid" width=200%   alt="img-thumbnail">
            </div>
        </div>
        <br>
    </div>
    <div id="about" class="container-fluid about2">
        <br>
        <div class="row">
            <div div class="col-sm-5">
                <img src="item/images/p6.jpg" class="img-fluid" width=100%   alt="img-thumbnail">
            </div>

            <div class="col-sm-7">
                <h2>Cách thiết lập thời gian biểu phù hợp nhất : </h2><br>
                <p style="text-indent: 30px;">Mặc dù lập thời gian biểu rất có ích nhưng bạn phải biết cách xây dựng và sắp xếp thời gian. Vậy lập thời gian biểu như thế nào mới hiệu quả nhất? Để lập thời gian biểu hiệu quả bạn cần thực hiện những điều sau đây:</p>
                <p>- Ước lượng thời gian dành để làm việc.</p>
                <p>- Sắp xếp lịch trình cụ thể</p>
                <p>- Tự đặt ra mục tiêu và kiên trì thực hiện.</p>
                <p>- Khi muốn bỏ cuộc hãy nghĩ tới lý do mình băt đầu.</p>
            </div>
        </div>
        <br>
    </div>
 
    <br>
    <br>
    <br>
    <div id="vd">

        <h2 style="text-align: center;">Một số mẫu tham khảo :</h2>
        <br>
        <br>
        <div id="vd1" class="container-fluid">
            <div class="row">
                <div div class="col-sm-3">
                    <div class="card" style="width: 18rem;">
                        <img src="item/images/cook.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">Kế hoạch học nấu ăn</h5>
                          <p class="card-text">Kế hoạch học nấu ăn của mình từ khi mình còn chưa biết gì đến bây giờ mình đã đủ tự tin để nấu cho cả nhà ăn.</p>
                          <a href="#" class="btn btn-primary">Vào xem ngay</a>
                        </div>
                      </div>
                </div>
    
                <div div class="col-sm-3">
                    <div class="card" style="width: 18rem;">
                        <img src="item/images/education.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">Giáo Dục</h5>
                          <p class="card-text">Trong đây có các kế hoạch giảng dạy của cô, thời khóa biểu học kỳ vừa rồi, kế hoạch thi và chấm điểm, nhập điểm vào sổ.</p>
                          <a href="#" class="btn btn-primary">Vào xem ngay</a>
                        </div>
                      </div>
                </div>
    
                <div div class="col-sm-3">
                    <div class="card" style="width: 18rem;">
                        <img src="item/images/code.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">Kế hoạch học lập trình</h5>
                          <p class="card-text">Lộ trình mình tự học ngôn ngữ C từ căn bản đến nâng cao, link các bài tập cũng như một số kênh youtube mình thấy hay</p>
                          <a href="#" class="btn btn-primary">Vào xem ngay</a>
                        </div>
                      </div>
                </div>
    
                <div div class="col-sm-3">
                    <div class="card" style="width: 18rem;">
                        <img src="item/images/money.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">Kế hoạch tiết kiệm tiền</h5>
                          <p class="card-text">Kế hoạch tiết kiệm tiền của mình từng tuần, số lượng tiền mình chi trong tháng và 1 số mẹo để tiết kiệm hiệu quả</p>
                          <a href="#" class="btn btn-primary">Vào xem ngay</a>
                        </div>
                      </div>
                </div>          
            </div>
        </div>
        <br>
        <br>
        <div id="vd2" class="container-fluid">
            <div class="row">
                <div div class="col-sm-3">
                    <div class="card" style="width: 18rem;">
                        <img src="item/images/new.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">Học một ngôn ngữ mới</h5>
                          <p class="card-text">Lịch học tiếng anh của mình trong 1 tuần và 1 số lưu ý nhỏ cho các bạn.</p>
                          <a href="#" class="btn btn-primary">Vào xem ngay</a>
                        </div>
                      </div>
                </div>
    
                <div div class="col-sm-3">
                    <div class="card" style="width: 18rem;">
                        <img src="item/images/travel.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">Kế hoạch đi du lịch</h5>
                          <p class="card-text">Kế hoạch đi du lịch của mình cũng như 1 số mẹo nhỏ khi đi du lịch cho các bạn</p>
                          <a href="#" class="btn btn-primary">Vào xem ngay</a>
                        </div>
                      </div>
                </div>
    
                <div div class="col-sm-3">
                    <div class="card" style="width: 18rem;">
                        <img src="item/images/read.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">Kế hoạch đọc sách</h5>
                          <p class="card-text">Kế hoạch đọc sách và mục tiêu những cuốn sách mình phải đọc hết trong năm.</p>
                          <a href="#" class="btn btn-primary">Vào xem ngay</a>
                        </div>
                      </div>
                </div>
    
                <div div class="col-sm-3">
                    <div class="card" style="width: 18rem;">
                        <img src="item/images/write.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">Viết Sách</h5>
                          <p class="card-text">Đây là kế hoạch của mình kể từ khi mình có ý tưởng đến khi hoàn thành cuốn sách.</p>
                          <a href="#" class="btn btn-primary">Vào xem ngay</a>
                        </div>
                      </div>
                </div>          
            </div>
        </div>
        <br>
        <br>
        <br>
    </div>
    

    <!--Footer-->
    <div class="footer">
        <div class="footer-content">

            <div class = "footer-section about">
                <a class="navbar-brand" href="index.html"> 
                    <label class="mylogo"><span class="fas fa-clipboard-check" aria-hidden="true"></span>TODO  </label>LIST</a>
                <p>
                    ToDoList là trang web bọn em lập ra nhằm mục đích giúp cho các bạn dễ dàng quản lí
                    thời gian để làm việc học tập một cách khoa học và đạt được nhiều kết quả cao
                </p>

                <div class="contact">
                    <span class="fas fa-phone">   <a href="tel:+84399469372">   +84399469372</a></span>
                    <span class="fas fa-envelope">  <a href="mailto:info@example.com">   Need help? Contact Us </a></span>
                </div>

                <br>
                <div class= "socials">
                    <a href="#"><span class="fab fa-facebook-f"></span></a>
                    <a href="#"><span class="fab fa-instagram"></span></a>
                    <a href="#"><span class="fab fa-twitter"></span></a>
                    <a href="https://www.youtube.com/channel/UCA_23dkEYToAc37hjSsCnXA"><span class="fab fa-youtube"></span></a>
                </div>
            </div>
            <div class = "footer-section links">
                <h2>Các trang chính</h2>
                <br>
                <ul>
                    <a href="#">
                        <li>Trang Chủ</li>
                    </a>

                    <a href="#">
                        <li>Việc làm hằng ngày</li>
                    </a>

                    <a href="#">
                        <li>Việc làm có deadline</li>
                    </a>

                    <a href="#">
                        <li>Liên Hệ</li>
                    </a>

                    <a href="#">
                        <li>Đăng nhập / Đăng ký</li>
                    </a>
                </ul>
            </div>
            <div class = "footer-section contact-form">
                <h2>Contact Us</h2>
                <br>
                <form>
                    <input type="email" name = "email" class="text-input contact-input" placeholder="Your Email is....">
                    <textarea name="message" class="text-input contact-input" placeholder="Your Message...."></textarea>
                    <button type="submit" class="btn btn-big">
                        <i class="fas fa-envelope"></i>
                        Send
                    </button>
                </form>
            </div>
        </div>

        <div class="footer-bottom">
            &copy; todoList.com || Nhóm 3 Công nghệ phần mềm
        </div>
    </div>


    


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
