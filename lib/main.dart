import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'features/trip/data/models/trip_model.dart';
import 'features/trip/ui/pages/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize hive and open our box
  /*
  // Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  The line above doesn't work on browser
  because Path Provider Package doesn't support Web.
  */
  Hive.initFlutter();
  Hive.registerAdapter(TripModelAdapter());
  await Hive.openBox<TripModel>('trips');

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
