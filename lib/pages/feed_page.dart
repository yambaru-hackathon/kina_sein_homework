import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  final userData = [
    [
      '1023',
      'Hiyoko',
      'https://hiyocco-design.com/wp-content/uploads/2023/02/hiyoko1.jpeg',
      'https://www.photock.jp/photo/small/photo0000-6298.jpg',
      '海見てきた'
    ],
    [
      '514',
      'RenRen',
      'https://www.ryutsuu.biz/images/2019/06/20190618calbee.jpg',
      'https://free-materials.com/adm/wp-content/uploads/2017/05/adpDSC_2997.jpg',
      'カ〇ビーのポテトチップス',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('フィード')),
      body: SingleChildScrollView(
        child: Column(
          children: userData.map((userData) {
            return Post(
              likes: userData[0],
              userName: userData[1],
              userImage: userData[2],
              postImage: userData[3],
              userComment: userData[4],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.likes,
    required this.userName,
    required this.userImage,
    required this.postImage,
    required this.userComment
  });

  final String likes;
  final String userName;
  final String userImage;
  final String postImage;
  final String userComment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                Image.network(
                  userImage,
                  width: 45,
                  height: 45,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            postImage,
            height: 300,
            fit: BoxFit.cover,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 36,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mode_comment_outlined,
                      size: 36,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      size: 36,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 36,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$likes likes',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$userName $userComment',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        userImage,
                        width: 36,
                        height: 36,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Add a comment...',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}