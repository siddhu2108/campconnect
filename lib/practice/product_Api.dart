import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> productList = json.decode(response.body)['products'];
      setState(() {
        products = productList.map((json) => Product.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0), // Adjust the value as needed
            child: ListTile(
              leading: Container(
                height: 100,
                width: 100,
                child: ClipRRect(
                  child: Image.network(
                    products[index].thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(products[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(products[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title,
            selectionColor: Colors.orange,
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('Title:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text(product.title, style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Description:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text(product.description, style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Price:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text('\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Discount Percentage:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text('${product.discountPercentage}%',
                  style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Rating:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text('${product.rating}', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Stock:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text('${product.stock}', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Brand:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text('${product.brand}', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 8.0),
              Text('Category:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text('${product.category}', style: TextStyle(fontSize: 16.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.badge),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }
}
