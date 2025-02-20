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
    title: "All",
    image: "images/cacdanhmuc/sale.png",
  ),
  Category(
    title: "200k",
    image: "images/cacdanhmuc/sale2.png",
  ),
  Category(
    title: "500k",
    image: "images/cacdanhmuc/sale3.png",
  ),
  Category(
    title: "1M",
    image: "images/cacdanhmuc/sale4.png",
  ),
  Category(
    title: "5M",
    image: "images/cacdanhmuc/sale5.png",
  ),
  Category(
    title: "VIP",
    image: "images/cacdanhmuc/sale6.png",
  ),
];