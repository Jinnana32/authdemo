
import 'package:authdemo/data/services/auth/auth-service.dart';
import 'package:authdemo/data/services/storage/storage-service.dart';
import 'package:authdemo/domain/model/user.dart';
import 'package:authdemo/presentation/bloc/user/UserEvent.dart';
import 'package:authdemo/presentation/bloc/user/UserState.dart';
import 'package:authdemo/utils/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  final AuthService authService;
  final StorageService storageService;

  UserBloc({ @required this.authService, @required this.storageService}) : super(UserInitialState());

  @override
  UserState get initialState => UserInitialState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {

    if(event is UserLoginEvent){
      yield UserIsAuthenticating();

      try {
        User user = await authService.getAuthorization();
        if(user != null) {
          yield UserIsAuthenticated(user);
        }

      } catch (e){
        Logger.onError("UserBloc", e.toString());
      }

    }

    if(event is UserLogoutEvent){
      var removeRefreshToken = await storageService.removeRefreshToken();
      if(removeRefreshToken){
        yield UserLoggedOut();
      }
    }

  }

}