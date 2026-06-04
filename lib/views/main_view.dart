import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/widgets/main_body.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';
import '../helper/text_color_helper.dart';
import '../helper/theme_helper.dart';
import '../widgets/custom_search_delegate.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, GetWeatherState>(
      builder: (context, state) {
        var city = BlocProvider
            .of<GetWeatherCubit>(context)
            .weatherModel;
        final weatherStatus = city?.current.condition.text;

        final themeColor = city == null
            ? const Color(0xFFF4F6F9)
            : getThemeColor(weatherStatus)[500]!;
        final appBarColor = city == null
            ? const Color(0xFFF4F6F9)
            : getThemeColor(weatherStatus)[600]!;
        final contentColor = city == null
            ? const Color(0xFF334155)
            : getAdaptiveContentColor(getThemeColor(weatherStatus));

        return Scaffold(
          backgroundColor: themeColor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: contentColor),
            backgroundColor: appBarColor,
            elevation: 2,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(context),
                    );
                  },
                  icon: Icon(
                    Icons.search_rounded,
                    size: 32,
                    color: contentColor,
                  ),
                ),
              ),
            ],
            title: Text(
              "Sky Cast",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: contentColor,
              ),
            ),
            centerTitle: true,
          ),
          body: MainBody(state: state,),
        );
      },
    );
  }
}