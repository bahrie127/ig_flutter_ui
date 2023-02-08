import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ig_flutter_ui/models/content_model.dart';
import 'package:ig_flutter_ui/widgets/bubble_story.dart';
import 'package:ig_flutter_ui/widgets/user_post.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    'Erwin',
    'Rocky'
  ];

  final String dataUrl =
      'https://pixabay.com/api/?key=28901809-0958cfb5c962cfc68206428e0&q=blue+flowers&image_type=photo&pretty=true';

  Future<List<Content>> getListContent() async {
    final response = await Dio().get(dataUrl);
    final dataModel =
        ContentModel.fromJson(response.data as Map<String, dynamic>);
    return dataModel.listContent;
  }

  List<Content> listContent = [];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getListContent().then((result) {
      listContent = result;
      _isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/icons/ic_logo.svg',
          color: Colors.white,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          SvgPicture.asset(
            'assets/icons/ic_add.svg',
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              'assets/icons/ic_favorite.svg',
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/ic_send.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return BubbleStory(
                    name: users[index],
                    isMe: index == 0 ? true : false,
                    isLive: index == 1 ? true : false,
                  );
                },
                itemCount: users.length,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (contex, index) {
              return UserPost(
                content: listContent[index],
              );
            },
            childCount: listContent.length,
          )),
        ],
      ),

      
      // Column(
      //   children: [
      //     SizedBox(
      //       height: 120,
      //       child: ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemBuilder: (context, index) {
      //           return BubbleStory(
      //             name: users[index],
      //             isMe: index == 0 ? true : false,
      //             isLive: index == 1 ? true : false,
      //           );
      //         },
      //         itemCount: users.length,
      //       ),
      //     ),
      //     const Divider(
      //       height: 1,
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         itemBuilder: (context, index) {
      //           return UserPost(
      //             content: listContent[index],
      //           );
      //         },
      //         itemCount: listContent.length,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
