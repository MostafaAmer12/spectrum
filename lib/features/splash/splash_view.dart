import 'dart:async';

import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:educational_kids_game/core/consts/const_text.dart';
import 'package:educational_kids_game/core/services/cache_services.dart';
import 'package:educational_kids_game/features/auth/presentation/view/login_view.dart';
import 'package:educational_kids_game/features/layout/bottom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CacheService.getData(key: ConstText().token) == null
                  ? const LoginView()
                  : const BottomTabBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.primaryW2,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Container(
              height: size.height * 0.25,
              width: size.width / 1.2,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.asset(
                "assets/splash.png",
              ),
            )
                .animate()
                .slide(duration: const Duration(milliseconds: 900))
                .fadeIn(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 900))
                .saturate()
                .flip(duration: const Duration(milliseconds: 830))
                .then()
                .shimmer(duration: const Duration(milliseconds: 850))
                .then()
                .shimmer(duration: const Duration(milliseconds: 850)),
            const Spacer(
              flex: 2,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
