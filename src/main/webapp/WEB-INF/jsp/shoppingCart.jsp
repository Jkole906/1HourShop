<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<section class="centeredPanel">
	
	<h1>Shopping Cart</h1>
	
	<c:if test="${not empty message }">
		<div class="alert"><marquee behavior="alternate" ><c:out value="${message }"/></marquee></div>
	</c:if>	
	
	<table class="cartTable">
		<tr>
			<th class="imgColumn"></th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total</th>
		</tr>
		<c:set var="cartTotal" value="0" scope="page" />
		<c:forEach items="${shoppingCart }" var="product">
			<tr class="cartRow">
				<td>
					<c:url value="/detail/${product.key.id }" var="productDetail"/>
					<a href="${productDetail}"><img class="cartImg" alt="${product.key.name}" src="${product.key.image}" /></a>
				</td>
				<td class="productName"><c:out value="${product.key.name}" /></td>
				<td class="cartPrice">$<c:out value="${product.key.price}" /></td>
				<td class="productQuantity"><c:out value="${product.value}" /></td>
				<c:set var="itemTotal" value="${product.key.price * product.value}" /> 
				<td class="productTotal">$<c:out value="${itemTotal }" /></td>
				<c:set var="cartTotal" value="${cartTotal + itemTotal }" />
			</tr>				
		</c:forEach>
		
	</table>
	<div class="total">
	<strong>Total</strong> <span class="finalTotal">$<c:out value="${cartTotal }" /></span></div>
	<div class="checkout"><a href="https://media2.giphy.com/media/z1FzPhvrIZXTa/giphy.gif">Checkout</a></div>
</section>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />