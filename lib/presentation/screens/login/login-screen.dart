import 'package:authdemo/presentation/bloc/location/LocationBloc.dart';
import 'package:authdemo/presentation/bloc/user/UserBloc.dart';
import 'package:authdemo/presentation/bloc/user/UserEvent.dart';
import 'package:authdemo/presentation/bloc/user/UserState.dart';
import 'package:authdemo/presentation/bloc/weather/WeatherBloc.dart';
import 'package:authdemo/presentation/contants/app-colors.dart';
import 'package:authdemo/presentation/contants/app-dimens.dart';
import 'package:authdemo/presentation/main-navigation-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserIsAuthenticated) {
                _navigateToNavigationScreen(context);
              }
            },
            builder: (blocContext, state) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  _buildLoginPageHeader(),
                  SizedBox(
                    height: AppDimens.SPACING_MED,
                  ),
                  Text("- Hello world -",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: AppDimens.TEXT_BODY_SMALL)),
                  SizedBox(height: AppDimens.SPACING_EXTRA_LARGE),
                  RaisedButton(
                      onPressed: () => BlocProvider.of<UserBloc>(context).add(UserLoginEvent()),
                      color: AppColors.PRIMARY_COLOR,
                      child: Text("Continue with login",
                          style: TextStyle(color: AppColors.PRIMARY_OFFSET)))
                ],
              );
            },
          ),
        ));
  }

  Widget _buildLoginPageHeader() => Container(
        margin: EdgeInsets.only(top: 30),
        child: Center(
            child: Text(
          "Auth Demo",
          style: TextStyle(fontSize: 30),
        )),
      );

  void _navigateToNavigationScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      // Re-provide bloc to pushed stack
      return MultiBlocProvider(providers: [
        BlocProvider.value(value: context.bloc<LocationBloc>()),
        BlocProvider.value(value: context.bloc<WeatherBloc>()),
        BlocProvider.value(value: context.bloc<UserBloc>())
      ], child: MainNavigationScreen());
    }));
  }
}
