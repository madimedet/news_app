import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

@immutable
abstract class AboutEvent extends Equatable {
  const AboutEvent();
}

class LoadAboutEvent extends AboutEvent {
  @override
  List<Object?> get props => [];
}
