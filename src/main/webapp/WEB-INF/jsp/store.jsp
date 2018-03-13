<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<section class="centeredPanel">
	
	<h1>All Figures!</h1>
	
	<ul>
		<c:forEach items="${products}" var="product">
			<li class="productContainer">
				<c:url value="/detail/${product.id }" var="productDetail"/>
				<a href="${productDetail}"><img class="productImg" alt="${product.name}" src="${product.image}" /></a>

				<div class="output">
					<div class="productName"><c:out value="${product.name}" /></div>
					<div class="productPrice">$<c:out value="${product.price}" /></div>
					<div class="productDescription"><c:out value="${product.description}"/></div>
				</div>
			</li>				
		</c:forEach>
	</ul>
	
</section>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />