// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, deprecated_member_use, unnecessary_null_comparison, use_build_context_synchronously, prefer_const_constructors, avoid_init_to_null, unused_import, sort_child_properties_last, unused_element, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/widgets/material/button/flutx_buttons_screen.dart';
import 'package:dao/widgets/material/navigation/flutx_bottom_navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutx/flutx.dart';
import '../theme/app_theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

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

  RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  late File? _image;
  final picker = ImagePicker();
  bool isLoading = false;
  List<String> allSkills = [];
  List<String> selectedSkills = [];

  late ThemeData theme;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _image = null;
    theme = AppTheme.theme;

    getSkillsList().then((skillsList) {
      setState(() {
        allSkills = skillsList;
        print(allSkills);
      });
    });
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
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.prograssiveDots(
                color: theme.primaryColor,
                size: 100,
              ),
            )
          : SingleChildScrollView(
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
                          labelText: 'Session Title',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          floatingLabelStyle:
                              TextStyle(color: theme.primaryColor),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.2),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.primaryColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter points';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      DateTimeField(
                        format: DateFormat('yyyy-MM-dd HH:mm'),
                        controller: _startDateTimeController,
                        decoration: InputDecoration(
                          labelText: 'Start Date and Time',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 1.0),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1.0),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter start date and time';
                          }
                          return null;
                        },
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now(),
                              ),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        },
                        cursorColor: theme.primaryColor,
                      ),
                      SizedBox(height: 16.0),
                      DateTimeField(
                        format: DateFormat('yyyy-MM-dd HH:mm'),
                        controller: _endDateTimeController,
                        decoration: InputDecoration(
                          labelText: 'End Date and Time',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 1.0),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1.0),
                            // borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter end date and time';
                          }
                          return null;
                        },
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now(),
                              ),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        },
                        cursorColor: theme.primaryColor,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _pointsController,
                        decoration: InputDecoration(
                          labelText: 'Points',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          floatingLabelStyle:
                              TextStyle(color: theme.primaryColor),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.2),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.primaryColor,
                              width: 1.0,
                            ),
                          ),
                        ),
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
                      MultiSelectDialogField<String>(
                        items: allSkills
                            .map((skill) => MultiSelectItem(skill, skill))
                            .toList(),
                        title: Text("Select Skills"),
                        buttonText: Text("Select Skills"),
                        onConfirm: (values) {
                          setState(() {
                            selectedSkills = values;
                          });
                          print(selectedSkills);
                        },
                        chipDisplay: MultiSelectChipDisplay(
                          onTap: (value) {
                            setState(() {
                              selectedSkills.remove(value);
                              print(selectedSkills);
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: getImage,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal.shade700, // Background color
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(Icons.image,
                                  color: Colors.white), // Icon on the left
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Text('Choose Session image',
                                    style: TextStyle(color: Colors.white)),
                              ), // Text on the right
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      if (_image != null) ...[
                        Image.file(_image!),
                        SizedBox(height: 16.0),
                      ],
                      Center(
                        child: RoundedLoadingButton(
                          controller: _btnController,
                          borderRadius: 20,
                          color: Colors.teal.shade700,
                          onPressed: () async {
                            _submit();
                            _btnController.stop();
                          },
                          child: Text(
                            'Create Session',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  MultiSelectDialogField<String> _buildMultiSelectDialogField() {
    return MultiSelectDialogField(
      items: allSkills.map((skill) => MultiSelectItem(skill, skill)).toList(),
      title: Text("Select Skills"),
      buttonText: Text("Select Skills"),
      onConfirm: (values) {
        setState(() {
          selectedSkills = values;
        });
        print(selectedSkills);
      },
      chipDisplay: MultiSelectChipDisplay(
        onTap: (value) {
          setState(() {
            selectedSkills.remove(value);
            print(selectedSkills);
          });
        },
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  /// Function to get the current Firebase user
  Future<User> getCurrentFirebaseUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    if (currentUser != null) {
      // If there is a currently signed in user
      return currentUser;
    } else {
      // If no user is signed in
      throw Exception('No user is currently signed in.');
    }
  }

  void _submit() async {
    // setState(() {
    //   isLoading = true;
    // });

    try {
      if (_formKey.currentState!.validate()) {
        final title = _titleController.text;
        final startDateTime = DateTime.parse(_startDateTimeController.text);
        final endDateTime = DateTime.parse(_endDateTimeController.text);

        final skillsTags = selectedSkills;
        final points = int.parse(_pointsController.text);
        final sessionRef =
            FirebaseFirestore.instance.collection('sessions').doc();

        final User user = await getCurrentFirebaseUser();
        if (_image != null) {
          final imageUrl = await uploadImageToFirebaseStorage(sessionRef.id);
          await sessionRef.set({
            'approve': false,
            'instructor': user.uid,
            'students': [],
            'title': title,
            'startTime': startDateTime,
            'endtTime': endDateTime,
            'tags': skillsTags,
            'points': points,
            'imageUrl': imageUrl,
            'description': "No description",
          });
        } else {
          await sessionRef.set({
            'approve': false,
            'instructor': user.uid,
            'students': [],
            'title': title,
            'startTime': startDateTime,
            'endtTime': endDateTime,
            'tags': skillsTags,
            'points': points,
            'description': "No description",
          });
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Session created successfully')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating session: $e')),
      );
    } finally {
      // setState(() {
      //   isLoading = false;
      //   _btnController.stop();
      // });
      _btnController.stop();
    }
  }

  Future<String> uploadImageToFirebaseStorage(String sessionId) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('sessions')
        .child(sessionId)
        .child('session_image.jpg');

    if (_image != null) {
      await storageRef.putFile(_image!);
    }

    return await storageRef.getDownloadURL();
  }

  Future<List<String>> getSkillsList() async {
    final skillsCollection = FirebaseFirestore.instance.collection('skills');
    final snapshot = await skillsCollection.get();
    final skillsList =
        snapshot.docs.map((doc) => doc['name'].toString()).toList();
    return skillsList;
  }
}
