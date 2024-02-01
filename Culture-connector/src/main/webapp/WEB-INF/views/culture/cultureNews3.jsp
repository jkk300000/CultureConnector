<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/WEB-INF/views/common/cultureheader.jsp">
	<jsp:param value="Culture Connector" name="title"/>
</jsp:include>

<!-- **************** MAIN CONTENT START **************** -->
<main>

    <!-- =======================
    Main banner START -->
    <section class="py-0">
        <div class="container">
            <!-- Background image -->
            <div class="rounded-3 p-4 p-sm-5" style="background-image: url(${pageContext.request.contextPath}/resources/images/category/culture-theme/coupon.png); background-position: center center; background-repeat: no-repeat; background-size: cover;">
                <div class="row">
                    <div class="col-md-6">
                        <!-- Title -->
                        <h1 class="h2 text-white mb-3">EVENT 행사 쿠폰</h1>
                        <!-- Offer title -->
                        <div class="bg-warning rounded-2 p-3 mb-3">
                            <h5 class="text-dark">최대</h5>
                            <h4 class="text-dark mb-0">~25%  문화여행 쿠폰</h4>
                        </div>
                        <!-- Text and button -->
                        <p class="text-white mb-3">문화커넥터에서만 준비한 특별 이벤트 쿠폰 놓치지 마세요</p>
                        <a href="cluture-news2.html" class="btn btn-dark mb-0">문화 코스 보러가기<i class="bi bi-arrow-right fa-fw ms-2"></i></a>
                    </div>
                </div>
            </div>	
        </div>
    </section>
    <!-- =======================
    Main banner END -->
    
    <!-- =======================
    Compare listing START -->
    <section>
        <div class="container">
            <div class="row g-4">
                <div class="col-12">
                    <!-- Table START -->
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="table-primary">
                                <tr>
                                    <th scope="col">2024 쿠폰 정보</th>
                                    <th scope="col">최대 할인</th>
                                    <th scope="col">쿠폰 출처</th>
                                    <th scope="col">쿠폰 번호</th>
                                    <th scope="col">기간</th>
                                </tr>
                            </thead>
                            <tbody class="align-middle">
                                <!-- 기존 정보 -->
                                <tr>
                                    <td class="h6 mb-0">문화 커넥터 모든 사용자들을 위한 쿠폰</td>
                                    <td class="h6 fw-normal mb-0">15%</td>
                                    <td class="h6 fw-normal mb-0">문화 커넥터</td>
                                    <td>
                                        <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                            <h6 class="mb-0 fw-normal user-select-all">MON203</h6>
                                        </div>
                                    </td>
                                    <td class="h6 fw-normal mb-0">2029.12.31</td>
                                </tr>
                              
                                <tr>
                                    <td class="h6 mb-0">신라호텔 첫 이용 고객을 위한 쿠폰</td>
                                    <td class="h6 fw-normal mb-0">10%</td>
                                    <td class="h6 fw-normal mb-0">신라호텔</td>
                                    <td>
                                        <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                            <h6 class="mb-0 fw-normal user-select-all">LOG125F</h6>
                                        </div>
                                    </td>
                                    <td class="h6 fw-normal mb-0">2024.03.31</td>
                                </tr>
                                
                                <tr>
                                    <td class="h6 mb-0">KTX 티켓 할인권</td>
                                    <td class="h6 fw-normal mb-0">10%</td>
                                    <td class="h6 fw-normal mb-0">kTX</td>
                                    <td>
                                        <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                            <h6 class="mb-0 fw-normal user-select-all">LOG126F</h6>
                                        </div>
                                    </td>
                                    <td class="h6 fw-normal mb-0">2024.07.20</td>
                                </tr>
                               
                                <tr>
                                    <td class="h6 mb-0">서울 중심 지역 숙소 예약 시 할인</td>
                                    <td class="h6 fw-normal mb-0">30%(가격 15만원 이상만 적용)</td>
                                    <td class="h6 fw-normal mb-0">서울스테이</td>
                                    <td>
                                        <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                            <h6 class="mb-0 fw-normal user-select-all">SEOUL30</h6>
                                        </div>
                                    </td>
                                    <td class="h6 fw-normal mb-0">2024.08.05</td>
                                </tr>
                               
                                <tr>
                                    <td class="h6 mb-0">경주 역사 유적지 투어 예약 할인</td>
                                    <td class="h6 fw-normal mb-0">20%</td>
                                    <td class="h6 fw-normal mb-0">역사투어</td>
                                    <td>
                                        <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                            <h6 class="mb-0 fw-normal user-select-all">GYEONGJU20</h6>
                                        </div>
                                    </td>
                                    <td class="h6 fw-normal mb-0">2024.08.31</td>
                                </tr>
                                <tr>
                                    <td class="h6 mb-0">한국 관광공사 면세점 5000원 쿠폰</td>
                                    <td class="h6 fw-normal mb-0">5000원 쿠폰 (5만원 이상 구매시)</td>
                                    <td class="h6 fw-normal mb-0">한국 관광공사 면세점</td>
                                    <td>
                                        <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                            <h6 class="mb-0 fw-normal user-select-all">ALLKOR24</h6>
                                        </div>
                                    </td>
                                    <td class="h6 fw-normal mb-0">2024.09.10</td>
                                </tr>
                                <tr>
                                    <td class="h6 mb-0">부산 해변가 리조트 예약 시 할인</td>
                                    <td class="h6 fw-normal mb-0">25%</td>
                                    <td class="h6 fw-normal mb-0">부산리조트</td>
                                    <td>
                                        <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                            <h6 class="mb-0 fw-normal user-select-all">BUSAN25</h6>
                                        </div>
                                    </td>
                                    <td class="h6 fw-normal mb-0">2024.10.10</td>
                                </tr>
                                
                                
                                <tr>
                                    <td class="h6 mb-0">제주 도심 투어 예약 할인</td>
                                    <td class="h6 fw-normal mb-0">15%</td>
                                    <td class="h6 fw-normal mb-0">제주투어</td>
                                    <td>
                                        <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                            <h6 class="mb-0 fw-normal user-select-all">JEJU15</h6>
                                        </div>
                                    </td>
                                    <td class="h6 fw-normal mb-0">2024.10.15</td>
                                </tr>
                                
                                
                                <tr>
                                    <td class="h6 mb-0">한옥스테이 체험 예약 50000원 할인</td>
                                    <td class="h6 fw-normal mb-0">25000원 할인 (2박 이상 예약시)</td>
                                    <td class="h6 fw-normal mb-0">홈스테이</td>
                                    <td>
                                        <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                            <h6 class="mb-0 fw-normal user-select-all">HANOK50</h6>
                                        </div>
                                    </td>
                                    <td class="h6 fw-normal mb-0">2024.10.31</td>
                                </tr>
                                 
                                    <tr>
                                        <td class="h6 mb-0">서울 타워 입장권 예약 10% 할인</td>
                                        <td class="h6 fw-normal mb-0">10%</td>
                                        <td class="h6 fw-normal mb-0">서울타워</td>
                                        <td>
                                            <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                                <h6 class="mb-0 fw-normal user-select-all">SEOULTOWER10</h6>
                                            </div>
                                        </td>
                                        <td class="h6 fw-normal mb-0">2024.11.28</td>
                                    </tr>
                                    
                                   
                                    <tr>
                                        <td class="h6 mb-0">부산 야경 투어 예약 15% 할인</td>
                                        <td class="h6 fw-normal mb-0">15%</td>
                                        <td class="h6 fw-normal mb-0">부산투어</td>
                                        <td>
                                            <div class="bg-light border border border-secondary border-dashed rounded-2 px-3 py-2">
                                                <h6 class="mb-0 fw-normal user-select-all">BUSANNIGHT15</h6>
                                            </div>
                                        </td>
                                        <td class="h6 fw-normal mb-0">2024.12.31</td>
                                    </tr>
    
                                         
                   </tbody>
                            
                        </table>
                    </div>	
                    <!-- Table END -->
                </div>
    
                <div class="col-md-10 mx-auto">
                    <!-- 쿠폰 정보 글  -->
                    <h5 class="mb-2">1. 이용약관:</h5>
    <ul class="mb-4">
        <li class="mb-2"><strong>1.1 예약 및 결제:</strong>
            <ul>
                <li class="mb-2">1.1.1 본 사이트를 통해 예약된 여행 상품은 해당 호텔 또는 숙소의 실제 가용성에 따라 확인됩니다. </li>
                <li>1.1.2 결제는 안전한 결제 시스템을 통해 이루어지며, 추가 수수료나 숨은 비용은 없습니다.</li>
            </ul>
        </li>
        <li class="mb-2"><strong>1.2 쿠폰 사용:</strong>
            <ul>
                <li class="mb-2">1.2.1 쿠폰은 예약 시에 적용 가능하며, 중복 사용은 허용되지 않습니다.</li>
                <li>1.2.2 쿠폰은 유효 기간 내에 사용되어야 하며, 유효 기간이 지난 경우에는 쿠폰이 무효화됩니다.</li>
            </ul>
        </li>
        <li><strong>1.3 예약 변경 및 취소:</strong>
            <ul>
                <li class="mb-2">1.3.1 예약 변경 또는 취소의 경우, 적용된 쿠폰은 환불되지 않습니다.</li>
                <li>1.3.2 호텔 또는 숙소의 정책에 따라 예약 변경 및 취소 수수료가 부과될 수 있습니다.</li>
            </ul>
        </li>
    </ul>
    
    <h5 class="mb-2">2. 질문&답변:</h5>
    <ul class="mb-4">
        <li class="mb-2"><strong>2.1 쿠폰 사용방법:</strong>
            <ul>
                <li class="mb-2">Q: 쿠폰은 어떻게 사용하나요?</li>
                <li>A: 예약 페이지에서 쿠폰 코드를 입력하고 확인 단계에서 할인이 적용됩니다.</li>
            </ul>
        </li>
        <li class="mb-2"><strong>2.2 쿠폰 기간이 지났을 때:</strong>
            <ul>
                <li class="mb-2">Q: 쿠폰 유효 기간이 지났을 때 어떻게 됩니까?</li>
                <li>A: 쿠폰 유효 기간이 지났을 경우, 해당 쿠폰은 무효화되며 할인 혜택을 받을 수 없습니다.</li>
            </ul>
        </li>
        <li class="mb-2"><strong>2.3 쿠폰 중복 사용:</strong>
            <ul>
                <li class="mb-2">Q: 여러 개의 쿠폰을 동시에 사용할 수 있나요?</li>
                <li>A: 아니요, 쿠폰은 예약 당 하나만 사용 가능하며, 중복 사용은 허용되지 않습니다.</li>
            </ul>
        </li>
        <li><strong>3. 한번만 사용하는지:</strong>
            <ul>
                <li class="mb-2">Q: 쿠폰은 한 번만 사용 가능한가요?</li>
                <li>A: 네, 각 쿠폰은 예약 당 한 번만 사용 가능하며, 중복 사용은 허용되지 않습니다.</li>
            </ul>
        </li>
    </ul>
    
                
                </div>
            </div><!-- Row END -->
        </div>  
    </section>
    <!-- =======================
    Compare listing END -->
    
    </main>
    <!-- **************** MAIN CONTENT END **************** -->





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>