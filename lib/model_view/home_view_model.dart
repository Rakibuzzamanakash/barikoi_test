import 'package:barikoi_test/views/map_view.dart';
import 'package:barikoi_test/views/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

 final  RxInt selectedIndex = 0.obs;
 final currentScreen = Rx<Widget?>(null);

 @override
  void onInit() {
    super.onInit();
    changesScreen(0);
  }

 void changesScreen(int index){
   switch(index) {
     case 0:
       currentScreen.value =  MapView();
       break;
     case 1:
       currentScreen.value = const SaveView();
       break;
     default:
       currentScreen.value =  MapView();
   }
   selectedIndex.value = index;
   }
 }



