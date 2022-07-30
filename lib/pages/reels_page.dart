import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ig_flutter_ui/models/video_content_model.dart';
import 'package:ig_flutter_ui/widgets/reels_widget.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  Future<List<VideoContent>> getVideoContents() async {
    final response = await Dio().get(
        'https://pixabay.com/api/videos/?key=28901809-0958cfb5c962cfc68206428e0&q=green+flowers&pretty=true');
    final videoModel =
        VideoContentModel.fromJson(response.data as Map<String, dynamic>);
    return videoModel.listVideoContent;
  }

  List<VideoContent> videoContents = [];

  @override
  void initState() {
    super.initState();
    getVideoContents().then((value) {
      videoContents = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reels'),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [
            Icon(Icons.camera_alt_outlined),
            SizedBox(
              width: 16,
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ReelsWidget(content: videoContents[index]);
          },
          itemCount: videoContents.length,
        ));
    // final size = MediaQuery.of(context).size;
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Reels'),
    //     centerTitle: false,
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     actions: const [
    //       Icon(Icons.camera_alt_outlined),
    //       SizedBox(
    //         width: 16,
    //       )
    //     ],
    //   ),
    //   extendBodyBehindAppBar: true,
    //   body: Stack(
    //     alignment: Alignment.bottomLeft,
    //     children: [
    //       Container(
    //         width: size.width,
    //         height: size.height,
    //         decoration: const BoxDecoration(
    //           color: Colors.black26,
    //         ),
    //         child: Image.network(
    //           'https://pixabay.com/get/g53b8ae3b876e44e8207c6669415b3e37fb917394615345010d79a6b93d3f2769b9bb42ea211a2ff10a7c421a01a18745971a9977bc52389600a20b2dbc4b852d_1280.jpg',
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       Row(
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         children: [
    //           Container(
    //             margin: const EdgeInsets.only(
    //               left: 16,
    //               bottom: 16,
    //               right: 4,
    //             ),
    //             padding: const EdgeInsets.symmetric(
    //               vertical: 10,
    //             ),
    //             height: size.height / 6,
    //             width: size.width - (size.width / 5),
    //             // decoration: BoxDecoration(
    //             //   border: Border.all(),
    //             // ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Row(
    //                   children: [
    //                     const CircleAvatar(
    //                       radius: 20,
    //                       backgroundColor: Colors.grey,
    //                     ),
    //                     const Padding(
    //                       padding: EdgeInsets.symmetric(horizontal: 10),
    //                       child: Text(
    //                         'dennyyudanto',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 14,
    //                         ),
    //                       ),
    //                     ),
    //                     Container(
    //                       height: 25,
    //                       width: 60,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(8),
    //                         border: const Border.fromBorderSide(
    //                           BorderSide(
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                       ),
    //                       child: const Center(child: Text('Follow')),
    //                     )
    //                   ],
    //                 ),
    //                 const Padding(
    //                   padding: EdgeInsets.symmetric(vertical: 8.0),
    //                   child: Text(
    //                     'Wilayahnya sih Wonosobo tapi sangat dek..',
    //                   ),
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Row(
    //                       children: const [
    //                         Icon(
    //                           Icons.graphic_eq,
    //                           size: 20,
    //                         ),
    //                         SizedBox(
    //                           width: 8,
    //                         ),
    //                         Text('Origin Music'),
    //                       ],
    //                     ),
    //                     Row(
    //                       children: const [
    //                         Icon(
    //                           Icons.person_outline,
    //                           size: 20,
    //                         ),
    //                         SizedBox(
    //                           width: 8,
    //                         ),
    //                         Text(
    //                           '20 people',
    //                         ),
    //                         SizedBox(
    //                           width: 16,
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             margin: const EdgeInsets.only(bottom: 16),
    //             height: size.height / 3,
    //             width: size.width / 7,
    //             // decoration: BoxDecoration(
    //             //   border: Border.all(),
    //             // ),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Column(
    //                   children: const [
    //                     Icon(
    //                       Icons.favorite_border,
    //                       size: 35,
    //                     ),
    //                     SizedBox(
    //                       height: 4,
    //                     ),
    //                     Text(
    //                       '6,123',
    //                       style: TextStyle(
    //                         fontSize: 12,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 Column(
    //                   children: const [
    //                     Icon(
    //                       Icons.comment_outlined,
    //                       size: 35,
    //                     ),
    //                     SizedBox(
    //                       height: 4,
    //                     ),
    //                     Text(
    //                       '3,111',
    //                       style: TextStyle(
    //                         fontSize: 12,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 Column(
    //                   children: const [
    //                     Icon(
    //                       Icons.send_outlined,
    //                       size: 35,
    //                     ),
    //                   ],
    //                 ),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 Column(
    //                   children: const [
    //                     Icon(
    //                       Icons.more_vert_outlined,
    //                       size: 25,
    //                     ),
    //                   ],
    //                 ),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.all(4),
    //                   height: 40,
    //                   width: 40,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     border: const Border.fromBorderSide(
    //                       BorderSide(color: Colors.white),
    //                     ),
    //                     image: const DecorationImage(
    //                       image:
    //                           NetworkImage('https://i.pravatar.cc/150?img=29'),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
