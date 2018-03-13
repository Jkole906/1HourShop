<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<section class="centeredPanel">
	
	<h1>${product.name}</h1>
	
		<div class="productContainer">
		
			<img class="productImgDetail" alt="${product.name}" src="${product.image}" />
		
		<div class="output">
			<h2 class="productName"><c:out value="${product.name}" /></h2>
			<div class="productPrice">$<c:out value="${product.price}" /></div>
			<div class="productDescription"><c:out value="${product.description }"></c:out></div>
		</div>
		</div>
	
	<div class="buyInput">	
		<c:url value="/addToCart" var="shoppingCart"/>	
		<form action="${shoppingCart}" method="POST">
			<input type="hidden" name="productId" id="productId" value="${product.id}"/>
			<label for="quantityInput">Quantity to buy</label>
			<input type="text" id="quantityInput" name="quantityInput"/>
			<input class="buyBtn" type="submit" value="Add to Cart">
		</form>
	</div>
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
