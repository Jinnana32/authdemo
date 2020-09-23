import 'package:authdemo/presentation/bloc/user/UserBloc.dart';
import 'package:authdemo/presentation/bloc/user/UserEvent.dart';
import 'package:authdemo/presentation/bloc/user/UserState.dart';
import 'package:authdemo/presentation/main-navigation-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  UserBloc _userBlock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if(state is UserIsAuthenticated){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainNavigationScreen()));
            }
          },
          builder: (BuildContext context, state) {
             _userBlock = BlocProvider.of<UserBloc>(context);
            return Container(
              child: Column(children: <Widget>[
            FlatButton(
                onPressed: () => _userBlock.add(UserLoginEvent()),
                child: Text("Go to weather")),
          ]));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userBlock.close();
    super.dispose();
  }
}
