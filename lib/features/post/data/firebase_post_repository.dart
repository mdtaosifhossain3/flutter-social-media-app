import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/features/post/domain/entities/post_model.dart';
import 'package:social_media/features/post/domain/repository/post_repository.dart';

class FirebasePostRepository implements PostRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Post Collection
  final CollectionReference postCollection = FirebaseFirestore.instance
      .collection("posts");
  @override
  Future<void> createPost(PostModel post) async {
    try {
      await postCollection.doc(post.id).set(post.toJson());
    } catch (e) {
      throw Exception("Error creating post:$e");
    }
  }

  @override
  Future<void> dletePost(String postId) async {
    try {
      await postCollection.doc(postId).delete();
    } catch (e) {
      throw Exception("Error deleting post:$e");
    }
  }

  @override
  Future<List<PostModel>> fetchAllPosts() async {
    try {
      final postSnapshot = await postCollection
          .orderBy("timeStamp", descending: true)
          .get();

      final List<PostModel> allPost = postSnapshot.docs
          .map((elm) => PostModel.fromJson(elm.data() as Map<String, dynamic>))
          .toList();

      return allPost;
    } catch (e) {
      throw Exception("Error Fetching post:$e");
    }
  }

  @override
  Future<List<PostModel>> fetchPostByUserId(String userId) async {
    try {
      final postSnapshot = await postCollection
          .where("userId", isEqualTo: userId)
          .get();

      final List<PostModel> allPost = postSnapshot.docs
          .map((elm) => PostModel.fromJson(elm.data() as Map<String, dynamic>))
          .toList();

      return allPost;
    } catch (e) {
      throw Exception("Error Fetching post by userid:$e");
    }
  }
}
