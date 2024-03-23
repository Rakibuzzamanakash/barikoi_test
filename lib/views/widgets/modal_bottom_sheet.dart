import 'package:flutter/material.dart';

import '../../resources/app_assets/app_assets.dart';
import '../../resources/app_colors/app_colors.dart';
import '../../resources/dimension/app_dimension.dart';
import '../../utils/style.dart';
import 'custom_bottom_navigation_bar.dart';
import 'custom_information_widget.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final String? area;
  final String? address;
  final String? long;
  final String? lat;
  final String? postCode;
  final String? district;
  final String? placeCode;
  final Function? action;

  const CustomModalBottomSheet(
      {super.key,
      this.area,
      this.address,
      this.long,
      this.lat,
      this.postCode,
      this.district,
      this.placeCode,
      this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimension(context).height * .5,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 3))
          ]),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 5,
                  width: 48,
                  decoration: const BoxDecoration(
                      color: AppColors.appLightTillColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppDimension(context).width * .8,
                          child: Text(
                            area!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.appLightBlackColor,
                                fontSize: 18),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (action != null) {
                              action!(); // Call the action function if it's not null
                            }
                          },
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.appLightTillColor,
                                )
                                //borderRadius: BorderRadius.circular(20),
                                ),
                            child: Image.asset(AppAssets.blackSaveIcon),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: AppDimension(context).width * .8,
                      child: Text(
                        address!,
                        maxLines: 2,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.appLightBlackColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          const Text(
                            "Sports club  ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColors.appLightBlackColor),
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                                color: AppColors.appLightBlackColor,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.car_rental,
                              color: AppColors.appLightBlackColor,
                              size: 16,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("9 min", style: TextStyles.fontStyle1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: AppColors.appLightBlackColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${long!}"N, ${lat!}"E',
                          style: TextStyles.fontStyle1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              InformationCard(
                  title: "Place Code",
                  subTitle: placeCode!,
                  bgColor: AppColors.appLightTillColor,
                  borderColor: AppColors.appTillColor),
              const SizedBox(
                height: 10,
              ),
              InformationCard(
                  title: "District",
                  subTitle: district!,
                  bgColor: AppColors.appRedLightColor,
                  borderColor: AppColors.appRedColor),
              const SizedBox(
                height: 10,
              ),
              InformationCard(
                  title: "Post Code",
                  subTitle: postCode!,
                  bgColor: AppColors.appBlueLightColor,
                  borderColor: AppColors.appBlueColor),
            ],
          ),
          const Spacer(),
          CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}
