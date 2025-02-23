import 'package:flutter/material.dart';
import '../PhuongAn2/Models/product_models.dart';
import 'dart:async';
import 'depcristion.dart';
import 'details_appbar.dart';
import 'details_card.dart';
import 'details_item.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  late PageController _pageController;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    currentImage = 0;
    _pageController = PageController(initialPage: 0); // Khởi tạo PageController
    _startAutoSlider();
  }
  @override
  void dispose() {
    _pageController.dispose(); // Hủy PageController
    _timer?.cancel();
    super.dispose();
  }
  void _startAutoSlider() {
    _timer?.cancel(); // Hủy timer cũ (nếu có)
    if (widget.product.image != null && widget.product.image.isNotEmpty) {
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (mounted) { // Kiểm tra widget đã mount hay chưa
          setState(() {
            currentImage = (currentImage + 1) % widget.product.image.length;
            _pageController.animateToPage(
              currentImage,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(
                height: 250, // Hoặc chiều cao mong muốn
                child: PageView.builder(
                  controller: _pageController, // Gán PageController cho PageView
                  itemCount: widget.product.image.length, // Số lượng ảnh
                  onPageChanged: (index) {
                    setState(() {
                      currentImage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Hero(
                      tag: widget.product.image[index],
                      child: Image.asset(
                        widget.product.image[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.product.image.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
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