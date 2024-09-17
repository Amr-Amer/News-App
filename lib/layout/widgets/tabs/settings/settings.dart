import 'package:flutter/material.dart';
import 'package:news/constant/assets.dart';
import 'package:news/constant/theme.dart';
import 'package:news/layout/widgets/tabs/settings/languge_bottom_sheet.dart';

import '../../../../constant/strings.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'Settings';

  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            Assets.backgroundImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    Strings.instance.language,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 22,
                        ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const LanguageDropdown()
              ],
            ),
          ),
        )
      ],
    );
  }
}
