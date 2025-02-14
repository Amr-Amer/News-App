import 'package:flutter/material.dart';
import 'package:news/constant/colors.dart';
import 'package:news/layout/widgets/news/news_details.dart';
import 'package:news/layout/widgets/news/news_item.dart';
import 'package:news/layout/widgets/news/news_widget_view_model.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:provider/provider.dart';

import '../../../constant/strings.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

NewsWidgetViewModel viewModel = NewsWidgetViewModel();

class _NewsWidgetState extends State<NewsWidget> {
  @override
  void initState() {
    super.initState();
    viewModel = NewsWidgetViewModel();
    viewModel.getNews(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsWidgetViewModel>(
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
                      viewModel.getNews(widget.source.id ?? '');
                    },
                    child: Text(Strings.instance.tryAgain),
                  ),
                ],
              );
            } else if (viewModel.newsList == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,
                ),
              );
            } else {
              return Flexible(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDatails(
                                          title:
                                              viewModel.newsList![index].title,
                                          description: viewModel
                                              .newsList![index].description,
                                          author:
                                              viewModel.newsList![index].author,
                                          publishedAt: viewModel
                                              .newsList![index].publishedAt,
                                          urlToImage: viewModel
                                              .newsList![index].urlToImage,
                                          url: viewModel.newsList![index].url,
                                        )));
                          },
                          child: NewsItem(news: viewModel.newsList![index]));
                    },
                    itemCount: viewModel.newsList!.length),
              );
            }
          },
        ));
  }
}
