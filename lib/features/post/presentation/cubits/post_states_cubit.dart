import 'package:social_media/features/post/domain/entities/post_model.dart';

abstract class PostStates {}

class PostInitial extends PostStates {}

class PostLoading extends PostStates {}

class PostLoaded extends PostStates {
  final List<PostModel> posts;
  PostLoaded(this.posts);
}

class PostError extends PostStates {
  final String message;
  PostError(this.message);
}
