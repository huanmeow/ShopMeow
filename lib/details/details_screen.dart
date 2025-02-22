import 'package:flutter/material.dart';
import '../PhuongAn2/Models/product_models.dart';
import '../utils/contants.dart';
import 'depcristion.dart';
import 'details_appbar.dart';
import 'details_card.dart';
import 'details_item.dart';
import 'details_slider.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailAppBar(
                product: widget.product,
              ),
              MyImageSlider(
                image: widget.product.image,
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
              ),
              const SizedBox(height: 10),
              // Các indicator cho slider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5, // Giả sử có 5 ảnh, bạn nên thay bằng widget.product.image.length nếu image là List<String>
                      (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentImage == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentImage == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemsDetails(product: widget.product),
                    const SizedBox(height: 25),
                    Description(
                      description: widget.product.description,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}