import 'package:barikoi_test/model_view/home_view_model.dart';
import 'package:barikoi_test/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:barikoi_test/views/widgets/modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final homeViewModel = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: Stack(
        children: [
          Obx(() => homeViewModel.currentScreen.value!),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}
