import 'package:flutter/material.dart';
import 'package:ocr_app/screens/translate.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text2pdf/text2pdf.dart';

class ResultScreen extends StatefulWidget {
  String text;

  ResultScreen({super.key, required this.text});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  void copyToClipboard() {
    if (widget.text.trim() != '') {
      FlutterClipboard.copy(widget.text);
    }
  }

  void _shareText(String text) {
    Share.share(text);
  }

  savePdf() async {
    if (widget.text.isNotEmpty) {
      await Text2Pdf.generatePdf(widget.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(195, 210, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text('Result'),
        actions: [
          TextButton.icon(
            onPressed: () {
              navigator.push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      TranslateScreen(text2: widget.text),
                ),
              );
            },
            icon: const Icon(
              Icons.g_translate,
              color: Colors.white,
              size: 24.0,
            ),
            label: const Text(
              'Translate',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height / 1.35,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.text),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        copyToClipboard();
                      },
                      icon: const Icon(
                        Icons.copy,
                        size: 20.0,
                      ),
                      label: const Text('Copy'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _shareText(widget.text);
                      },
                      icon: const Icon(
                        Icons.share,
                        size: 20.0,
                      ),
                      label: const Text('Share'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        savePdf();
                      },
                      icon: const Icon(
                        Icons.save,
                        size: 20.0,
                      ),
                      label: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
