import 'package:authdemo/domain/model/user.dart';
import 'package:authdemo/presentation/bloc/user/UserBloc.dart';
import 'package:authdemo/presentation/bloc/user/UserState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, state) {
           final stateAsUserAuthenticated = state as UserIsAuthenticated;
           User user = stateAsUserAuthenticated.getUser;
           return Container(child:
            Column(
              children: <Widget>[
                Text("Welcome ${user.name}"),
                Text("Github account ${user.githubUrl}")
              ]
            )

          );
        },
      ),
    ));
  }
}
