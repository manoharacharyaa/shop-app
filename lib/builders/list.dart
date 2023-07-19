import 'package:flutter/material.dart';
import '../global_variable.dart';
import '../pages/products_details_page.dart';
import '../widgets/products_cards.dart';

class ListBuilder extends StatelessWidget {
  const ListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            print(product);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProductsDetailsPage(product: product);
                },
              ),
            );
          },
          child: ProductCard(
            title: product['title'] as String,
            price: product['price'] as double,
            image: product['imageUrl'] as String,
            backgroundColor: index.isEven
                ? const Color.fromRGBO(216, 240, 253, 1)
                : Color.fromARGB(255, 182, 217, 253),
          ),
        );
      },
    );
  }
}
