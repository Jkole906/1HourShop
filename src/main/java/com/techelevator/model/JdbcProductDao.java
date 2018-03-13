package com.techelevator.model;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcProductDao implements ProductDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcProductDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Product> getAllProducts() {
		List<Product> allProducts = new ArrayList<>();
		String sqlSelectAllProducts = "SELECT * FROM products";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllProducts);
		while(results.next()) {
			allProducts.add(mapRowToProduct(results));
		}
		return allProducts;
	}
	
	@Override
	public List<Product> getProductByBrand(Integer categoryId) {
		List<Product> filteredProducts = new ArrayList<>();
		String sqlSelectProductsByBrand = "SELECT * FROM products WHERE category_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectProductsByBrand, categoryId);
		while(results.next()) {
			filteredProducts.add(mapRowToProduct(results));
		}
		return filteredProducts;
	}

	@Override
	public Product getProductById(Long productId) {
		Product product = null;
		String sqlSelectProductById = "SELECT * FROM products WHERE id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectProductById, productId);
		if(results.next()) {
			product = mapRowToProduct(results);
		}
		return product;
	}

//	public void save(Product product) {
//		String sqlInsertProduct = "INSERT INTO products(id, name, description, price, image) VALUES(?, ?, ?, ?, ?)";
//		Long id = getNextId();
//		BigDecimal price = new BigDecimal(product.getPrice().toString().replace("$", ""));
//		jdbcTemplate.update(sqlInsertProduct, id, product.getName(), product.getDescription(), price, product.getImage());
//		product.setId(id);
//	}

	private Product mapRowToProduct(SqlRowSet row) {
		Product product = new Product();
		product.setId(row.getLong("id"));
		product.setName(row.getString("name"));
		product.setDescription(row.getString("description"));
		product.setPrice(row.getBigDecimal("price"));
		product.setImage(row.getString("image"));
		product.setCatagoryId(row.getInt("category_id"));

		return product;
	}

	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_id')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		if(result.next()) {
			return result.getLong(1);
		} else {
			throw new RuntimeException("Something went wrong while getting the next product id");
		}
	}
}
