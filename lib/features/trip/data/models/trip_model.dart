/* In small apps this class could extend the domain's 'trip' Entity.
 * But, it's not recommended for a better separation of concerns. */

import 'package:hive/hive.dart';

import '../../domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<String> photos;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String location;

  TripModel({
    required this.title,
    required this.photos,
    required this.description,
    required this.date,
    required this.location,
  });

  /// Convert Trip entity to TripModel
  factory TripModel.fromEntity(Trip trip) => TripModel(
    title: trip.title,
    photos: trip.photos,
    description: trip.description,
    date: trip.date,
    location: trip.location,
  );

  /// Convert TripModel to Trip entity
  Trip toEntity() => Trip(
    title: title,
    photos: photos,
    description: description,
    date: date,
    location: location,
  );
}
