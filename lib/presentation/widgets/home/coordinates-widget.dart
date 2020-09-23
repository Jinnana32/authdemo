import 'package:authdemo/domain/model/coordinates.dart';
import 'package:authdemo/presentation/bloc/location/LocationBloc.dart';
import 'package:authdemo/presentation/bloc/location/LocationEvent.dart';
import 'package:authdemo/presentation/bloc/location/LocationState.dart';
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
          return Container(
              child: Column(
            children: [
              Text("Latitude"),
              SizedBox(height: 10),
              Text("${state.getCoordinates.latitude}"),
              SizedBox(height: 10),
              Text("${state.getCoordinates.longitude}"),
              SizedBox(height: 10),
              Text("122.1321311"),
            ],
          ));
        }
        return Container(
          child: Text("Can't get coordinates"),
        );
      },
    );
  }
}
