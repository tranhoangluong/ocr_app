import 'package:flutter/material.dart';
import 'package:text2pdf/text2pdf.dart';
import 'package:translator/translator.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';

class TranslateScreen extends StatefulWidget {
  late String text2;

  TranslateScreen({super.key, required this.text2});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {

  final translator = GoogleTranslator();
  String? _translateLanguage;
  String selectedLanguage = 'English';
  List listLanguage = [
    "Afrikaans",
    "Albanian",
    "Amharic",
    "Arabic",
    "Armenian",
    "Azerbaijani",
    'Basque',
    'Belarusian',
    'Bengali',
    'Bosnian',
    'Bulgarian',
    'Catalan',
    'Cebuano',
    'Chichewa',
    'Chinese Simplified',
    'Chinese Traditional',
    'Corsican',
    'Croatian',
    'Czech',
    'Danish',
    'Dutch',
    'English',
    'Esperanto',
    'Estonian',
    'Filipino',
    'Finnish',
    'French',
    'Frisian',
    'Galician',
    'Georgian',
    'German',
    'Greek',
    'Gujarati',
    'Haitian Creole',
    'Hausa',
    'Hawaiian',
    'Hebrew',
    'Hindi',
    'Hmong',
    'Hungarian',
    'Icelandic',
    'Igbo',
    'Indonesian',
    'Irish',
    'Italian',
    'Japanese',
    'Javanese',
    'Kannada',
    'Kazakh',
    'Khmer',
    'Korean',
    'Kurdish (Kurmanji)',
    'Kyrgyz',
    'Lao',
    'Latin',
    'Latvian',
    'Lithuanian',
    'Luxembourgish',
    'Macedonian',
    'Malagasy',
    'Malay',
    'Malayalam',
    'Maltese',
    'Maori',
    'Marathi',
    'Mongolian',
    'Myanmar (Burmese)',
    'Nepali',
    'Norwegian',
    'Pashto',
    'Persian',
    'Polish',
    'Portuguese',
    'Punjabi',
    'Romanian',
    'Russian',
    'Samoan',
    'Scots Gaelic',
    'Serbian',
    'Sesotho',
    'Shona',
    'Sindhi',
    'Sinhala',
    'Slovak',
    'Slovenian',
    'Somali',
    'Spanish',
    'Sundanese',
    'Swahili',
    'Swedish',
    'Tajik',
    'Tamil',
    'Telugu',
    'Thai',
    'Turkish',
    'Ukrainian',
    'Urdu',
    'Uzbek',
    'Vietnamese',
    'Welsh',
    'Xhosa',
    'Yiddish',
    'Yoruba',
    'Zulu'
  ];

  String? output;

  void translate() {
    if (selectedLanguage == 'Afrikaans') {
      _translateLanguage = 'au';
    } else if (selectedLanguage == 'Albanian') {
      _translateLanguage = 'sq';
    } else if (selectedLanguage == 'Amharic') {
      _translateLanguage = 'am';
    } else if (selectedLanguage == 'Albanian') {
      _translateLanguage = 'sq';
    } else if (selectedLanguage == '"Arabic"') {
      _translateLanguage = 'ar';
    } else if (selectedLanguage == 'Azerbaijani') {
      _translateLanguage = 'az';
    } else if (selectedLanguage == 'Basque') {
      _translateLanguage = 'eu';
    } else if (selectedLanguage == 'Belarusian') {
      _translateLanguage = 'be';
    } else if (selectedLanguage == 'Bengali') {
      _translateLanguage = 'bn';
    } else if (selectedLanguage == 'Bosnian') {
      _translateLanguage = 'bs';
    } else if (selectedLanguage == 'Bulgarian') {
      _translateLanguage = 'bg';
    } else if (selectedLanguage == 'Catalan') {
      _translateLanguage = 'ca';
    } else if (selectedLanguage == 'Cebuano') {
      _translateLanguage = 'ceb';
    } else if (selectedLanguage == 'Chichewa') {
      _translateLanguage = 'ny';
    } else if (selectedLanguage == 'Chinese Simplified') {
      _translateLanguage = 'zh-cn';
    } else if (selectedLanguage == 'Chinese Traditional') {
      _translateLanguage = 'zh-tw';
    } else if (selectedLanguage == 'Corsican') {
      _translateLanguage = 'co';
    } else if (selectedLanguage == 'Croatian') {
      _translateLanguage = 'hr';
    } else if (selectedLanguage == 'Czech') {
      _translateLanguage = 'cs';
    } else if (selectedLanguage == 'Danish') {
      _translateLanguage = 'da';
    } else if (selectedLanguage == 'Dutch') {
      _translateLanguage = 'nl';
    } else if (selectedLanguage == 'English') {
      _translateLanguage = 'en';
    } else if (selectedLanguage == 'Esperanto') {
      _translateLanguage = 'et';
    } else if (selectedLanguage == 'Filipino') {
      _translateLanguage = 'tl';
    } else if (selectedLanguage == 'Finnish') {
      _translateLanguage = 'fi';
    } else if (selectedLanguage == 'French') {
      _translateLanguage = 'fr';
    } else if (selectedLanguage == 'Frisian') {
      _translateLanguage = 'fy';
    } else if (selectedLanguage == 'Galician') {
      _translateLanguage = 'gl';
    } else if (selectedLanguage == 'Georgian') {
      _translateLanguage = 'ka';
    } else if (selectedLanguage == 'German') {
      _translateLanguage = 'de';
    } else if (selectedLanguage == 'Greek') {
      _translateLanguage = 'el';
    } else if (selectedLanguage == 'Gujarati') {
      _translateLanguage = 'gu';
    } else if (selectedLanguage == 'Haitian Creole') {
      _translateLanguage = 'ht';
    } else if (selectedLanguage == 'Hausa') {
      _translateLanguage = 'ha';
    } else if (selectedLanguage == 'Hawaiian') {
      _translateLanguage = 'haw';
    } else if (selectedLanguage == 'Hebrew') {
      _translateLanguage = 'iw';
    } else if (selectedLanguage == 'Hindi') {
      _translateLanguage = 'hi';
    } else if (selectedLanguage == 'Hmong') {
      _translateLanguage = 'hmn';
    } else if (selectedLanguage == 'Hungarian') {
      _translateLanguage = 'hu';
    } else if (selectedLanguage == 'Icelandic') {
      _translateLanguage = 'is';
    } else if (selectedLanguage == 'Igbo') {
      _translateLanguage = 'ig';
    } else if (selectedLanguage == 'Indonesian') {
      _translateLanguage = 'id';
    } else if (selectedLanguage == 'Irish') {
      _translateLanguage = 'ga';
    } else if (selectedLanguage == 'Italian') {
      _translateLanguage = 'it';
    } else if (selectedLanguage == 'Japanese') {
      _translateLanguage = 'ja';
    } else if (selectedLanguage == 'Javanese') {
      _translateLanguage = 'jw';
    } else if (selectedLanguage == 'Kannada') {
      _translateLanguage = 'kn';
    } else if (selectedLanguage == 'Kazakh') {
      _translateLanguage = 'kk';
    } else if (selectedLanguage == 'Khmer') {
      _translateLanguage = 'km';
    } else if (selectedLanguage == 'Korean') {
      _translateLanguage = 'ko';
    } else if (selectedLanguage == 'Kurdish (Kurmanji)') {
      _translateLanguage = 'ku';
    } else if (selectedLanguage == 'Kyrgyz') {
      _translateLanguage = 'ky';
    } else if (selectedLanguage == 'Lao') {
      _translateLanguage = 'lo';
    } else if (selectedLanguage == 'Latin') {
      _translateLanguage = 'la';
    } else if (selectedLanguage == 'Latvian') {
      _translateLanguage = 'lv';
    } else if (selectedLanguage == 'Lithuanian') {
      _translateLanguage = 'lt';
    } else if (selectedLanguage == 'Luxembourgish') {
      _translateLanguage = 'lb';
    } else if (selectedLanguage == 'Macedonian') {
      _translateLanguage = 'mk';
    } else if (selectedLanguage == 'Malagasy') {
      _translateLanguage = 'mg';
    } else if (selectedLanguage == 'Malay') {
      _translateLanguage = 'ms';
    } else if (selectedLanguage == 'Malayalam') {
      _translateLanguage = 'ml';
    } else if (selectedLanguage == 'Maltese') {
      _translateLanguage = 'mt';
    } else if (selectedLanguage == 'Maori') {
      _translateLanguage = 'mi';
    } else if (selectedLanguage == 'Marathi') {
      _translateLanguage = 'mr';
    } else if (selectedLanguage == 'Mongolian') {
      _translateLanguage = 'mn';
    } else if (selectedLanguage == 'Myanmar (Burmese)') {
      _translateLanguage = 'my';
    } else if (selectedLanguage == 'Nepali') {
      _translateLanguage = 'ne';
    } else if (selectedLanguage == 'Norwegian') {
      _translateLanguage = 'no';
    } else if (selectedLanguage == 'Pashto') {
      _translateLanguage = 'ps';
    } else if (selectedLanguage == 'Persian') {
      _translateLanguage = 'fa';
    } else if (selectedLanguage == 'Polish') {
      _translateLanguage = 'pl';
    } else if (selectedLanguage == 'Portuguese') {
      _translateLanguage = 'pt';
    } else if (selectedLanguage == 'Punjabi') {
      _translateLanguage = 'pa';
    } else if (selectedLanguage == 'Romanian') {
      _translateLanguage = 'ro';
    } else if (selectedLanguage == 'Russian') {
      _translateLanguage = 'ru';
    } else if (selectedLanguage == 'Scots Gaelic') {
      _translateLanguage = 'gd';
    } else if (selectedLanguage == 'Serbian') {
      _translateLanguage = 'sr';
    } else if (selectedLanguage == 'Sesotho') {
      _translateLanguage = 'st';
    } else if (selectedLanguage == 'Shona') {
      _translateLanguage = 'sn';
    } else if (selectedLanguage == 'Sindhi') {
      _translateLanguage = 'sd';
    } else if (selectedLanguage == 'Sinhala') {
      _translateLanguage = 'si';
    } else if (selectedLanguage == 'Slovak') {
      _translateLanguage = 'sk';
    } else if (selectedLanguage == 'Slovenian') {
      _translateLanguage = 'sl';
    } else if (selectedLanguage == 'Somali') {
      _translateLanguage = 'so';
    } else if (selectedLanguage == 'Spanish') {
      _translateLanguage = 'es';
    } else if (selectedLanguage == 'Sundanese') {
      _translateLanguage = 'su';
    } else if (selectedLanguage == 'Swahili') {
      _translateLanguage = 'sw';
    } else if (selectedLanguage == 'Swedish') {
      _translateLanguage = 'sv';
    } else if (selectedLanguage == 'Tajik') {
      _translateLanguage = 'tg';
    } else if (selectedLanguage == 'Tamil') {
      _translateLanguage = 'ta';
    } else if (selectedLanguage == 'Telugu') {
      _translateLanguage = 'te';
    } else if (selectedLanguage == 'Thai') {
      _translateLanguage = 'th';
    } else if (selectedLanguage == 'Turkish') {
      _translateLanguage = 'tr';
    } else if (selectedLanguage == 'Ukrainian') {
      _translateLanguage = 'uk';
    } else if (selectedLanguage == 'Urdu') {
      _translateLanguage = 'ur';
    } else if (selectedLanguage == 'Uzbek') {
      _translateLanguage = 'uz';
    } else if (selectedLanguage == 'Vietnamese') {
      _translateLanguage = 'vi';
    } else if (selectedLanguage == 'Welsh') {
      _translateLanguage = 'cy';
    } else if (selectedLanguage == 'Xhosa') {
      _translateLanguage = 'xh';
    } else if (selectedLanguage == 'Yiddish') {
      _translateLanguage = 'yi';
    } else if (selectedLanguage == 'Yoruba') {
      _translateLanguage = 'yo';
    } else if (selectedLanguage == 'Zulu') {
      _translateLanguage = 'zu';
    }

    translator.translate(widget.text2, to: "$_translateLanguage").then((value) {
      setState(() {
        output = value.toString();
      });
    });
  }

  void copyToClipboard() {
    if (output.toString().trim() != '') {
      FlutterClipboard.copy(output.toString());
    }
  }

  void _shareText(String text) {
    Share.share(output.toString());
  }

  savePdf() async {
    if (output.toString().isNotEmpty) {
      await Text2Pdf.generatePdf(output.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(195, 210, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Translate'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Text(widget.text2),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.15,
                    child: DropdownButton(
                      items: listLanguage.map<DropdownMenuItem>((value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      // text
                      value: selectedLanguage,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.indigo,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value;
                        });
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      translate();
                    },
                    child: const Text(
                      'Translate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: SelectableText(
                      output ?? "",
                    ),
                  ),
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
                        _shareText(output.toString());
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
