import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/Cubits/get%20Weather%20Cubit/get_Weather_Cubit.dart';
import 'package:sky_cast/Cubits/get%20Weather%20Cubit/get_Weather_States.dart';
import 'package:sky_cast/Views/Search_View.dart';
import 'package:sky_cast/Widgets/No_Weather_Search_Widget.dart';
import 'package:sky_cast/Widgets/Weather_Card_Widget.dart';
import '../Widgets/Color Helper.dart';
import '../main.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    var city = BlocProvider.of<GetWeatherCubit>(context).WeatherModel;
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
          if (state is initialState) {
            return NoWeatherSearchWidget();
          } else if (state is SuccessfulWeatherState) {
            return WeatherCardWidget();
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_off_outlined,
                    size: 100,
                    color: Colors.blueGrey,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 15,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "There was an Error, please check",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                            TextSpan(
                              text: " City name",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: " or ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                            TextSpan(
                              text: "Your Wi-fi Connection",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
