import 'package:flutter/material.dart';

class UserPost extends StatelessWidget {
  const UserPost({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/100?u=$name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.more_vert),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 300,
          child: Image.network(
            'https://picsum.photos/600/300?random=$name',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: const [
              Icon(Icons.favorite_border),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.chat_bubble_outline_outlined),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.send_outlined),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: const [
              Text('Liked by '),
              Text(
                'rozay ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(' and '),
              Text(
                'others ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'kepala_sekolah ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                        'Ayo anak anak masuk kelas, sudah waktunya belajar..'),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            'View all comments',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            '17 hours ago',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
