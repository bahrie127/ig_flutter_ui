import 'package:flutter/material.dart';
import 'package:ig_flutter_ui/models/video_content_model.dart';
import 'package:ig_flutter_ui/widgets/video_player_widget.dart';

class ReelsWidget extends StatelessWidget {
  const ReelsWidget({
    Key? key,
    required this.content,
  }) : super(key: key);

  final VideoContent content;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomLeft,
      children: [
        VideoPlayerWidget(videoUrl: content.videos.medium.url),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
                right: 4,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              height: size.height / 6,
              width: size.width - (size.width / 5),
              // decoration: BoxDecoration(
              //   border: Border.all(),
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(content.userImageUrl),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          content.user,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: const Border.fromBorderSide(
                            BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: const Center(child: Text('Follow')),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      content.tags,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.graphic_eq,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Origin Music'),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.person_outline,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '20 people',
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: size.height / 3,
              width: size.width / 7,
              // decoration: BoxDecoration(
              //   border: Border.all(),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        size: 35,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        content.likes.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.comment_outlined,
                        size: 35,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        content.comments.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.send_outlined,
                        size: 35,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.more_vert_outlined,
                        size: 25,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: const Border.fromBorderSide(
                        BorderSide(color: Colors.white),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pravatar.cc/150?img=${content.duration}'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
    // );
  }
}
