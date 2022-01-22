import 'package:flutter/material.dart';
import 'package:shoes_ecommerce/models/shoes_model.dart';
import 'package:shoes_ecommerce/utils/colors.dart';

class MyBagScreen extends StatefulWidget {
  const MyBagScreen({Key? key}) : super(key: key);

  @override
  State<MyBagScreen> createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  int quantity = 1;
  late String qtyDropdown;

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
            const SizedBox(height: 15),
            const Text(
              "My Bag",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87),
            ),
            const SizedBox(height: 5),
            Text(
              "Check and pay your shoes",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400]),
            ),
            const SizedBox(height: 25),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: shoesList.length,
              itemBuilder: (context, index) {
                final item = shoesList[index].name;
                return Dismissible(
                  key: Key(item),
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    setState(() {
                      shoesList.removeAt(index);
                    });

                    // Then show a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$item dismissed')));
                  },
                  // Show a red background as the item is swiped away.
                  background: Stack(
                    children: [
                      Container(color: buttonColor.withOpacity(0.5)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.delete_outline,
                                size: 30,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.delete_outline,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0.2,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "\$",
                                    style: TextStyle(
                                        color: buttonColor,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "${shoesList[index].price}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  quantityWidget(),
                                  const Text(
                                    "      |      ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16),
                                  ),
                                  DropdownButton(
                                    isDense: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: buttonColor,
                                    ),
                                    items:
                                        shoesList[index].sizes.map((int items) {
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
                                    value: shoesList[index].sizes[0],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Image(
                          height: 60,
                          width: 100,
                          image: AssetImage(shoesList[index].image),
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            MaterialButton(
              onPressed: () {},
              color: buttonColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              height: 50,
              minWidth: 100,
              child: const Text(
                "Checkout",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget quantityWidget() {
    return Container(
        height: 30,
        width: 60,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  quantity -= 1;
                });
              },
              child: Container(
                  height: 30,
                  width: 20,
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      size: 20,
                      color: Colors.grey,
                    ),
                  )),
            ),
            Container(
                height: 30,
                width: 20,
                child: Center(
                  child: Text(
                    "$quantity",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            GestureDetector(
              onTap: () {
                setState(() {
                  quantity += 1;
                });
              },
              child: Container(
                  height: 30,
                  width: 20,
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.grey,
                    ),
                  )),
            )
          ],
        ));
  }
}
