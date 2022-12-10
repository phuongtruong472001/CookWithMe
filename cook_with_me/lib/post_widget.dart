import 'package:cook_with_me/fonts_and_colors.dart';
import 'package:cook_with_me/model/call_api.dart';
import 'package:cook_with_me/model/post.dart';
import 'package:cook_with_me/pages/link_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostWidget extends StatefulWidget {
  Post post;
  PostWidget({required this.post, super.key});
  @override
  PostWidgetState createState() => PostWidgetState();
}

class PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    Post post = widget.post;
    return GestureDetector(
      onTap: () => Get.toNamed(
        "/detail_item",
        arguments: {"post": post},
      ),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(2, 4),
                  blurRadius: 10,
                  color: Color.fromRGBO(0, 0, 0, 0.2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 93,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image:
                        NetworkImage(post.imageCover ?? LinkImage.imageDefault),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () async {
                      bool isAddToFavorite =
                          await CallApi.addToFavorite(post);
                      if(isAddToFavorite){
                        setState(() {
                        post.isFavorite = !post.isFavorite;
                      });
                      }
                    },
                    child: post.isFavorite == true
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border_outlined),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  post.title ?? "",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: FontsAndColors.semibold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  post.author!.email ?? "@Alimeno",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: FontsAndColors.regular,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Expanded(
//                     flex: 1,
//                     child: Obx(
//                       () => GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             post.isFavorite = !post.isFavorite;
//                           });
//                         },
//                         child: post.isFavorite == true
//                             ? const Icon(
//                                 Icons.favorite,
//                                 color: Colors.red,
//                               )
//                             : const Icon(Icons.favorite_border_outlined),
//                       ),
//                     ),
//                   ),