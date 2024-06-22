import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:educational_kids_game/core/consts/const_text.dart';
import 'package:educational_kids_game/core/consts/navigation_classes.dart';
import 'package:educational_kids_game/core/services/cache_services.dart';
import 'package:educational_kids_game/core/shared_widgets/button_builder.dart';
import 'package:educational_kids_game/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryW2,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppStyles.primaryB.withOpacity(0.2),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Profile',
                    style: AppStyles.customTextStyleBl3,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/ReadABook2.jpg'),
                        radius: 40,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            CacheService.getData(key: ConstText().name),
                            style: AppStyles.customTextStyleBl,
                          ),
                          Text(
                            CacheService.getData(key: ConstText().email),
                            style: AppStyles.customTextStyleBl4,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                  ButtonBuilder(
                      text: 'Sign Out',
                      ontap: () {
                        CacheService.clearData();
                        navigateAndFinish(
                            context: context, screen: const LoginView());
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
