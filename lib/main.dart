import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_uygulamasi/soruHavuzu.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void Main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> sonucList = [];

  void soruCevapla(bool kullaniciCevap) {
    setState(() {
      bool dogruCevap = soruHavuzu.soruCevap();
      if (soruHavuzu.sorularBittiMi() == true) {
        if (dogruCevap == kullaniciCevap) {
          dogruCevapSayisi++;
          sonucList.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          sonucList.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBitir();
      }
      else{
        if (dogruCevap == kullaniciCevap) {
          dogruCevapSayisi++;
          sonucList.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          sonucList.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        soruHavuzu.sonrakiSoruGetir();
      }

    });
  }

  int dogruCevapSayisi = 0;

  void quizBitir() {
    Alert(
        context: context,
        type: AlertType.info,
        title: "Quiz Tamamlandı",
        desc: "Doğru Sayısı $dogruCevapSayisi",
        buttons: [
          DialogButton(
            child: Text(
              "Tamam",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ]).show();
    soruHavuzu.reset();
    sonucList = [];
    dogruCevapSayisi = 0;
  }

  SoruHavuzu soruHavuzu = SoruHavuzu();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soruHavuzu.soruTextGetir(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FloatingActionButton(
              onPressed: () {
                soruCevapla(true);
              },
              backgroundColor: Colors.lightGreen,
              child: Text(
                'DOĞRU',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FloatingActionButton(
              onPressed: () {
                soruCevapla(false);
              },
              backgroundColor: Colors.redAccent,
              child: Text(
                'YANLIŞ',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Row(
          children: sonucList,
        )
      ],
    );
  }
}
