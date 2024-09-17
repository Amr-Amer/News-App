import 'package:flutter/material.dart';

import '../constant/assets.dart';
import '../constant/colors.dart';
import '../constant/strings.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;
  Color color;

  CategoryDM(
      {required this.title,
      required this.imagePath,
      required this.id,
      required this.color});

  static List<CategoryDM> getCategories() {
    return [
      CategoryDM(
          title: Strings.instance.sports,
          imagePath: Assets.sportsImage,
          id: 'sports',
          color: AppColors.redColor),
      CategoryDM(
          title: Strings.instance.general,
          imagePath: Assets.generalImage,
          id: 'general',
          color: AppColors.blueColor),
      CategoryDM(
          title: Strings.instance.health,
          imagePath: Assets.healthImage,
          id: 'health',
          color: AppColors.pinkColor),
      CategoryDM(
          title: Strings.instance.business,
          imagePath: Assets.businessImage,
          id: 'business',
          color: AppColors.brownColor),
      CategoryDM(
          title: Strings.instance.entertainment,
          imagePath: Assets.entertainmentImage,
          id: 'entertainment',
          color: AppColors.blueColor),
      CategoryDM(
          title: Strings.instance.science,
          imagePath: Assets.scienceImage,
          id: 'science',
          color: AppColors.yellowColor),
    ];
  }
}
