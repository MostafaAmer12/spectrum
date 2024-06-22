import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:flutter/material.dart';

SizedBox upperDisappearImage(double sW) {
  return SizedBox(
    height: 450,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: const BoxDecoration(
            color: AppStyles.primaryG2,
            image: DecorationImage(
              image: AssetImage('assets/image1.jpg'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 161.33,
                height: 118.67,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: sW,
            height: 20,
            decoration: const ShapeDecoration(
              color: AppStyles.primaryW2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  side: BorderSide(color: AppStyles.primaryW2)),
            ),
          ),
        )
      ],
    ),
  );
}
