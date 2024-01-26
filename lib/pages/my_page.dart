import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final images = [
    'https://www.edigitalagency.com.au/wp-content/uploads/new-Instagram-logo-png-full-colour-glyph.png',
    'https://gori.me/wp-content/uploads/2019/02/Pakutaso-Aburaage-Free-Stock-Photos-17.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7RA4wFrpyWNHtqQM0Z8uNTOVpOp8TDw5l0ElyXt7ZQX7MVn2d6kIhD5Ja37LaLUOvWgo&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc1Q0HCZQtm3fYE7wB1TwsXokZNEHssq3L0g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIAtfeBO9oBtLDgSVyo80wYbsdtA4eZ4NQzw&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        'https://www.edigitalagency.com.au/wp-content/uploads/new-Instagram-logo-png-full-colour-glyph.png',
                        width: 60,
                        height: 60,
                      ),
                      const Spacer(),
                      const Column(
                        children: [
                          Text(
                            '7,041',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )
                          ),
                          Text('投稿'),
                        ],
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        children: [
                          Text(
                            '4.6億',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )
                          ),
                          Text('フォロワー'),
                        ],
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        children: [
                          Text(
                            '99',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )
                          ),
                          Text('フォロー'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Instagram',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                  const Text(
                    '#YoursToMake',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  const Text(
                    'help.instagram.com',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: const Text(
                                  'フォロー中',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: const Text(
                                  'メッセージ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              crossAxisCount: 3,
              children: images.map((imageUrl) {
                return InstagramPostItem(imageUrl: imageUrl);
              }).toList(),
            ),
          ],
        ),
      ),
    );

  }
}

class InstagramPostItem extends StatelessWidget {
  const InstagramPostItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
