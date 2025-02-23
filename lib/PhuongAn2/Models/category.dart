class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: "Hot",
    image: "images/category/cate1.png",
  ),
  Category(
    title: "Acc\nNOR",
    image: "images/category/cate2.png",
  ),
  Category(
    title: "Acc\nVIP",
    image: "images/category/cate3.png",
  ),
  Category(
    title: "Acc\nReg",
    image: "images/category/cate4.png",
  ),
  Category(
    title: "Acc\nRandom",
    image: "images/category/cate5.png",
  ),
];