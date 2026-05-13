import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/views/search_view.dart';
import 'package:sky_cast/widgets/no_weather_search.dart';
import 'package:sky_cast/widgets/weather_card.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';
import '../helper/text_color_helper.dart';
import '../helper/theme_helper.dart';
import 'error_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    var city = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: getAdaptiveContentColor(getThemeColor(city?.status)),
        ),
        backgroundColor: getThemeColor(city?.status),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search, size: 35),
            ),
          ),
        ],
        title: Text(
          "Sky Cast",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,

            color: getAdaptiveContentColor(getThemeColor(city?.status)),
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),

      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is InitialState) {
            return NoWeatherSearch();
          } else if (state is SuccessfulWeatherState) {
            return WeatherCard();
          } else {
            return ErrorView();
          }
        },
      ),
    );
  }
}
