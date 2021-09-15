import 'package:bloc/bloc.dart';
import 'package:facebookfeed/bloC/states.dart';

class FetchCubit extends Cubit<FetchStates> {
  FetchCubit() : super(FetchInitialState());
}
