import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:flutter/material.dart';

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({
    super.key,
    required this.text,
    required this.ontap,
    this.width,
    this.isLoading,
  });
  final String text;
  final VoidCallback ontap;
  final double? width;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: isLoading == null || isLoading == false
          ? Center(
              child: Container(
                width: width ?? screenWidth * 0.44,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppStyles.primaryO,
                ),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppStyles.primaryW,
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: Container(
                width: width ?? screenWidth * 0.44,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppStyles.primaryG,
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
    );
  }
}
