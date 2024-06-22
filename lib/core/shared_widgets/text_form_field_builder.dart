import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:flutter/material.dart';

class TextFormFieldBuilder extends StatelessWidget {
  const TextFormFieldBuilder({
    super.key,
    required this.label,
    required this.controller,
    required this.type,
    this.width,
    this.suffix,
    this.onchanged,
    this.onpressed,
    this.obsecure = false,
    this.color,
    this.validator,
  });

  final String label;
  final Function(String)? onchanged;
  final bool? obsecure;
  final Function? onpressed;
  final Widget? suffix;
  final TextEditingController? controller;
  final TextInputType? type;
  final double? width;
  final Color? color;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: screenHeight * 0.09,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: obsecure!,
        style: const TextStyle(
          color: AppStyles.primaryB,
        ),
        validator: validator,
        onChanged: onchanged,
        keyboardType: type,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppStyles.primaryW2,
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppStyles.primaryW2,
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: AppStyles.primaryW,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: suffix,
          ),
          hintText: label,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppStyles.primaryB,
              width: 2.0,
            ),
          ),
          labelStyle: AppStyles.customTextStyleBl,
        ),
      ),
    );
  }
}
