import 'package:authdemo/domain/model/coordinates.dart';
import 'package:authdemo/presentation/bloc/location/LocationBloc.dart';
import 'package:authdemo/presentation/bloc/location/LocationEvent.dart';
import 'package:authdemo/presentation/bloc/location/LocationState.dart';
import 'package:authdemo/presentation/contants/app-dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoordinatesWidget extends StatefulWidget {
  @override
  _CoordinatesWidgetState createState() => _CoordinatesWidgetState();
}

class _CoordinatesWidgetState extends State<CoordinatesWidget> {

  @override
  Widget build(BuildContext context) {
    // init location coordinates
    BlocProvider.of<LocationBloc>(context).add(GetGeoLocationEvent());

    return BlocConsumer<LocationBloc, LocationState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        if (state is LocationOnGeolocationFetched) {
          return Padding(
            padding: const EdgeInsets.only(top: AppDimens.SPACING_MED),
            child: Container(
                child: Column(
              children: [
                Text("Latitude", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: AppDimens.SPACING_SMALL),
                Text("${state.getCoordinates.latitude}"),
                SizedBox(height: AppDimens.SPACING_SMALL),
                Text("Longitude", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: AppDimens.SPACING_SMALL),
                Text("${state.getCoordinates.longitude}"),
              ],
            )),
          );
        }
        return Center(
            child: CircularProgressIndicator(),
        );
      },
    );
  }
}
