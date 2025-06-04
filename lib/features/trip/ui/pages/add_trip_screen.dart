import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/trip.dart';
import '../providers/trip_provider.dart';
import '../widgets/custom_text_form_field.dart';

class AddTripScreen extends ConsumerWidget {
  AddTripScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _locationController = TextEditingController();
  final _pictureController = TextEditingController();

  final List<String> pictures = [
    'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGddVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 20.0,
          children: [
            SizedBox(height: 20),
            CustomTextFormField(
              controller: _titleController,
              labelText: "Title",
            ),
            CustomTextFormField(
              controller: _descController,
              labelText: "Description",
            ),
            CustomTextFormField(
              controller: _locationController,
              labelText: "Location",
            ),
            CustomTextFormField(
              controller: _pictureController,
              labelText: "Photo url",
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                pictures.add(_pictureController.text);
                if (_formKey.currentState!.validate()) {
                  final newTrip = Trip(
                    title: _titleController.text,
                    description: _descController.text,
                    date: DateTime.now(),
                    location: _locationController.text,
                    photos: pictures,
                  );

                  ref
                      .read(tripListNotifierProvider.notifier)
                      .addNewTrip(newTrip);
                }
              },
              child: Text("Add trip"),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
