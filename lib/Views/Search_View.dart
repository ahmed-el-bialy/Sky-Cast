import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/Cubits/get%20Weather%20Cubit/get_Weather_Cubit.dart';

import '../helper/Text_Color_helper.dart';
import '../helper/Theme_helper.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  late String cityName;

  @override
  Widget build(BuildContext context) {
   var city = BlocProvider.of<GetWeatherCubit>(context).WeatherModel;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 30,
          color: getAdaptiveContentColor(getThemeColor(city?.status),),
        ),
        backgroundColor: getThemeColor(city?.status),
        title: Text(
          "Search City",
          style: TextStyle(
            fontSize: 28,
            color: getAdaptiveContentColor(getThemeColor(city?.status),),
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onFieldSubmitted: (value) async {
                  var getWeather = BlocProvider.of<GetWeatherCubit>(context);
                  getWeather.getWeather(value);
                  Navigator.of(context).pop();
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: getThemeColor(city?.status),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text(
                    "Search for the city ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: getThemeColor(city?.status),
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Icon(Icons.search_outlined, size: 28),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: getThemeColor(city?.status),
                      width: 2,
                    ),
                  ),
                  hint: Text(
                    "Enter city name",
                    style: TextStyle(
                      fontSize: 20,
                      color: getThemeColor(city?.status),
                    ),
                  ),
                  suffixIconColor: getThemeColor(city?.status),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
