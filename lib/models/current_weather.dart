import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {
  final String description;
  final double temp;
  final double windSpeed;

  CurrentWeather({
    required this.description,
    required this.temp,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
