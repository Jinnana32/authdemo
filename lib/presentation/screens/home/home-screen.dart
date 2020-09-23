import 'package:authdemo/domain/model/user.dart';
import 'package:authdemo/presentation/bloc/user/UserBloc.dart';
import 'package:authdemo/presentation/bloc/user/UserEvent.dart';
import 'package:authdemo/presentation/bloc/user/UserState.dart';
import 'package:authdemo/presentation/contants/app-colors.dart';
import 'package:authdemo/presentation/contants/app-dimens.dart';
import 'package:authdemo/presentation/widgets/home/coordinates-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCoordinatesShown = false;

  @override
  void initState() {
    super.initState();
  }

  void _toggleCoordinates() {
    setState((){
      this.isCoordinatesShown = !this.isCoordinatesShown;
    });
  }

  void _logout(){
    BlocProvider.of<UserBloc>(context).add(UserLogoutEvent());
  }

  void _redirectUserToLogin(BuildContext context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocConsumer<UserBloc, UserState>(
        listener: (BuildContext context, state) {
          if(state is UserLoggedOut){
            _redirectUserToLogin(context);
          }
        },
        builder: (BuildContext context, state) {
          if (state is UserIsAuthenticated) {
            final stateAsUserAuthenticated = state;
            User user = stateAsUserAuthenticated.getUser;
            return Padding(
              padding: const EdgeInsets.all(AppDimens.SPACING_LARGE),
              child: Container(
                 width: double.infinity,
                  child: Column(
                    children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppDimens.SPACING_LARGE),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => _logout(),
                          child: Icon(Icons.logout)
                        )
                      ],
                    ),
                  ),
                Text(
                  "${user.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimens.TEXT_TITLE
                  )),
                  SizedBox(height: 10),
                Container(
                  child: Text(
                    user.githubUrl,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
                SizedBox(height: 10),
                RaisedButton(
                    onPressed: () => _toggleCoordinates(),
                    color: AppColors.PRIMARY_COLOR,
                    child: Text("Toggle coordinates box", style: TextStyle(color: AppColors.PRIMARY_OFFSET))),
                if (isCoordinatesShown) CoordinatesWidget()
              ])),
            );
          }

          return Center(
            child: Text("User not authenticated"),
          );
        },
      )),
    );
  }
}

class LocatioNState {}
