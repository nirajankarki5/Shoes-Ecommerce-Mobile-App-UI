import 'package:flutter/material.dart';
import 'package:shoes_ecommerce/utils/colors.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    );
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.2,
            blurRadius: 10,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Container(
            margin: const EdgeInsets.all(5),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: buttonColor),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          enabled: true,
          enabledBorder: border,
          focusedBorder: border,
          hintText: "Find Shoes",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
