import 'package:facebookfeed/bloC/events.dart';
import 'package:facebookfeed/bloC/states.dart';
import 'package:facebookfeed/repository/post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  PostRepository repo;
  PostBloc(
    PostStates initialState,
    this.repo,
  ) : super(initialState);

  @override
  Stream<PostStates> mapEventToState(PostEvents event) async* {
    await Future.delayed(Duration(seconds: 2));
    if (event is DoFetchEvent) {
      yield LoadingState();
      try {
        var post = await repo.fetchPosts();
        yield FetchSuccess(posts: post);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
