import 'package:flutter/material.dart';
import '../global_variable.dart';
import '../pages/products_details_page.dart';
import '../widgets/products_cards.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
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
