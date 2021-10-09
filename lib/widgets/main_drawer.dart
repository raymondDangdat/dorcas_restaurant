import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/screens/products/products.dart';
import 'package:untitled/widgets/custom_text.dart';

class MainDrawer extends StatefulWidget {


  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Obx(()=>UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blueAccent
              ),
              accountName: Text(userController.userModel.value.name ?? ""),
              accountEmail: Text(userController.userModel.value.email ?? ""))),
          ListTile(
            leading: Icon(Icons.book),
            title: CustomText(
              text: "Payments History",
            ),
            onTap: ()async {
              Navigator.pop(context);
              paymentsController.getPaymentHistory();
            },
          ),
          userController.userModel.value.email == "dorcasadmin@gmail.com" ? Column(children: [
            ListTile(
              leading: Icon(Icons.restaurant_rounded),
              title: CustomText(
                text: "Manage Foods",
              ),
              onTap: ()async {
                Navigator.pop(context);
                Get.to(() => ProductsScreen());
              },
            ),

            ListTile(
              leading: Icon(Icons.bookmark_border_rounded),
              title: CustomText(
                text: "Manage Orders",
              ),
              onTap: ()async {
                Navigator.pop(context);
                paymentsController.getOrders();
              },
            ),
          ],) : Container(),
          ListTile(
            onTap: () {
              userController.signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log out"),
          )
        ],
      ),
    );
  }
}
