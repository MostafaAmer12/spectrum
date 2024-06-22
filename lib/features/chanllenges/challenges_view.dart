import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:flutter/material.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({super.key});

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
                    'Challenges',
                    style: AppStyles.customTextStyleBl3,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.primaryB.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/ReadABook2.jpg'),
                        radius: 40,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Complete 1000 word streak',
                            style: AppStyles.customTextStyleBl,
                          ),
                          Text(
                            'Win 1000XP along with 300 diamonds.',
                            style: AppStyles.customTextStyleBl4,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
