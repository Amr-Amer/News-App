import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';

import '../../../constant/colors.dart';

class TabItem extends StatelessWidget {
  bool isSelected;

  Source source;

  TabItem({super.key, required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryLightColor,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: isSelected ? AppColors.primaryLightColor : Colors.transparent,
      ),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: isSelected
                  ? AppColors.whiteColor
                  : AppColors.primaryLightColor,
              fontSize: 18,
            ),
      ),
    );
  }
}
