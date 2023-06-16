import 'package:news/bloc/app_events.dart';
import 'package:news/bloc/app_states.dart';
import 'package:news/models/news_model.dart';
import 'package:news/repositorie/news_repositorie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final NewsRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.fetchNews();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
