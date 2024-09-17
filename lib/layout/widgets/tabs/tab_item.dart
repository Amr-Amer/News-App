import 'package:flutter/material.dart';
import 'package:news/constant/theme.dart';
import 'package:news/model/SourceResponse.dart';

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
          color: MyTheme.primaryLightColor,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: isSelected ? MyTheme.primaryLightColor : Colors.transparent,
      ),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color:
                  isSelected ? MyTheme.whiteColor : MyTheme.primaryLightColor,
              fontSize: 18,
            ),
      ),
    );
  }
}
