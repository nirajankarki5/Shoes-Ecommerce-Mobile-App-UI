class Shoes {
  String name;
  int price;
  String image;
  bool isLiked;
  String description;
  List<int> sizes;
  List<String> color;

  Shoes({
    required this.image,
    required this.isLiked,
    required this.name,
    required this.price,
    required this.description,
    required this.sizes,
    required this.color,
  });
}

List<Shoes> shoesList = [
  Shoes(
    image: "assets/shoe1.png",
    isLiked: true,
    name: "Nike Men's Free RN Flyknit Running Shoe",
    price: 132,
    description:
        "Flyknit constructed upper delivers zoned stretch and support. Dual-density midsole and tri-star outsole provide flexible cushioning. Dynamic heel is stretchy for a snug, adaptive fit.",
    color: ["red", "orange", "blue"],
    sizes: [42, 43, 44, 45],
  ),
  Shoes(
    image: "assets/shoe2.png",
    isLiked: true,
    name: "Nike Men's Flex Experience Run 9 4e Shoe",
    price: 154,
    description:
        "Flex grooves in the outsole move naturally with your foot, delivering comfort with every step. Stretchy material at the toe helps you move freely during your run",
    color: ["red", "orange", "blue"],
    sizes: [42, 43, 44, 45],
  ),
  Shoes(
    image: "assets/shoe3.png",
    isLiked: true,
    name: "Nike Men's Sneaker Gymnastics Shoes",
    price: 129,
    description:
        "A deconstructed Heel conforms to your foot, helping you stay SECURE during your route. Support at the midfoot adds another layer of lockdown comfort",
    color: ["red", "orange", "blue"],
    sizes: [42, 43, 44, 45],
  ),
  Shoes(
    image: "assets/shoe4.png",
    isLiked: false,
    name: "Nike Men's Court Lite 2 Tennis Shoe",
    price: 189,
    description:
        "The Nike Air Max Motion impresses with a breathable mesh upper with seamless covers for a heritage style. The large U-shaped Max Air element and heel clip ensure maximum visual look and cushioning.",
    color: ["red", "orange", "blue"],
    sizes: [42, 43, 44, 45],
  ),
];
