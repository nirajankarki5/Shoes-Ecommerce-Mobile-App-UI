import 'package:flutter/material.dart';
import 'package:shoes_ecommerce/models/shoes_model.dart';
import 'package:shoes_ecommerce/utils/colors.dart';
import 'package:shoes_ecommerce/widgets/product_card.dart';
import 'package:shoes_ecommerce/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<String> brand = ["Nike", "Adidas", "Puma", "Balenciaga", "Converse"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 60,
              // color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 28,
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
            SearchBar(),
            const SizedBox(height: 30),
            const Text(
              "Categories",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: brand
                  .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            index = brand.indexOf(e);
                          });
                        },
                        child: Text(
                          e,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: index == brand.indexOf(e)
                                  ? Colors.black
                                  : Colors.grey[400]),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 30),
            GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 9 / 10,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: shoesList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ProductCard(shoes: shoesList[index]);
                }),
          ],
        ),
      ),
    );
  }
}
