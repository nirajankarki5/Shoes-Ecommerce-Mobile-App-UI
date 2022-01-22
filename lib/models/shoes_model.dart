class Shoes {
  String name;
  int price;
  String image;
  bool isLiked;

  Shoes(
      {required this.image,
      required this.isLiked,
      required this.name,
      required this.price});
}

List<Shoes> shoesList = [
  Shoes(
    image: "assets/shoe1.png",
    isLiked: true,
    name: "Nike Men's Free RN Flyknit Running Shoe",
    price: 132,
  ),
  Shoes(
    image: "assets/shoe2.png",
    isLiked: true,
    name: "Nike Men's Flex Experience Run 9 4e Shoe",
    price: 154,
  ),
  Shoes(
    image: "assets/shoe3.png",
    isLiked: true,
    name: "Nike Men's Sneaker Gymnastics Shoes",
    price: 129,
  ),
  Shoes(
    image: "assets/shoe4.png",
    isLiked: false,
    name: "Nike Men's Court Lite 2 Tennis Shoe",
    price: 189,
  ),
];
