import 'package:flutter/material.dart';

import 'package:ig_flutter_ui/models/post_model.dart';

class BubbleStory extends StatelessWidget {
  const BubbleStory({
    Key? key,
    required this.isMe,
    required this.isLive,
    required this.person,
  }) : super(key: key);

  // final String name;
  final bool isMe;
  final bool isLive;
  final Hit person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: isLive ? Alignment.bottomCenter : Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 41,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 39,
                  backgroundColor: isMe ? Colors.white : Colors.pink,
                  child: CircleAvatar(
                    radius: 37,
                    backgroundImage: NetworkImage(person.userImageUrl),
                  ),
                ),
              ),
              if (isMe)
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                ),
              if (isLive)
                Container(
                  height: 16,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: const Border.fromBorderSide(
                      BorderSide(color: Colors.white),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'LIVE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(person.user),
          ),
        ],
      ),
    );
  }
}
