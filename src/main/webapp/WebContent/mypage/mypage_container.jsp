<%@ page pageEncoding="UTF-8" %>
<div class="my-pages-box">
    <div class="my-pages-container">

        <div class="my-page recommended">
            <h3>${dto.getKor_name()}</h3>
            <div class="my-page-label">
                <strong>
                    <c:if test="${dto.getAdministrator() eq 'Y'}">어드민</c:if>
                    <c:if test="${dto.getAdministrator() eq 'N'}">일반</c:if>
                </strong>
            </div>
        </div>

        <div class="my-page grade">
            <h3>나의 사서함</h3>
            <div class="my-page-label">
                <strong>${dto.getLocker()}</strong>
            </div>
        </div>

        <div class="my-page grade">
            <h3>예치금(￦)</h3>
            <div class="my-page-label">
                <a href="DepositHistory">
                    <strong>0</strong>
                </a>
            </div>
        </div>

        <div class="my-page grade">
            <h3>포인트(P)</h3>
            <div class="my-page-label">
                <a href="PointHistory">
                    <strong>0</strong>
                </a>
            </div>
        </div>

        <div class="my-page grade">
            <h3>쿠폰</h3>
            <div class="my-page-label">
                <a href="CouponHistory">
                    <strong>0</strong>
                </a>
            </div>
        </div>

        <div class="my-page grade">
            <h3>미결제</h3>
            <div class="my-page-label">
                <a href="PurchaseManagement">
                    <strong>0</strong>
                </a>
            </div>
        </div>

    </div>
</div>