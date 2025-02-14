import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/pages/web_view.dart';

import '../../../constant/assets.dart';
import '../../../constant/colors.dart';
import '../../../constant/strings.dart';

class NewsDatails extends StatelessWidget {
  static const String routeName = 'NewsDetails';
  final f = DateFormat.jm();
  String? urlToImage;
  String? author;
  String? title;
  String? publishedAt;
  String? description;
  String? url;

  NewsDatails(
      {required this.title,
      required this.author,
      required this.publishedAt,
      required this.description,
      required this.url,
      required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: AppColors.whiteColor,
        child: Image.asset(
          Assets.backgroundImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              Strings.instance.newsApp,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: urlToImage ?? ' ',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  backgroundColor: AppColors.primaryLightColor,
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  // Container(
                  //   clipBehavior: Clip.antiAlias,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20)
                  //   ),
                  //   child: Image.network(news.urlToImage ?? ''),
                  // )
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    author ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.greyColor,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(title ?? '',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 8,
                  ),

                  //  Text(f.format(new DateTime.fromMillisecondsSinceEpoch((news.publishedAt!*1000) as int))),
                  Text(
                    f.format(DateTime.parse(publishedAt.toString())),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          // Assuming titleSmall is not available
                          color: AppColors.greyColor,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    description ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.greyColor,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        Strings.instance.viewFullArticle,
                        textAlign: TextAlign.end,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return WebView(news: url ?? '');
                            }));
                          },
                          icon: const Icon(
                            Icons.play_arrow_sharp,
                            color: Colors.black,
                          ))
                    ],
                  )
                ],
              ),
            ),
          )),
    ]);
  }
}
