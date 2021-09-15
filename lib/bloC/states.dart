import 'package:equatable/equatable.dart';
import 'package:facebookfeed/models/Post.dart';

class PostStates extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitialState extends PostStates {}

class LoadingState extends PostStates {}

class FetchSuccess extends PostStates {
  List<Post> posts;
  FetchSuccess({required this.posts});
}

class ErrorState extends PostStates {
  late String message;
  ErrorState({required this.message});
}
