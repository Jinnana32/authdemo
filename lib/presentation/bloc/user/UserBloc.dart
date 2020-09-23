
import 'package:authdemo/data/services/auth/auth-service.dart';
import 'package:authdemo/domain/model/user.dart';
import 'package:authdemo/presentation/bloc/user/UserEvent.dart';
import 'package:authdemo/presentation/bloc/user/UserState.dart';
import 'package:authdemo/utils/logger.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(UserInitialState());

  @override
  UserState get initialState => UserInitialState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {

    if(event is UserLoginEvent){
      yield UserIsAuthenticating();

      try {
        User user = await AuthService().getAuthorization();
        if(user != null) {
          yield UserIsAuthenticated(user);
        }

      } catch (e){
        Logger.onError("UserBloc", e.toString());
      }

    }

  }

}