import 'package:barikoi_test/model_view/home_view_model.dart';
import 'package:barikoi_test/resources/app_assets/app_assets.dart';
import 'package:barikoi_test/resources/app_colors/app_colors.dart';
import 'package:barikoi_test/resources/app_strings/app_strings.dart';
import 'package:barikoi_test/resources/dimension/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: AppDimension(context).height * .07,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.appWhiteColor,
            border: Border(top: BorderSide(width: 1, color: Colors.black12)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            // color: Colors.blue
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  homeViewModel.changesScreen(0);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 92,
                    height: 64,
                    decoration: BoxDecoration(
                      color: homeViewModel.selectedIndex.value == 0
                          ? AppColors.appTillColor
                          : AppColors.appTransparentColor,
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.locationIcon),
                        Text(
                          AppStrings.bariKoiMap,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: homeViewModel.selectedIndex.value == 0
                                ? AppColors.appWhiteColor
                                : AppColors.appTillColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  homeViewModel.changesScreen(1);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 92,
                    height: 64,
                    decoration: BoxDecoration(
                      color: homeViewModel.selectedIndex.value == 1
                          ? AppColors.appTillColor
                          : AppColors.appTransparentColor,
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.saveIcon),
                        Text(
                          AppStrings.saved,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: homeViewModel.selectedIndex.value == 1
                                ? AppColors.appWhiteColor
                                : AppColors.appTillColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
