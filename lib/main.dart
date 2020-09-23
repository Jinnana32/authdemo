import 'package:authdemo/data/services/auth/auth-service.dart';
import 'package:authdemo/data/services/storage/storage-service.dart';
import 'package:authdemo/presentation/bloc/location/LocationBloc.dart';
import 'package:authdemo/presentation/bloc/user/UserBloc.dart';
import 'package:authdemo/presentation/bloc/weather/WeatherBloc.dart';
import 'package:authdemo/presentation/screens/login/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  StorageService storageService = StorageService();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(
          create: (context) => UserBloc(
            authService: AuthService(
              storageService: storageService
            ),
            storageService: storageService
          ),
      ),
      BlocProvider<LocationBloc>(
          create: (context) => LocationBloc(),
      ),
      BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
      )
    ],
  child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}