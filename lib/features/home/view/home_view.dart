import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:educational_kids_game/core/consts/navigation_classes.dart';
import 'package:educational_kids_game/features/home/widgets/web_view_games.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryW2,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Learning Numbers',
                    style: AppStyles.customTextStyleBl3,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      gameContainer(context, 'Writing Numbers',
                          Icons.format_list_numbered_rounded, () {
                        navigateTo(
                            context: context,
                            screen: const WebViewContainer(
                              gameUrl:
                                  'https://www.autistichub.com/play/numberwriting/index.html',
                              gameName: 'Number Writing',
                            ));
                      }),
                      const Spacer(),
                      lockedContainer(context),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    'Learning Letters',
                    style: AppStyles.customTextStyleBl3,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      gameContainer(
                          context, 'Writing Letters', Icons.sort_by_alpha, () {
                        navigateTo(
                            context: context,
                            screen: const WebViewContainer(
                              gameUrl:
                                  'https://www.autistichub.com/play/letterwriting/index.html',
                              gameName: 'Letter Writing',
                            ));
                      }),
                      const Spacer(),
                      lockedContainer(context),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    'Playing Puzzles',
                    style: AppStyles.customTextStyleBl3,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      gameContainer(context, 'Playing Puzzles', Icons.extension,
                          () {
                        navigateTo(
                            context: context,
                            screen: const WebViewContainer(
                              gameUrl: 'https://www.autistichub.com/play/jigsawpuzzle/index.html',
                              gameName: 'Puzzle',
                            ));
                      }),
                      const Spacer(),
                      lockedContainer(context),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container lockedContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppStyles.primaryB.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      width: MediaQuery.of(context).size.width * 0.42,
      height: 150,
      child: const Icon(
        Icons.lock,
        size: 46,
        color: AppStyles.primaryG,
      ),
    );
  }

  GestureDetector gameContainer(BuildContext context, String section,
      IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppStyles.primaryB.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16)),
        width: MediaQuery.of(context).size.width * 0.42,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Icon(
              icon,
              size: 30,
              color: AppStyles.primaryO,
            ),
            const Spacer(),
            Text(
              section,
              style: const TextStyle(
                  color: AppStyles.primaryO,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  Container appBar() {
    return Container(
      color: AppStyles.primaryB.withOpacity(0.2),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Spacer(),
            Icon(
              Icons.fireplace,
              color: AppStyles.primaryO,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '3',
              style: TextStyle(color: AppStyles.primaryO),
            ),
            Spacer(),
            Icon(
              Icons.home_repair_service,
              color: AppStyles.primaryB,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '1432',
              style: TextStyle(color: AppStyles.primaryB),
            ),
            Spacer(),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.all_inclusive_outlined,
              color: Colors.red,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
