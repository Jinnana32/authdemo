
import 'package:authdemo/domain/model/coordinates.dart';
import 'package:authdemo/presentation/bloc/location/LocationEvent.dart';
import 'package:authdemo/presentation/bloc/location/LocationState.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  LocationBloc() : super(LocationInitialState());

  @override
  LocationState get initialState => LocationInitialState();

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
      if(event is GetGeoLocationEvent){
        yield* _mapGetGeolocation(event);
      }
      if(event is OnToggleLocationEvent){
        yield* _mapOnToggleLocationEvent(event);
      }
  }

  Stream<LocationState> _mapGetGeolocation(GetGeoLocationEvent event) async* {
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if(position != null){
      Coordinates coordinates = Coordinates(latitude: position.latitude, longitude: position.longitude);
      yield LocationOnGeolocationFetched(coordinates);
    }
  }

  Stream<LocationState> _mapOnToggleLocationEvent(OnToggleLocationEvent event) async* {
    yield LocationIsShowState(!event.isLocationShown);
  }

}