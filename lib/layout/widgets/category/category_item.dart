import 'package:flutter/material.dart';
import 'package:news/model/category.dart';

class CategoryItme extends StatelessWidget {
  CategoryDM category;
  int index;

  CategoryItme({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft: Radius.circular(
              index % 2 == 0 ? 25 : 0,
            ),
            bottomRight: Radius.circular(
              index % 2 == 0 ? 0 : 25,
            ),
          )),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
