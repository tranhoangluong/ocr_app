import 'package:flutter/material.dart';
import 'package:ocr_app/screens/login.dart';
import 'package:ocr_app/screens/result.dart';
import 'package:ocr_app/widgets/image_preview.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_app/api/google_mlkit_recognition_text.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  String text = '';
  File? image;

  scanText() async {
    if (image != null) {
      final navigator = Navigator.of(context);
      final text = await GoogleMLKitTextRecognitionAPI.recognizeText(image!);
      setText(text);
      await navigator.push(
        MaterialPageRoute(
          builder: (BuildContext context) => ResultScreen(text: text),
        ),
      );
    }
  }

  pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setImage(File(file!.path));
  }

  pickImagex2() async {
    final file = await ImagePicker().pickImage(source: ImageSource.camera);
    setImage(File(file!.path));
  }

  void setImage(File? newImage) {
    setState(() {
      image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }

  void remove() {
    setImage(null);
    setText('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(195, 210, 255, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'OCR-Flutter',
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 55),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: imagePreview(image),
                ),
              ),
              Align(
                child: OverflowBar(
                  spacing: 8,
                  overflowAlignment: OverflowBarAlignment.end,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        scanText();
                      },
                      child: const Text('Scan Image'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        remove();
                      },
                      child: const Text('Remove Image'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    pickImagex2();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Camera')
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    pickImage();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_library_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Photos')
                    ],
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
