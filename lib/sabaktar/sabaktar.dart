import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String studentName = 'John';
  int studentGrade = 5;

  List<String> bKlass = [
    'Jon',
    'Jane',
    'Jack',
  ];

  bool like = false;

  List<bool> likes = <bool>[];

  @override
  void initState() {
    super.initState();

    Mugalim duyshon = Mugalim();

    duyshon.basuu();
    duyshon.name = 'Duyshon';
    duyshon.baaKoy(baa: 5);

    log('duyshon.name: ${duyshon.name}');

    Adam jon = Adam(
      name: 'Jon',
      age: 34,
    );

    // jon.basuu();

    Adam jack = Adam(
      age: 3,
      name: 'Jack',
    );

    List<Adam> adamdar = <Adam>[
      jon,
      jack,
    ];

    // log('adamdar jon.name ==> ${adamdar[0].name}');
    // log('jon.age ==> ${jon.age}');
    // log('jack.name ==> ${jack.name}');
    // log('jack.age ==> ${jack.age}');

    bKlass.removeAt(0);

    studentName = 'Manas';

    List<String> aKlass = [
      'Jon', //0
      'Jane', //1
      'Jack', //2
      studentName, //3
      'Seytek', //4
      'Semetey', //5
      'Azat', //6
    ];

    aKlass.add('Manasbek');

    List<int> baalar = [
      3,
      4,
      5,
      studentGrade,
    ];

    // log('ichimdikAlipKel ==> ${ichimdikAlipKel()}');
  }

  List<int> suular = <int>[1, 1, 1];

  String ichimdikAlipKel() {
    /// eger, suu bolso su alip kel
    /// bolboso, kola alip kel
    if (suular.length == 0) {
      return 'Cola';
    } else {
      return 'suu';
    }
  }

  ///

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                like = true;
                likes.add(like);
                setState(() {});
              },
              child: likeKur(),
            ),
            Text(
              '${likes.length}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.hearing_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget likeKur() {
    if (like == false) {
      return const FaIcon(
        FontAwesomeIcons.heart,
        size: 80,
      );
    } else {
      return const FaIcon(
        FontAwesomeIcons.solidHeart,
        size: 80,
        color: Colors.red,
      );
    }
  }
}

// object, class, model

class Adam {
  Adam({@required this.name, @required this.age});

  String name; //adamdyn aty
  int age; // jashy

// method, functions
  void basuu() {
    log(' Adam basyp atat');
  }
}

class Mugalim extends Adam {
  void baaKoy({int baa}) {
    log('koyulgan baa: $baa');
  }

  @override
  void basuu() {
    log('Mugalim basip baratat!');
    super.basuu();
  }
}
