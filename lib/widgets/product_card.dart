import 'package:flutter/material.dart';
import 'package:shoes_ecommerce/models/shoes_model.dart';
import 'package:shoes_ecommerce/screens/product_detail.dart';
import 'package:shoes_ecommerce/utils/colors.dart';

class ProductCard extends StatelessWidget {
  final Shoes shoes;
  const ProductCard({Key? key, required this.shoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(shoes: shoes)));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.2,
              blurRadius: 10,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "\$",
                  style: TextStyle(
                      color: buttonColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                Text(
                  "${shoes.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                shoes.isLiked
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      )
                    : const Icon(Icons.favorite_border)
              ],
            ),
            Container(
              height: 90,
              child: Image(
                image: AssetImage(shoes.image),
              ),
            ),
            Text(
              shoes.name,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
