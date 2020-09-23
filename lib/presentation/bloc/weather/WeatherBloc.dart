
import 'package:authdemo/data/services/weather/weather-service.dart';
import 'package:authdemo/domain/model/weather.dart';
import 'package:authdemo/presentation/bloc/weather/WeatherEvent.dart';
import 'package:authdemo/presentation/bloc/weather/WeatherState.dart';
import 'package:authdemo/utils/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherBloc() : super(WeatherInitialState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
      if(event is WeatherIsFetchingEvent){
        yield WeatherStillFetching();

        try {
           Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
           Weather weather = await WeatherService().fetchWeatherForecast(position.latitude, position.longitude);
           yield WeatherFetchingSuccess(weather);
        } catch(e){
          Logger.onError("Weather Bloc", e.toString());
          yield WeatherFetchingError(e.toString());
        }

      }
  }

}