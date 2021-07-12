import 'package:ds1/Managers/PageManager.dart';
import 'package:ds1/Managers/UserManager.dart';
import 'package:ds1/screens/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserManager>(
        builder: (context, userManager, child) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              HomeScreen(),
            ],
          );
        },
      ),
    );
  }
}
