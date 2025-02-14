import 'package:flutter/material.dart';
import 'package:news/layout/widgets/category/category_details_view_model.dart';
import 'package:news/layout/widgets/tabs/tab_widget.dart';
import 'package:news/model/category.dart';
import 'package:provider/provider.dart';

import '../../../constant/colors.dart';
import '../../../constant/strings.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Category Details';
  CategoryDM category;

  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _HomeScreenState();
}

CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

class _HomeScreenState extends State<CategoryDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
            builder: (context, value, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getSource(widget.category.id);
                    setState(() {});
                  },
                  child: Text(Strings.instance.tryAgain),
                ),
              ],
            );
          } else if (viewModel.sourcesList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else {
            return TabWidget(sourcesList: viewModel.sourcesList!);
          }
        }));
  }
}

