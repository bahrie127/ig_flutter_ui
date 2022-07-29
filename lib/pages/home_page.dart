import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ig_flutter_ui/models/post_model.dart';
import 'package:ig_flutter_ui/widgets/bubble_story.dart';
import 'package:ig_flutter_ui/widgets/user_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List users = [
    'Erika',
    'Hasan',
    'Suryono',
    'Ngatman',
    'Budi',
    'Rojanah',
    'Bahri',
    'Erwin'
  ];

  List<Hit> contentList = [];

  final String contentListUrl =
      'https://pixabay.com/api/?key=28901809-0958cfb5c962cfc68206428e0&q=purple+flowers&image_type=photo';

  Future<List<Hit>> getContentList() async {
    final response = await Dio().get(contentListUrl);
    final dataModel = PostModel.fromJson(response.data as Map<String, dynamic>);
    return dataModel.hits;
  }

  bool isLoading = false;

  List<Hit> listUser = [];

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getContentList().then((result) {
      contentList = result;
      listUser = result;
      // for (var r in result) {
      //   if (listUser.any((element) => element.user != r.user)) {
      //     listUser.add(r);
      //   }
      // }
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(
            Icons.add_box_outlined,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.favorite_border,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.send_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BubbleStory(
                  person: listUser[index],
                  isMe: index == 0 ? true : false,
                  isLive: index == 1 ? true : false,
                );
              },
              itemCount: listUser.length,
            ),
          ),
          const Divider(
            height: 1,
          ),
          Expanded(
            child: isLoading
                ? const CircularProgressIndicator.adaptive()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return UserPost(content: contentList[index]);
                    },
                    itemCount: contentList.length,
                  ),
          ),
        ],
      ),
    );
  }
}
