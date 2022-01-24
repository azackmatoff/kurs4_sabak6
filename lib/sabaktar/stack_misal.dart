import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kurs4_sabak6/custom_button.dart';
import 'package:kurs4_sabak6/sabaktar/sabaktar.dart';

/// const
const String bulConst = 'Bul const tekst 2';
const String bulTema = 'Flutter kursu';

class StackMisal extends StatefulWidget {
  const StackMisal({this.finalSoz, Key key}) : super(key: key);

  final String finalSoz;

  @override
  State<StackMisal> createState() => _StackMisalState();
}

class _StackMisalState extends State<StackMisal> {
  Widget correctIcon = const Padding(
    padding: EdgeInsets.only(right: 8.0),
    child: FaIcon(
      FontAwesomeIcons.check,
      color: Color(0xff4CAF4F),
    ),
  );

  /// kata ikonka
  Widget wrongIcon = const Padding(
    padding: EdgeInsets.only(right: 8.0),
    child: FaIcon(
      FontAwesomeIcons.times,
      color: Color(0xffF44336),
    ),
  );

  //// Sabak uchun misaldar
  ///
  Adam adam;

  /// var, final, const
  /// var = variable
  var _varMisal = 3453.9;

  /// final
  String _finalSoz;

  /// const
  // static const String _bulConst = 'asdsa';

  @override
  void initState() {
    super.initState();

    // widget.finalSoz = 'asdasd';

    _finalSoz = widget.finalSoz;

    log('_varMisal bashynda: $_varMisal');
    log('_finalSoz bashynda: $_finalSoz');

    _varMisal = 23423.6;

    /// kata beret, ozgorboyt, sebebi final (akyrky)
    // _finalSoz = 'asdasdsa';

    log('_varMisal kiyin: $_varMisal');
  }

  @override
  Widget build(BuildContext context) {
    /// _height ichinde, sebebi kurup bashtaganda kana
    /// telefondun razmerin ala alat
    final _height = MediaQuery.of(context).size.height;

    /// kur
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          bulTema,
          style: TextStyle(fontSize: 34.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Stack(
          children: [
            const SizedBox(),
            Positioned(
              top: _height / 3,
              left: 2,
              right: 2,
              child: Column(
                children: [
                  Text(
                    _finalSoz,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    bulConst,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: _height * 0.05,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () {},
                    buttonText: 'Туура',
                    bgColor: const Color(0xff4CAF4F),
                  ),
                  const SizedBox(height: 20.0),
                  CustomButton(
                    onPressed: () {},
                    buttonText: 'Туура эмес',
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Row(
                  children: [
                    correctIcon,
                    wrongIcon,
                    correctIcon,
                    wrongIcon,
                    correctIcon,
                    wrongIcon,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

kolaAlipKel() {
  akchaBer();
  // Adam adam = Adam();
  ///.....////
}

akchaBer() {
  ///....///
}

/// Scope
/// Global Scope
/// Local Scope
/// Granicalar
/// tuzup atkanda
/// class  { ... }
/// method (funksiya)  { ... }
///
/// koldonup atkanda
/// method (funksiya)  ( ... )
/// class ( ... )
