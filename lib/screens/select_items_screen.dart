import 'package:Ishara_final_version_1/colors/colors.dart';
import 'package:Ishara_final_version_1/screens/select_items_home_screen.dart';
import 'package:Ishara_final_version_1/screens/sidebar.dart';
import 'package:flutter/material.dart';


class SelectItemsScreen extends StatefulWidget {
  const SelectItemsScreen({Key? key}) : super(key: key);

  @override
  State<SelectItemsScreen> createState() => _SelectItemsScreenState();
}

class _SelectItemsScreenState extends State<SelectItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mauve,
      //backgroundColor: green,

      body: Stack(
        children: [
          SelectItemsHomeScreen(),
          Sidebar(),

        ],
      ),
    );
  }
}
