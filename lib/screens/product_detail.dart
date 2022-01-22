import 'package:flutter/material.dart';
import 'package:shoes_ecommerce/models/shoes_model.dart';
import 'package:shoes_ecommerce/utils/colors.dart';

class ProductDetail extends StatefulWidget {
  final Shoes shoes;
  ProductDetail({Key? key, required this.shoes}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late String sizeDropdown;
  late String colorDropdown;
  late String qtyDropdown;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        extendBody: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: buttonColor,
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: buttonColor,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        image: AssetImage("assets/avatar.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                widget.shoes.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: widget.shoes.isLiked
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    )
                  : const Icon(Icons.favorite_border),
            ),
            Center(
              child: Image(
                height: 150,
                image: AssetImage(widget.shoes.image),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              // height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(5, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.shoes.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        color: buttonColor,
                        size: 20,
                      ),
                      const Text(
                        "  Retail Price: ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4,
                        ),
                      ),
                      Text(
                        " \$",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: buttonColor),
                      ),
                      Text(
                        "${widget.shoes.price}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    // height: 75,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: buttonColor.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Size"),
                            DropdownButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: buttonColor,
                              ),
                              items: widget.shoes.sizes.map((int items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text("$items"),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  sizeDropdown = "$newValue";
                                });
                              },
                              value: widget.shoes.sizes[0],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Color"),
                            DropdownButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: buttonColor,
                              ),
                              items: widget.shoes.color.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text("$items"),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  colorDropdown = "$newValue";
                                });
                              },
                              value: widget.shoes.color[0],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Quantity"),
                            DropdownButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: buttonColor,
                              ),
                              items:
                                  ["1", "2", "3", "4", "5"].map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text("$items"),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  qtyDropdown = "$newValue";
                                });
                              },
                              value: "1",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Center(
            child: MaterialButton(
              onPressed: () {},
              color: buttonColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              height: 50,
              minWidth: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Add To Bag     ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Icon(
                    Icons.local_mall_outlined,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
