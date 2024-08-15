import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 54,
          color: Colors.white,
          child: Center(
              child: ListTile(
            leading: ClipOval(
                child: SizedBox(
              width: 35,
              height: 35,
              child: Image.asset('images/user.png'),
            )),
            title: Text(
              'username',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            subtitle: Text(
              'location',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
            trailing: Icon(Icons.more_horiz),
          )),
        ),
        Container(
          width: 375,
          height: 375,
          child: Image.asset(
            'images/post.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 375,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Icon(
                    Icons.favorite_border_outlined,
                    size: 25,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Image.asset(
                    'images/comment.webp',
                    height: 30,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Image.asset(
                    'images/send.jpg',
                    height: 30,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.asset(
                      'images/save.png',
                      height: 30,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 19,
                  top: 13.5,
                  bottom: 5,
                ),
                child: Text(
                  "0",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              const Row(
                children: [
                  Text(
                    "username" + "",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "caption",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 20, right: 8),
                    child: Text(
                      "dateformat",
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
