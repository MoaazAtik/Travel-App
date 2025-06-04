import '../features/trip/domain/entities/trip.dart';

bool addTripMocks = false;

final List<Trip> tripMocks = [
  Trip(
    title: 'Big Ben',
    photos: [
      'https://images.unsplash.com/photo-1486299267070-83823f5448dd?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    description: 'Great Clock of Westminster.',
    date: DateTime.now().add(Duration(days: 30)),
    location: 'London',
  ),

  Trip(
    title: 'Hawaii',
    photos: [
      'https://images.unsplash.com/photo-1586996292898-71f4036c4e07?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    description: 'Best place if you are looking for peace of mind.',
    date: DateTime.now().subtract(Duration(days: 5)),
    location: 'USA',
  ),

  Trip(
    title: 'Alhambra',
    photos: [
      'https://images.unsplash.com/photo-1605654464243-3668a4c0de3d?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    description: 'One of the most famous monuments in Spain.',
    date: DateTime.now().subtract(Duration(days: 20)),
    location: 'Spain',
  ),

  Trip(
    title: 'Sydney Opera House',
    photos: [
      'https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    description:
        'A world-renowned performing arts center located on the foreshore of Sydney Harbour.',
    date: DateTime.now().subtract(Duration(days: 20)),
    location: 'Australia',
  ),
];
