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

    <div class="dashboard margin-bottom-40">
        <div class="blog-post-content">
            <!-- 제목 입력! -->
            <h3 class="margin-bottom-10">
                첫 이용 후기
            </h3>
            <!-- 입력자 정보! -->
            <div class="blog-post-info-list margin-bottom-20">
                    <span class="blog-post-info">
                        <i class="far fa-edit"></i> 진***
                    </span>
                <span class="blog-post-info">
                        <i class="far fa-calendar"></i> 2021-12-27 21:10
                    </span>
                <span class="blog-post-info">
                        <i class="far fa-eye"></i> 52
                    </span>
                <a href="javascript:void(0)" class="blog-post-info">
                    <i class="fas fa-link"></i>  test_file_name.jpeg (다운로드)
                </a>
            </div>

            <!-- 썸머노트 내용 필드 -->
            <div>
                처음 직구해봤는데 제비의 친절한 설명덕에 쉽게 할 수 있었습니다. 또 이용할게요!
            </div>
        </div>
    </div>

    <!-- 목록 버튼 필드 -->
    <div class="button-field">
        <a href="javascript:void(0)" onclick="setTimeout(function() {location.href='review_list.html';}, 200)" class="button ripple-effect blue-line" data-animation="ripple">
            목록
        </a>
    </div>

    <div class="prev-next-box">
        <div class="box-wrap">
            <ul class="post-nav margin-bottom-40">
                <!-- 다음 글 -->
                <li class="next-post">
                    <a href="javascript:void(0)">
                        <span>다음글</span>
                        <strong>첫 이용 후기</strong>
                    </a>
                </li>
                <!-- 이전 글 -->
                <li class="prev-post">
                    <a href="javascript:void(0)">
                        <span>이전글</span>
                        <strong>타오바오 첫 직구</strong>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="../common_footer.jsp" %>

<script src="../js/btn_ripple_effect.js"></script>

</body>
</html>