// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, deprecated_member_use, unnecessary_null_comparison, use_build_context_synchronously, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CreateSessionPage extends StatefulWidget {
  @override
  _CreateSessionPageState createState() => _CreateSessionPageState();
}

class _CreateSessionPageState extends State<CreateSessionPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _startDateTimeController = TextEditingController();
  final _endDateTimeController = TextEditingController();
  final _skillsTagsController = TextEditingController();
  final _pointsController = TextEditingController();
  late File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final startDateTime = DateTime.parse(_startDateTimeController.text);
      final endDateTime = DateTime.parse(_endDateTimeController.text);
      final skillsTags = _skillsTagsController.text
          .split(',')
          .map((tag) => tag.trim())
          .toList();
      final points = int.parse(_pointsController.text);

      try {
        final sessionRef =
            FirebaseFirestore.instance.collection('sessions').doc();

        if (_image != null) {
          final imageUrl = await uploadImageToFirebaseStorage(sessionRef.id);
          await sessionRef.set({
            'title': title,
            'startDateTime': startDateTime.toIso8601String(),
            'endDateTime': endDateTime.toIso8601String(),
            'skillsTags': skillsTags,
            'points': points,
            'imageUrl': imageUrl,
          });
        } else {
          await sessionRef.set({
            'title': title,
            'startDateTime': startDateTime.toIso8601String(),
            'endDateTime': endDateTime.toIso8601String(),
            'skillsTags': skillsTags,
            'points': points,
          });
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Session created successfully')),
        );

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating session: $e')),
        );
      }
    }
  }

  Future<String> uploadImageToFirebaseStorage(String sessionId) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('sessions')
        .child(sessionId)
        .child('session_image.jpg');
    await storageRef.putFile(_image);
    return await storageRef.getDownloadURL();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _startDateTimeController.dispose();
    _endDateTimeController.dispose();
    _skillsTagsController.dispose();
    _pointsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Session'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _startDateTimeController,
                  decoration: InputDecoration(
                    labelText: 'Start Date and Time',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter start date and time';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _endDateTimeController,
                  decoration: InputDecoration(
                    labelText: 'End Date and Time',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter end date and time';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _skillsTagsController,
                  decoration: InputDecoration(
                    labelText: 'Skills Tags (comma separated)',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _pointsController,
                  decoration: InputDecoration(
                    labelText: 'Points',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter points';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: getImage,
                  child: Text('Choose session image'),
                ),
                SizedBox(height: 16.0),
                if (_image != null) ...[
                  Image.file(_image),
                  SizedBox(height: 16.0),
                ],
                ElevatedButton(
                  onPressed: _submit,
                  child: Text('Create Session'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
