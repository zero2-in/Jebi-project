<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${session_level ne 'top'}">
    <script>
        location.href = "Error";
    </script>
</c:if>

<script>
    $(document).ready(function () {
        $("#breadcrumbs #pageTitle").html("회원관리");
        $("#breadcrumbs .member_manage").addClass("selected");
        $("#breadcrumbs .member_manage").attr("href", "javascript:void(0)");
    });
</script>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">회원관리</h2>

        <%@ include file="breadcrumbs_admin.jsp" %>
    </div>

    <div class="margin-top-50"></div>

    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box margin-top-0 margin-bottom-20">
                <!-- search-con -->
                <div class="search-con">
                    <form method="get" name="frmSearch">
                        <div class="search-con-inner3">
                            <div class="submit-field">
                                <select name="" id="" class="bootstrap-select with-border btn-group">
                                    <option value=""> = 선택 </option>
                                </select>
                            </div>
                            <div class="submit-field">
                                <input type="text" name="sSbj" id="sSbj" maxlength="100" placeholder="검색" class="input-text with-border">
                            </div>
                            <div class="search-btn2">
                                <a href="javascript:void(0)" onclick="setTimeout(function(){fnSearch()}, 150)" data-animation="ripple" class="button ripple-effect">
                                    검색 <i class="fas fa-search"></i>
                                </a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
                <!-- search-con / End -->
                <!-- 회원리스트 -->
                <div class="content">
                    <ul class="dashboard-box-list">

                        <li class="ntc-height">
                            <!-- board-listing -->
                            <div class="board-listing">
                                <!-- board-listing-details -->
                                <div class="board-listing-details">
                                    <!-- Details -->
                                    <div class="board-listing-description">
                                        
                                    </div>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common_footer.jsp" %>
<script src="js/btn_ripple_effect.js"></script>
</body>
</html>