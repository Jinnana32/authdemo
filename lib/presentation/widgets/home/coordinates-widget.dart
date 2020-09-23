import 'package:authdemo/domain/model/coordinates.dart';
import 'package:authdemo/presentation/bloc/location/LocationBloc.dart';
import 'package:authdemo/presentation/bloc/location/LocationEvent.dart';
import 'package:authdemo/presentation/bloc/location/LocationState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoordinatesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder(
      builder: (BuildContext context, state) {

        final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.add(OnToggleLocationEvent(false));

        bool isLocationShow = (state as LocationIsShowState).getIsLocationShown;
        Coordinates coordinates = (state as LocationOnGeolocationFetched).getCoordinates;

        return Container(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () => locationBloc.add(OnToggleLocationEvent(isLocationShow)),
                child: Text("Toggle coordinates"),
              ),
              isLocationShow ? Text("Lat ${coordinates.latitude} Long ${coordinates.longitude}") : null
            ],
          )
        );
      },
    );
  }

}