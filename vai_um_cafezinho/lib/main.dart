// WESLEY ALEXANDRE FIGUEIREDO

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "Informe seus dados";
  String _infoTextB = "";
  List<String> idade = ['Criança', 'Adolescente', 'Adulto'];
  final dropValue = ValueNotifier('');
  String _value = "";
  String selected = "";
  bool estadoa = false;
  bool estadob = false;
  String _idealCafeina = "";
  double _cafeinaIngerida = 0;
  TextEditingController caffeineController = TextEditingController();
  TextEditingController expressoController = TextEditingController();

  void _calculate() {
    double cafeIngerido = double.parse(caffeineController.text);
    double expressoIngerido = double.parse(expressoController.text);
    _cafeinaIngerida = (cafeIngerido / 1.47) + (expressoIngerido * 2);
    setState(() {
      if (_value == "Sensivel") {
        _idealCafeina = "de 100 a 200 mg";
      } else if (_value == "Gestante") {
        _idealCafeina = "200 mg";
      } else if (selected == "Adulto") {
        _idealCafeina = "de 300 a 400 mg";
      } else if (selected == "Criança" || selected == "Adolescente") {
        _idealCafeina = "100";
      }
      _infoText = "Quantidade máxima de cafeína por dia: $_idealCafeina";
      _infoTextB =
      "Quantidade ingerida: ${_cafeinaIngerida.toStringAsPrecision(4)} mg";
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    _formKey = GlobalKey<FormState>();
    caffeineController.text = "";
    expressoController.text = "";
    _infoTextB = "";
    dropValue.value = "";
    estadoa = false;
    estadob = false;
    setState(() {
      _infoText = "Informe seus dados";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vai um cafézinho?"),
        centerTitle: true,
        backgroundColor: Colors.brown,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            ValueListenableBuilder(
            valueListenable: dropValue,
            builder: (BuildContext context, String value, _) {
              return DropdownButton<String>(
                hint: const Text("Idade"),
                value: (value.isEmpty) ? null : value,
                onChanged: (op) {
                  selected = op.toString();
                  dropValue.value = op.toString();
                },
                items: idade.map((op) =>
                    DropdownMenuItem(
                      value: op,
                      child: Text(op),
                    )).toList(),
              );
            }),
        SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira a quantidade.";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Quantidade de café coado ingerida por dia (ml)",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
                textAlign: TextAlign.center,
                controller: caffeineController,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira a quantidade.";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Quantidade de café expresso ingerida por dia (ml)",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
                textAlign: TextAlign.center,
                controller: expressoController,
              ),
            ],
          ),
        ),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sensível a cafeína", textAlign: TextAlign.center),
          ),
          Checkbox(
            value: estadoa,
            onChanged: (value) {
              setState(() {
                _value = "Sensivel";
                estadoa = !estadoa;
              });
            },
          ),
          Text("Gestante ou Lactante", textAlign: TextAlign.center),
          Checkbox(
            value: estadob,
            onChanged: (value) {
              setState(() {
                _value = "Gestante";
                estadob = !estadob;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _calculate();
              }
            },
            child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 25.0),),
            style: ElevatedButton.styleFrom(primary: Colors.green,),
          ),
          Text(
            "$_infoText", style: TextStyle(color: Colors.black, fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "$_infoTextB",
              style: TextStyle(color: Colors.black, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
          ],
        ),
      ),
    );
  }
}
