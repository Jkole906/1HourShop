package com.techelevator.model;

import java.util.List;

public interface ProductDao {

	public List<Product> getAllProducts();
	public Product getProductById(Long productId);
	public List<Product> getProductByBrand(Integer CatagoryId);
}
