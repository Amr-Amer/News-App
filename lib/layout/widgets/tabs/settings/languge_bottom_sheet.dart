import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constant/strings.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: context.locale.languageCode,
          icon: const Icon(Icons.arrow_drop_down_circle_outlined,
              color: Colors.white),
          dropdownColor: Colors.white,
          items: [
            DropdownMenuItem(
              value: 'en',
              child: Text(
                Strings.instance.english,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Text(
                Strings.instance.arabic,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              context.setLocale(Locale(newValue));
            }
          },
          style: Theme.of(context).textTheme.titleMedium,
          isExpanded: true,
        ),
      ),
    );
  }
}
