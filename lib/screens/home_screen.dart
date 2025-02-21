import 'package:flutter/material.dart';
import '../PhuongAn2/Home/image_slider.dart';
import '../PhuongAn2/Home/product.dart';
import '../PhuongAn2/Home/search.dart';
import '../PhuongAn2/Models/category.dart';
import '../PhuongAn2/Models/product_models.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectcategories = [
      pick,
      sale,
      random,
      reg,
      randomvip,
      randomfree,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const MySearchBAR(),
              const SizedBox(height: 20),
              ImageSlider(),
              const SizedBox(height: 20),
              categoryItems(),
              const SizedBox(height: 20),
              if (selectedIndex == 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Center(
                      child: Text(
                        "Đề xuất cho bạn",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    TextButton( // Thay bằng TextButton để có hiệu ứng khi nhấn
                      onPressed: () {

                      },
                      child: const Text(
                        "Xem thêm",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),)
                  ],
                ),
              // for shopping items
              const SizedBox(height: 10),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: selectcategories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: selectcategories[selectedIndex][index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  SizedBox categoryItems() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:3 ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: selectedIndex == index
                      ? Colors.blue[200]
                      : Colors.transparent,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(categoriesList[index].image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoriesList[index].title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}