import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'models/post.dart';

class PostDetailScreen extends StatefulWidget {
  final int postId;

  const PostDetailScreen({super.key, required this.postId});

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = ApiService().fetchPost(widget.postId); // Lấy bài viết theo ID
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết bài viết'),
      ),
      body: FutureBuilder<Post>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Post post = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title!,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.body!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  // Có thể thêm hình ảnh nếu cần
                  // post.base64Image != null
                  //     ? Image.memory(base64Decode(post.base64Image!))
                  //     : Container(),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Không có dữ liệu'));
          }
        },
      ),
    );
  }
}
