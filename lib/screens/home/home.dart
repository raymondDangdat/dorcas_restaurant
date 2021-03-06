import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/screens/home/widgets/products.dart';
import 'package:untitled/screens/home/widgets/shopping_cart.dart';
import 'package:untitled/widgets/custom_text.dart';
import 'package:untitled/widgets/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: CustomText(
            text: "Dorcas' Restaurant",
            size: 24,
            weight: FontWeight.bold,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Container(
                width: 45,
                height: 40,
                child: Stack(
                  children: [
                    IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          showBarModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              color: Colors.white,
                              child: ShoppingCartWidget(),
                            ),
                          );
                        }),
                    // Positioned(
                    //   right: 0,
                    //     top: 7,
                    //     child: Text('${cartController.cartItems.value}', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),))
                  ],
                ),
              ),
            )
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: Container(
          color: Colors.white30,
          child: ProductsWidget(),
        ));
  }
}
