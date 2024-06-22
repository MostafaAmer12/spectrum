import 'package:flutter/material.dart';

void navigateNamedTo(
    {required BuildContext context, required String screen, var argument}) {
  Navigator.pushNamed(context, screen, arguments: argument);
}

void navigateAndFinish(
    {required BuildContext context, required Widget screen, var argument}) {
  Navigator.pushAndRemoveUntil(
    context,
     MaterialPageRoute(
      builder: (context) => screen,
    ),
    (route) => false,
    
  );
}

void navigateTo(
    {required BuildContext context, required Widget screen, var argument}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void navigateAndReplace(
    {required BuildContext context, required Widget screen, var argument}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

// void navigateTo({required BuildContext context,required String screen,var argument}){
//   Navigator.pushNamed(context, screen,arguments: argument);
// }

// void navigateAndFinish({required BuildContext context,required String screen,var argument}){
//   Navigator.pushNamedAndRemoveUntil(
//     context,
//     screen,
//     (route) =>false,
//     arguments: argument,
//   );
// }
