import 'package:chat_app/view/deteil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controlller/controller.dart';

class NewsPage extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('News Feed'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Obx(
          () => controller.isLoading.value
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: controller.newsArticles.length,
                  itemBuilder: (context, index) {
                    final article = controller.newsArticles[index];
                    return InkWell(
                      onTap: () {
                        Get.to(dteilpage(
                            title: controller.newsArticles[index].title!,
                            description:
                                controller.newsArticles[index].description!,
                            publishedAt: controller
                                .newsArticles[index].publishedAt
                                .toString(),
                            author: controller.newsArticles[index].author ?? "",
                            imageUrl:
                                controller.newsArticles[index].urlToImage ?? "",
                            content: controller.newsArticles[index].content!));
                      },
                      child: ListTile(
                        title: Text(article.title!),
                        subtitle: Text(article.description!),
                        leading: article.urlToImage != null &&
                                article.urlToImage!.isNotEmpty
                            ? Image.network(article.urlToImage!)
                            : SizedBox.shrink(),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
