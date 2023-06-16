import 'package:news/models/news_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

@immutable
abstract class UserState extends Equatable {}

//data loading state
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<ArticleModel> sensors;
  UserLoadedState(this.sensors);
  @override
  List<Object?> get props => [sensors];
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
