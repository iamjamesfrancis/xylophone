import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AudioCache _player = AudioCache(prefix: 'assets/');
    void _playerNumber(int num) {
      _player.play('assets_note$num.wav');
    }

    Expanded _xyloBar({required int audioNum, required Color color}) {
      return Expanded(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
          ),
          onPressed: () {
            _playerNumber(audioNum);
          },
          child: Text(''),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _xyloBar(audioNum: 1, color: Colors.red),
            _xyloBar(audioNum: 2, color: Colors.orange),
            _xyloBar(audioNum: 3, color: Colors.yellow),
            _xyloBar(audioNum: 4, color: Colors.green),
            _xyloBar(audioNum: 5, color: Colors.blue),
            _xyloBar(audioNum: 6, color: Colors.indigo),
            _xyloBar(audioNum: 7, color: Colors.purple),
          ],
        ),
      ),
    );
  }
}
