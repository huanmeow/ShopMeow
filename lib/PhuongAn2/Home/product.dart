
import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../Models/product_models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailScreen(product: product),
        //   ),
        // );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kcontentColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                // Center(
                //   child: Hero(
                //     tag: product.id, // Sử dụng product.id làm tag
                //     child: Material( // Bọc Image trong Material
                //       child: Image.asset(
                //         product.image[index],
                //         width: 150,
                //         height: 150,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    //color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // provider.toggleFavorite(product);
                    },
                    child: const Icon( Icons.favorite_border),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}