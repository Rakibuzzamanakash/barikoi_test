import 'package:barikoi_test/routes/routes_name.dart';
import 'package:barikoi_test/views/home_view.dart';
import 'package:barikoi_test/views/search_view.dart';
import 'package:get/get.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(name: RoutesName.homeView,
        page: ()=> HomeView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: RoutesName.searchView,
        page: ()=>  SearchView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}