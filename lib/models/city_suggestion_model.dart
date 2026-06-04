import 'package:json_annotation/json_annotation.dart';

part 'city_suggestion_model.g.dart';

@JsonSerializable()
class CitySuggestionModel {

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'country')
  final String country;


  CitySuggestionModel({

    required this.name,
    required this.country,
  });

  factory CitySuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$CitySuggestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CitySuggestionModelToJson(this);
}