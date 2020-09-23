
import 'package:authdemo/domain/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserIsAuthenticating extends UserState {}

class UserInitialState extends UserState {}

class UserLoggedOut extends UserState {}

class UserAuthenticationFailed extends UserState{
  final String errorMessage;

  UserAuthenticationFailed(this.errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}

class UserIsAuthenticated extends UserState {
  final User _user;

  UserIsAuthenticated(this._user);

  User get getUser => _user;

  @override
  List<Object> get props => [_user];
}