
import '../../Models/City_Weather_Model.dart';

class WeatherState{

}


class initialState extends WeatherState{

}


class SuccessfulWeatherState extends WeatherState{


}


class FailedWeatherState extends WeatherState{
  FailedWeatherState(String ErrorMassage);


}