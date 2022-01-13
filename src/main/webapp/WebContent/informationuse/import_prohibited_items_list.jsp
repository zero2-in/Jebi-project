<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<link rel="stylesheet" href="css/import_prohibited_items_list.css">

<!-- nav Script -->
<script>
    $(document).ready(function () {
        $("#breadcrumbs .dropbtn").click(function () {
            $("#breadcrumbs .dropdown-content").toggle(200);
            $("#breadcrumbs .select-area").toggleClass("active");
        });
    });
</script>

<!-- Container Start -->
<div id="container">
    <!-- Informatio Use Start -->
    <div class="informationuse">
        <!-- Title / nav-list  Start -->
        <div class="informationuse-title"><p>수입금지품목</p>
            <nav id="breadcrumbs" class="dark">
                <ul class="nav-list">
                    <li><a href="../index.html">Home</a></li>
                    <li>이용안내</li>
                    <li class="select-area">
                        <button class="dropbtn">이용팁&nbsp;<span class="bs-caret"><span class="caret"></span></span></button>
                        <div class="dropdown-content">
                            <a href="javascript:goSite('delivery_agent_service_list')">배송대행 이용방법</a>
                            <a href="javascript:goSite('purchasing_agent_service_list')">구매대행 이용방법</a>
                            <a href="javascript:goSite('business_user_guide_list')">사업자 이용안내</a>
                            <a href="javascript:goSite('joni_manual_list')">타오바오 이용방법</a>
                            <a href="javascript:goSite('chinese_size_condition_table_list')">이용팁&nbsp;&nbsp;&nbsp;<i class="fas fa-check"></i></a>
                            <a href="javascript:goSite('nodata_processing_manual_list')">노데이터 처리방법</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <!-- Title / nav-list  End -->

        <!-- Sub title  Start -->
        <div class="informationuse-sub-title">
            <div class="delivery-agent">
                <div class="delivery-agent-manual">배송대행 이용방법</div>
                <a href="javascript:goSite('delivery_agent_service_list')"><div class="delivery-agent-service">배송대행 서비스 안내</div></a>
                <a href="javascript:goSite('delivery_agent_application_manual_list')"><div class="delivery-agent-application-manual">배송대행 신청서 작성법</div></a>
            </div>
            <div class="purchasingagent-agent">
                <div class="purchasingagent-agent-manual">구매대행 이용방법</div>
                <a href="javascript:goSite('purchasing_agent_service_list')"><div class="purchasingagent-agent-service">구매대행 서비스 안내</div></a>
                <a href="javascript:goSite('purchasingagent_agent_application_manual_list')"><div class="purchasingagent-agent-application-manual">구매대행 신청서 작성법</div></a>
            </div>
            <a href="javascript:goSite('business_user_guide_list')"><div class="business-user-guide">사업자 이용안내</div></a>
            <div class="taobao-agent">
                <div class="taobao-manual">타오바오 이용방법</div>
                <a href="javascript:goSite('joni_manual_list')"><div class="join-manual">가입방법</div></a>
                <a href="javascript:goSite('address_manual_list')"><div class="address-manual">주소 설정하기</div></a>
                <a href="javascript:goSite('purchase_payment_list')"><div class="purchase-payment">구매결제하기</div></a>
                <a href="javascript:goSite('return_refund_manual_list')"><div class="return-refund-manual">반품/환불방법</div></a>
                <a href="javascript:goSite('invoice_number_list')"><div class="invoice-number">송장번호 확인하기</div></a>
                <a href="javascript:goSite('automatic_order_registration_list')"><div class="automatic-order-registration">주문자동등록방법</div></a>
            </div>
            <div class="use-tip-agent">
                <div class="use-tip">이용팁</div>
                <a href="javascript:goSite('chinese_size_condition_table_list')"><div class="chinese-size-condition-table">중국사이즈 조건표</div></a>
                <a href="javascript:goSite('chinese_delivery_tracking_list')"><div class="chinese-delivery-tracking">중국내 배송조회</div></a>
                <a href="javascript:goSite('issuance_of_unique_number_list')"><div class="issuance-of-unique-number">개인통관고유부호발급 방법</div></a>
                <a href="javascript:goSite('customs_duty_list')"><div class="customs-duty">관/부가세 안내</div></a>
                <a href="javascript:goSite('import_prohibited_items_list')"><div class="import-prohibited-items">수입금지품목</div></a>
            </div>
            <a href="javascript:goSite('nodata_processing_manual_list')"><div class="nodata-processing-manual">노데이터 처리방법</div></a>
        </div>
        <!-- Sub title  End -->

        <!-- Content  Start -->
        <div class="import-prohibited-items-content">
            <div class="import-prohibited-items-box01">
                <div class="import-prohibited-items-list"><i class="fas fa-minus"></i><br><h2>수입금지품목 목록</h2></div>
                <div class="import-prohibited-items-img"><img src="images/import_prohibited_items_img.png" height="167px">
                    <P>기타 항목으로 현재 한국 세관으로부터 반입금지 된 상품명과 반입금지 사유 사항입니다.<br>
                        아래의 상품 리스트에 빠져있더라도 각 상품별 검출된 유해성분을 참조하시어 유해성분으로 분류된 물질을 함유하고 있는 상품은 수입금지가 되오니 참고 부탁드립니다. (매월 업데이트 됩니다.)</P>
                    <ul class="prohibited-items-list">
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;야생 동물/식물(씨앗,양곡, 식물종자, 식량작물종자, 채소종자포함)</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;금은괴 및 통화</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;위험품목, 석면포(반화커튼)을 포함하여 위험하거나 가연성이 있는 품목</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;불법의약품 및 마취제</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;화기, 병기 및 부품들(권총,소총,화약,폭약, 화공품,분사기, 전기충격기, 석궁</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;준 무기류(도검, 서바이벌 게임용 총기완구, 사용한 총포탄류, 군수물자)</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;일부</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;성인용품, 음란비디오,서적,사진등 사회풍기문란 저해품목</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;알코올 함량이 높은 가연성 향수, 스프레이식 화장품류 등</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;수표, 현금과 같은 화폐(유가증권)</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;화폐, 채권 기타 유가 증권의 위조품, 변조품, 모조품 등</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;다량의 식품류(식용 천일염)</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;가공(열처리)처리가 안된 농산물</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;다량의 화장품류, 액상비누류</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;식품의약품안정청의 수입불허 도는 유해 의약품(취급제한 유독물)</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;다량의 먹는 물</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;핵,방사선 물질 및 장치</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;의료기기</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;코코넛, 코코넛 제품</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;상표권을 침해하는 제품</li><br>
                    </ul>
                </div>
            </div>
            <div class="import-prohibited-items-box02">
                <div class="product-name-harmful-ingredients"><i class="fas fa-minus"></i><br><h2>상품명/유해성분</h2></div>
                <div class="product-name-harmful-ingredients-img"><img src="images/product_name_harmful_ingredients_img.png" height="167px">
                    <P>수입금지 품목의 상품이라도 경우에 따라서는 의사의 처방전으로 복용의 필요성이 인정되는 경우는 일반통관으로 반입이 허용되고 있습니다.</P>
                    <ul class="productname-harmfulingredients">
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;6-OXO EXTREME / 6-oxo 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;겟비-즉효성 / Tadalafli 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;비룡정 / 구연산 실데나필 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;빔플러스-여성용 / Tadalafli 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;산삼 배양근 포르테 / 구연산 실데나필 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;슈퍼한방 해구정 / 바데나필,호모실데나필 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;알렉시아 포 우먼 / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;엠피원 / Tadalafli 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;ALBUMIN / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;ANIMAL TEST / Yohimbe 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;AVELA / 이카린 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;CHEATERS / 리포산 (치옥트산) 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;COBRA POWERFUL MEN'S PERFORMANCE / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;DEER BLOOD / 동물검역 대상</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;DIETARY SUPPLEMENT HOT-ROX / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;DYMABURN XTREME 100 SAP / Yohimbe 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;EPHEDRINE HCL / 단일마약성분 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;EXOTICA / 아카린 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;FAHRENHEIT / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp; MEN / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;HERVAL V / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;HOODIA TRIM FAST / 후디아(Hoodia) 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;HORNEY GOAT WEED / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;HYDROXYCUT WEIGHT-LOSS FORMULA / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;KONG / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;KYTRA / Tadalafil 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;LIBI MAX / 바데나필,Tadalafil 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;LIBIX3 / Tadalafil 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;LIPO-6 / 요힘빈, 시네프린 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;LIVIONE / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;MAGRA VX / 아세틸바데나필, 노르네오실데 나필 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;MALE FUEL / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;MASS TABS / Epimedium, Rhodiola Rosea 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;MEGA NITE HCL / Tadalafil 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;MEN'S MAX VIRILITY / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;METABO / Synephrine 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;MONSTER-4 / 4-Androstenediol 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;MONSTER-T / Methyl-1-Testosterone 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;M-STAK / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;NASUTRA / 하이드록시 호모실데나필 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;NEW SLIM-30 / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;NEW SMILE 30 / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;OREXIS / Yohimbe 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;POWER POPS / 후디아(Hoodia Gordonii) 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;POWERGRA / Tadalafil 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;RIXE 2 THE OCCASION / 실데나필 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;RIZE2 / 디메틸치오실데나필 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;SLIMDIA / Hoodia Gordonii 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;STAMINA RX FOR WOMEN / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;STAMINA-RX / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;STAMINA-RXW / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;SUPER VABIDO / 요힘빈 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;THE BURN / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;THERMONEX / Octopamine, Evodiamine 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;VAROMAX PLUS / 구연산 실데나필 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;VENOM / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;VIM MAX / Tadalafil 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;VIRILITY PILL VP-RX / 이카린 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;VIVID VIRILITY / 이카린 검출</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;XENADRINE EFX / ""</li><br>
                        <li><i class="fas fa-circle"></i>&nbsp;&nbsp;XENADRINE NRG / ""</li><br>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Content  End -->

    </div>
    <!-- Informatio Use End-->
</div>
<!-- Container End -->

<!-- Footer -->
<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
</body>

</html>