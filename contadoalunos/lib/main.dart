import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contando os alunos",
      home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _alunos = 0;
  String _chega = "";

  void _change(int increment){
    setState(() {
      _alunos += increment;
    });
    if(_alunos>= 36){
      _chega = "Ops, o lab está cheio!";
    } else if (_alunos < 0){
      _chega = "Pessoas negativas?";
    }else {
      _chega = "Chega mais";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Alunos: $_alunos",
          style: TextStyle (color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextButton(
                child: Text(
                  "+1",
                  style: TextStyle(fontSize: 40, color: Colors.indigo),
                ),
                onPressed: () {
                  _change(1);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextButton(
                child: Text(
                  "-1",
                  style: TextStyle(fontSize: 40, color: Colors.indigo),
                ),
                onPressed: () {
                  _change(-1);
                },
              ),
            ),
          ],
        ),
        Text(
          "$_chega",
          style: TextStyle (color: Colors.purple, fontStyle: FontStyle.italic, fontSize: 30.0),
        ),
      ],
    );
  }
}