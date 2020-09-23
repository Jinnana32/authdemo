import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class UserEvent extends Equatable {
  UserEvent();
}

class UserLoginEvent extends UserEvent {
  @override
  List<Object> get props => null;
}

