import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/constant/colors.dart';
import 'package:news/model/NewsDataModel.dart';
import 'package:news/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  final f = DateFormat.jm();
  News? news;
  Articles? articles;

  NewsItem({super.key, this.news, this.articles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                imageUrl: news?.urlToImage ?? ' ',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            backgroundColor: AppColors.primaryLightColor,
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              news?.author ?? '',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.greyColor,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(news?.title ?? '',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 8,
            ),

            //  Text(f.format(new DateTime.fromMillisecondsSinceEpoch((news.publishedAt!*1000) as int))),
            Text(
              f.format(DateTime.parse(news?.publishedAt.toString() ?? '')),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    // Assuming titleSmall is not available
                    color: AppColors.greyColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
