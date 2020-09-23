import 'package:authdemo/presentation/bloc/location/LocationBloc.dart';
import 'package:authdemo/presentation/bloc/location/LocationEvent.dart';
import 'package:authdemo/presentation/bloc/location/LocationState.dart';
import 'package:authdemo/presentation/bloc/weather/WeatherBloc.dart';
import 'package:authdemo/presentation/bloc/weather/WeatherEvent.dart';
import 'package:authdemo/presentation/bloc/weather/WeatherState.dart';
import 'package:authdemo/presentation/contants/app-colors.dart';
import 'package:authdemo/presentation/contants/app-dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    BlocProvider.of<WeatherBloc>(context).add(WeatherIsFetchingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: BlocConsumer<WeatherBloc, WeatherState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        if (state is WeatherStillFetching) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WeatherFetchingError) {
          return Center(
            child: Text("Can't fetch weather data"),
          );
        }
        if (state is WeatherFetchingSuccess) {
          return Padding(
            padding: const EdgeInsets.all(AppDimens.SPACING_MED),
            child: Container(
                child: Column(
                  children: [
                    Text("Weather forecast", style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppDimens.TEXT_TITLE)),
                    SizedBox(height: AppDimens.SPACING_MED),
                    Row(

              children: [
                Expanded(
                                child: Container(
                    color: AppColors.PRIMARY_COLOR,
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.SPACING_SMALL),
                      child: Text("Date", style: TextStyle(color: AppColors.PRIMARY_OFFSET)),
                    )),
                ),
                  Expanded(
                                    child: Container(
                    color: AppColors.PRIMARY_COLOR,
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.SPACING_SMALL),
                      child: Text("Temperature (F)", style: TextStyle(color: AppColors.PRIMARY_OFFSET)),
                    )),
                  )
              ],
            ),
             Row(
              children: [
                Expanded(
                                child: Container(
                    color: AppColors.SECONDARY_COLOR,
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.SPACING_SMALL),
                      child: Text(Jiffy(state.getWeather.date).format("MM/dd/yyyy"), style: TextStyle(color: AppColors.SECONDARY_OFFSET)),
                    )),
                ),
                  Expanded(
                                    child: Container(
                    color: AppColors.SECONDARY_COLOR,
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.SPACING_SMALL),
                      child: Text(state.getWeather.temp.toString(), style: TextStyle(color: AppColors.SECONDARY_OFFSET)),
                    )),
                  )
              ],
            )
                  ],
                )),
          );
        }
        return Container();
      },
    )));
  }
}
