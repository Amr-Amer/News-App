import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import '../../../constant/strings.dart';

class HomeDrawer extends StatelessWidget {
  Function onSideMenuItemClick;
  static const int categories = 1;
  static const int settings = 2;

  HomeDrawer({super.key, required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          color: AppColors.primaryLightColor,
          child: Text(
            Strings.instance.newsApp,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                const Icon(Icons.list),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  Strings.instance.categories,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              onSideMenuItemClick(settings);
            },
            child: Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  Strings.instance.settings,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
