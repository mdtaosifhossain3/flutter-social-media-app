import 'package:social_media/features/post/domain/entities/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> fetchAllPosts();
  Future<void> createPost(PostModel post);
  Future<void> dletePost(String postId);
  Future<List<PostModel>> fetchPostByUserId(String userId);
}
