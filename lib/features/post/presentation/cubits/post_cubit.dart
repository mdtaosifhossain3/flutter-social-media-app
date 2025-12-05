import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/post/domain/entities/post_model.dart';
import 'package:social_media/features/post/domain/repository/post_repository.dart';
import 'package:social_media/features/post/presentation/cubits/post_states_cubit.dart';

class PostCubit extends Cubit<PostStates> {
  final PostRepository postRepository;

  PostCubit({required this.postRepository}) : super(PostInitial());

  //Create new post
  Future<void> createPostCubit(PostModel post) async {
    try {
      emit(PostLoading());
      final newPost = post.copyWith(text: post.text);
      postRepository.createPost(newPost);
      fetchAllPost();
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  //Fetch all posts
  Future<void> fetchAllPost() async {
    try {
      emit(PostLoading());
      final posts = await postRepository.fetchAllPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  //Delete post
  Future<void> deletePost(String postId) async {
    try {
      emit(PostLoading());
      await postRepository.dletePost(postId);
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
