import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:educational_kids_game/features/auth/presentation/widget/upper_disappear_image.dart';
import 'package:flutter/material.dart';

SliverAppBar floatAppBar(double sW, double sH) {
  return SliverAppBar(
    centerTitle: true,
    backgroundColor: AppStyles.primaryW2,
    flexibleSpace: FlexibleSpaceBar(
      background: upperDisappearImage(sW),
      stretchModes: const [
        StretchMode.zoomBackground,
      ],
    ),
    expandedHeight: sH,
    floating: false,
    pinned: false,
    snap: false,
    stretch: true,
  );
}
