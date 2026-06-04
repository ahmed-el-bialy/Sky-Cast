import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_cast/models/city_suggestion_model.dart';
import 'package:sky_cast/services/weather_services.dart';
import 'package:sky_cast/widgets/city_suggestion_card.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../helper/text_color_helper.dart';
import '../helper/theme_helper.dart';
import 'initial_search_body.dart';

class CustomSearchDelegate extends SearchDelegate {
  final BuildContext mainContext;
  final WeatherServices weatherServices = WeatherServices();

  @override
  TextInputAction get textInputAction => TextInputAction.search;

  CustomSearchDelegate(this.mainContext);

  Color? getCurrentThemeColor() {
    var city = BlocProvider.of<GetWeatherCubit>(mainContext).weatherModel;
    if (city == null) return null;
    final weatherStatus = city.current.condition.text;
    return getThemeColor(weatherStatus);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final currentThemeColor = getCurrentThemeColor();
    final isDefault = currentThemeColor == null;

    final viewContentColor = getAdaptiveContentColor(currentThemeColor);
    final viewHintColor = getAdaptiveHintColor(currentThemeColor);

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: isDefault
            ? const Color(0xFFF4F6F9)
            : currentThemeColor,
        elevation: 0,
        iconTheme: IconThemeData(color: viewContentColor),
        titleTextStyle: TextStyle(
          color: viewContentColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      // 🎯 الحل هنا: تلوين النص المكتوب بناءً على حالة الثيم عشان ميفضلش أبيض دايماً
      textTheme: theme.textTheme.copyWith(
        titleLarge: TextStyle(
          color: viewContentColor, // ✅ اتعدلت للمتكيف بدل Colors.white
          fontSize: 18,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: viewHintColor, fontSize: 18),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isDefault
                ? const Color(0xFFCBD5E1)
                : Colors.white.withValues(alpha: 0.6),
            width: 1.5,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isDefault
                ? const Color(0xFFE2E8F0)
                : Colors.white.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: viewContentColor),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: viewContentColor),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    final currentThemeColor = getCurrentThemeColor();
    final viewContentColor = getAdaptiveContentColor(currentThemeColor);

    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () {
            query = "";
            showSuggestions(context);
          },
          icon: Icon(Icons.clear_rounded, color: viewContentColor),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    final currentThemeColor = getCurrentThemeColor();
    final viewContentColor = getAdaptiveContentColor(currentThemeColor);

    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 22,
        color: viewContentColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isNotEmpty) {
      BlocProvider.of<GetWeatherCubit>(context).getWeather(query.trim());
      WidgetsBinding.instance.addPostFrameCallback((_) {
        close(context, null);
      });
    }
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final currentThemeColor = getCurrentThemeColor();
    final isDefault = currentThemeColor == null;

    final mainViewContentColor = getAdaptiveContentColor(currentThemeColor);
    final subViewContentColor = isDefault
        ? const Color(0xFF64748B)
        : Colors.white70;

    if (query.trim().isEmpty) {
      return InitialSearchBody(
        isDefault: isDefault,
        currentThemeColor: currentThemeColor,
        mainViewContentColor: mainViewContentColor,
      );
    }

    return Container(
      color: isDefault
          ? const Color(0xFFF4F6F9)
          : currentThemeColor.withValues(alpha: 0.95),
      child: FutureBuilder<List<CitySuggestionModel>>(
        future: weatherServices.getAutocompleteCities(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: mainViewContentColor),
            );
          }

          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text(
                "Error loading suggestions",
                style: TextStyle(color: subViewContentColor),
              ),
            );
          }

          final suggestions = snapshot.data!;

          if (suggestions.isEmpty) {
            return Center(
              child: Text(
                "No results found",
                style: TextStyle(fontSize: 18, color: subViewContentColor),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return CitySuggestionCard(
                  suggestion: suggestions[index],
                  isDefault: isDefault,
                  mainViewContentColor: mainViewContentColor,
                  subViewContentColor: subViewContentColor,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
