import 'package:barikoi_test/model_view/map_view_model.dart';
import 'package:barikoi_test/resources/app_assets/app_assets.dart';
import 'package:barikoi_test/resources/app_colors/app_colors.dart';
import 'package:barikoi_test/resources/app_strings/app_strings.dart';
import 'package:barikoi_test/resources/dimension/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maplibre_gl/mapbox_gl.dart';

import '../routes/routes_name.dart';

class MapView extends StatelessWidget {
  MapView({super.key});
  final MapViewModel mapViewModel = Get.put(MapViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          MaplibreMap(
            initialCameraPosition: mapViewModel.initialPosition,
            myLocationEnabled:
                true, // set map initial location where map will show first
            onMapCreated: (MaplibreMapController mapController) {
              mapController =
                  mapViewModel.mController!; //called when map object is created
            },
            styleString: MapViewModel.mapUrl, // barikoi map style url
          ),
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RoutesName.searchView);
                },
                child: Center(
                  child: Card(
                    color: AppColors.appWhiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: SizedBox(
                      width: AppDimension(context).width * .9,
                      height: AppDimension(context).height * .06,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppAssets.searchIcon),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  AppStrings.searchHere,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.appTillColor),
                                ),
                              ],
                            ),
                            Image.asset(AppAssets.miceIcon),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 25,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: mapViewModel.data.length,
                    itemBuilder: (context, index) {
                      var data = mapViewModel.data[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          decoration: const BoxDecoration(
                            color: AppColors.appWhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            children: [
                              Image.asset(data.icon.toString()),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                data.titel.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: AppColors.appLightBlackColor),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
