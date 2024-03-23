import 'package:flutter/material.dart';

import '../../resources/app_colors/app_colors.dart';
import '../../resources/dimension/app_dimension.dart';
import '../../utils/style.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color bgColor;
  final Color borderColor;
  const InformationCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.bgColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: AppDimension(context).width * .2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.fontStyle1,
              ),
              const Text(
                ":",
                style: TextStyles.fontStyle1,
              )
            ],
          ),
        ),
        SizedBox(
          width: AppDimension(context).width * .1,
        ),
        Container(
          width: AppDimension(context).width * .3,
          height: 18,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: borderColor)),
          child: Center(
            child: Text(
              subTitle,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.appTillColor),
            ),
          ),
        )
      ],
    );
  }
}
