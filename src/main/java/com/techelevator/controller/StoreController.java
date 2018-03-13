package com.techelevator.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Product;
import com.techelevator.model.ProductDao;

@Controller
public class StoreController {
	
	@Autowired
	private ProductDao productDao;

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayProducts(ModelMap modelHolder) {
		List<Product> allProducts = productDao.getAllProducts();
		modelHolder.put("products", allProducts);
		return "store";
	}
	
	@RequestMapping(path="/category/{categoryId}", method=RequestMethod.GET)
	public String displayFilteredProducts(ModelMap modelHolder, @PathVariable int categoryId) {
		List<Product> allFilteredProducts = productDao.getProductByBrand(categoryId);
		modelHolder.put("products", allFilteredProducts);
		return "store";
	}
	
	@RequestMapping(path="/detail/{productId}", method=RequestMethod.GET)
	public String showProductDetail(ModelMap modelHolder, @PathVariable Long productId) {
		Product product = productDao.getProductById(productId);
		modelHolder.put("product", product);
		return "productDetail";
	}
	
	@RequestMapping(path="/addToCart", method=RequestMethod.POST)
	public String showProductDetail(@RequestParam Long productId, @RequestParam BigDecimal quantityInput, HttpSession session, RedirectAttributes flashScope) {
		Product selectedProduct = productDao.getProductById(productId);
		Map<Product, BigDecimal> shoppingCart;
		
		if(session.getAttribute("shoppingCart") != null) {
			shoppingCart = (Map<Product, BigDecimal>)session.getAttribute("shoppingCart");
		} else {
			shoppingCart = new HashMap<>();
		}
		
		if(shoppingCart.containsKey(selectedProduct)) {
			BigDecimal quantity = (shoppingCart.get(selectedProduct));
			quantity = quantity.add(quantityInput);
			shoppingCart.put(selectedProduct, quantity);
		} else {
			shoppingCart.put(selectedProduct, quantityInput);
		}
		
		session.setAttribute("shoppingCart", shoppingCart);
		flashScope.addFlashAttribute("message", quantityInput + " " + selectedProduct.getName() + " was added to your cart!");
		
		return "redirect:/shoppingCart";
	}
	
	@RequestMapping(path="/shoppingCart", method=RequestMethod.GET)
	public String showShoppingCart(ModelMap modelHolder) {
		//Map<Product, BigDecimal> products = showShoppingCart(modelHolder, productId);
		//modelHolder.put("product", products);
		return "shoppingCart";
	}
}
