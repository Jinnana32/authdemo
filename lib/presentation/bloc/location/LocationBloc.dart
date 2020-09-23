
import 'package:authdemo/domain/model/coordinates.dart';
import 'package:authdemo/presentation/bloc/location/LocationEvent.dart';
import 'package:authdemo/presentation/bloc/location/LocationState.dart';
import 'package:authdemo/utils/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  LocationBloc() : super(LocationInitialState());

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
      if(event is GetGeoLocationEvent){
        print("This is called");
        yield* _mapGetGeolocation(event);
      }
  }

  Stream<LocationState> _mapGetGeolocation(GetGeoLocationEvent event) async* {
    try {
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      Coordinates coordinates = Coordinates(latitude: position.latitude, longitude: position.longitude);
      yield LocationOnGeolocationFetched(coordinates);
    } catch(e) {
        Logger.onError("Location Bloc", e.toString());
       yield LocationOnGeolocationError(e.toString());
    }
  }



}