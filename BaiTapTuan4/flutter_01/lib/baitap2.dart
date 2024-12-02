import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Danh sách các bài viết/tin tức



  final List<Map<String, String>> newsList = [
    {
      'image': 'https://picsum.photos/250/150',
      'title': 'Tiêu đề bài viết 1',
      'description': 'Mô tả ngắn gọn về bài viết 1.',
    },
    {
      'image': 'https://picsum.photos/150',
      'title': 'Tiêu đề bài viết 2',
      'description': 'Mô tả ngắn gọn về bài viết 2.',
    },
    {
      'image': 'https://picsum.photos/150',
      'title': 'Tiêu đề bài viết 3',
      'description': 'Mô tả ngắn gọn về bài viết 3.',
    },
    // Bạn có thể thêm nhiều bài viết hơn tại đây.
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ',
        ),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4.0,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Image.network(
                newsList[index]['image']!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(
                newsList[index]['title']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                newsList[index]['description']!,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              onTap: () {
                // Mở chi tiết bài viết (Tùy chỉnh theo yêu cầu)
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Mở chi tiết bài viết')));
              },
            ),
          );
        },
      ),
    );
  }
}

