<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<!-- 사이트 네비게이션 이름, 주소 표시 -->
<%@ include file="common_review.jsp" %>


<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">이용후기</h2>

        <%@ include file="../breadcrumbs_cscenter.jsp" %>
    </div>

    <div class="dashboard margin-bottom-20">
        <div class="search-con">
            <div class="row">
                <!-- 검색 폼! -->
                <form action="Review" method="post" name="search">
                    <div class="search">
                        <input type="text" name="s" class="search-text" placeholder="제목">
                        <button type="button" class="search-btn ripple-effect" data-animation="ripple">
                            검색 <i class="fas fa-search"></i>
                        </button>
                        <button type="button" class="ripple-effect button blue-line" onclick="setTimeout(function() {goWrite()}, 150)" data-animation="ripple">
                            글쓰기
                        </button>
                    </div>
                </form>

            </div>
        </div>

        <div class="content with-padding padding-bottom-0">

            <div class="content-row">

                <!-- 리뷰박스는 여기부터! -->
                <div class="review-content">
                    <a href="review_view.html" style="background-image: url('../images/taobaobest_men_img.PNG');" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>첫 이용 후기</h3>
                            <p>진*** / 2021.12.27</p>
                            <span class="num">28</span>
                        </div>
                    </a>
                </div>

                <div class="review-content">
                    <a href="review_view.html" style="background-image: url('../images/taobaobest_pet_img.PNG');" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>제비 첫 이용</h3>
                            <p>조*** / 2021.12.25</p>
                            <span class="num">21</span>
                        </div>
                    </a>
                </div>

                <div class="review-content">
                    <a href="review_view.html" style="background-image: url();" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>타오바오 첫 직구</h3>
                            <p>테*** / 2021.12.22</p>
                            <span class="num">26</span>
                        </div>
                    </a>
                </div>

                <div class="review-content">
                    <a href="review_view.html" style="background-image: url();" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>첫 후기 ㅎㅎㅎ</h3>
                            <p>김*** / 2021.12.19</p>
                            <span class="num">70</span>
                        </div>
                    </a>
                </div>

                <div class="review-content">
                    <a href="review_view.html" style="background-image: url();" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>이용 후기</h3>
                            <p>김*** / 2021.12.17</p>
                            <span class="num">38</span>
                        </div>
                    </a>
                </div>

                <div class="review-content">
                    <a href="review_view.html" style="background-image: url();" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>잘 받았습니다</h3>
                            <p>이*** / 2021.12.16</p>
                            <span class="num">19</span>
                        </div>
                    </a>
                </div>

                <div class="review-content">
                    <a href="review_view.html" style="background-image: url();" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>처음 사용한 배대지!!!만족해요~~</h3>
                            <p>이*** / 2021.12.12</p>
                            <span class="num">35</span>
                        </div>
                    </a>
                </div>

                <div class="review-content">
                    <a href="review_view.html" style="background-image: url('../images/menu_img02.jpg');" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>잘 받았습니다.</h3>
                            <p>성*** / 2021.12.05</p>
                            <span class="num">136</span>
                        </div>
                    </a>
                </div>

                <div class="review-content">
                    <a href="review_view.html" style="background-image: url();" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>자주쓰지만 처음올리는 이용후기</h3>
                            <p>이*** / 2021.12.03</p>
                            <span class="num">55</span>
                        </div>
                    </a>
                </div>

                <div class="review-content">
                    <a href="review_view.html" style="background-image: url();" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>여기 너무해요!!!</h3>
                            <p>황*** / 2021.12.02</p>
                            <span class="num">152</span>
                        </div>
                    </a>
                </div>

            </div>

        </div>

    </div>

    <div class="paging">
        <ul>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple"><i class="fas fa-chevron-left"></i></a></li>
            <li><a href="javascript:void(0)" class="current-page ripple-effect" data-animation="ripple">1</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">2</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">3</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">4</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">5</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">6</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">7</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">8</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">9</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">10</a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple"><i class="fas fa-chevron-right"></i></a></li>
            <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple"><i class="fas fa-chevron-right"></i></a></li>
        </ul>
    </div>
</div>

<!-- Footer -->
<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script>
    function goWrite() {
        urldirect.separate = "write";
        urldirect.action = "Review";
        urldirect.submit();
    }
</script>

</body>
</html>