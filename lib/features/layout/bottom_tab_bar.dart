import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:educational_kids_game/features/chanllenges/challenges_view.dart';
import 'package:educational_kids_game/features/home/view/home_view.dart';
import 'package:educational_kids_game/features/profile/profile_view.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: Column(
        children: [
          const Expanded(
            child: TabBarView(
              children: [
                HomeView(),
                ChallengesView(),
                ProfileView(),
              ],
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.97,
            decoration: BoxDecoration(
              color: AppStyles.primaryG2,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              dividerColor: Colors.transparent,
              labelColor: AppStyles.primaryO,
              unselectedLabelColor: AppStyles.primaryG,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  child: selectedIndex == 0
                      ? const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text(
                              'Home',
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        )
                      : const Icon(Icons.home),
                ),
                Tab(
                  child: selectedIndex == 1
                      ? const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.track_changes_outlined),
                            Text(
                              'Challenges',
                              style: TextStyle(fontSize: 8),
                            )
                          ],
                        )
                      : const Icon(Icons.track_changes_outlined),
                ),
                Tab(
                  child: selectedIndex == 2
                      ? const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            Text(
                              'Profile',
                              style: TextStyle(fontSize: 8),
                            )
                          ],
                        )
                      : const Icon(Icons.person),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      )),
    );
  }
}
