import 'dart:io';

import 'package:documentscanner/recognizer_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ImagePicker imagePicker;
  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  elevation: 4,
                  child: Container(
                    width: double
                        .infinity, // Ensure width and height are equal for a perfect circle
                    height: 60,
                    color: Colors.cyan,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.scanner_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                            Text(
                              'Scanner',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assignment_sharp,
                              size: 25,
                              color: Colors.white,
                            ),
                            Text(
                              'Recognize',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.enhance_photo_translate_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                            Text(
                              'Enhance',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.black,
                child: Container(
                  height: MediaQuery.of(context).size.height - 250,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                    ),
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.rotate_left,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            XFile? xfile = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (xfile != null) {
                              File image = File(xfile.path);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) {
                                    return RecognizerScreen(image);
                                  },
                                ),
                              );
                            }
                          },
                          child: Icon(
                            Icons.camera,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            XFile? xfile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (xfile != null) {
                              File image = File(xfile.path);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) {
                                    return RecognizerScreen(image);
                                  },
                                ),
                              );
                            }
                          },
                          child: Icon(
                            Icons.photo,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
