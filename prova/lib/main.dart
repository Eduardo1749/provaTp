import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String _infoText = "coloque suas informações";
  String valorSelecionado = "";



  void _resetFields(){
    _formKey = GlobalKey<FormState>();
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "coloque suas informações";
    });
  }
  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);

      double salario = weight;

      if(salario < 2424 && salario >= 1212){
        if(valorSelecionado == '2'){
          _infoText = "Sua fámilia irá receber 1,5 sálario mínimo.";
        }else if( valorSelecionado == '4'){
          _infoText = "Sua fámilia irá receber 1,5 sálario mínimo e um adcional de 600 reais.";
        }else if(valorSelecionado == '3'){
          _infoText = "Sua fámilia irá receber 3 sálarios mínimos.";
        }else if(valorSelecionado == '5'){
          _infoText = "Sua fámilia irá receber 3 sálarios mínimos e um adcional de 600 reais.";
        }else if( valorSelecionado == '6'){
          _infoText = "Sua fámilia não irá receber auxilio pois seus filho(s) não estão vacinados.";
        }else if(valorSelecionado == '7'){
          _infoText = "Sua fámilia não irá receber auxilio pois seus filho(s) não estão vacinados.";
        }else if( valorSelecionado == '8'){
          _infoText = "Sua fámilia não irá receber auxilio pois seus filho(s) não estão vacinados.";
        }else if(valorSelecionado == '9'){
          _infoText = "Sua fámilia não irá receber auxilio pois seus filho(s) não estão vacinados.";
        }
      }else if(salario < 1212){
        if(valorSelecionado == '2'){
          _infoText = "Sua fámilia irá receber 2,5 sálarios mínimos.";
        }else if(valorSelecionado == '4'){
          _infoText = "Sua fámilia irá receber 2,5 sálarios mínimos e um adcional de 600 reais.";
        }else if(valorSelecionado == '3'){
          _infoText = "Sua fámilia irá receber 3 sálarios mínimos.";
        }else if(valorSelecionado == '5'){
          _infoText = "Sua fámilia irá receber 3 sálarios mínimos e um adcional de 600 reais.";
        }else if( valorSelecionado == '6'){
          _infoText = "Sua fámilia não irá receber auxilio pois seus filho(s) não estão vacinados.";
        }else if(valorSelecionado == '7'){
          _infoText = "Sua fámilia não irá receber auxilio pois seus filho(s) não estão vacinados.";
        }else if( valorSelecionado == '8'){
          _infoText = "Sua fámilia não irá receber auxilio pois seus filho(s) não estão vacinados.";
        }else if(valorSelecionado == '9'){
          _infoText = "Sua fámilia não irá receber auxilio pois seus filho(s) não estão vacinados.";
        }
      }else if(salario > 2424){
        _infoText = "Sua fámilia não irá receber auxilio pois você recebe um valor maior doque dois salarios mínimos.";
      }
    });
  }
  final opcoes = ['Possuo até dois filhos (na escola e vacinados)', 'Possuo mais de três filhos (na escola e vacinados)',
    'Possuo até dois filhos (na escola e vacinados) e sou mãe solteira.', 'Possuo mais de três filhos (na escola e vacinados) e sou mãe soleira.'];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Auxilio emergencial"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
              onPressed: _resetFields),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.child_friendly_outlined, size: 120.0, color: Colors.lightBlueAccent,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Salario(reais)",
                    labelStyle: TextStyle(color:
                    Colors.lightBlueAccent)

                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if (value!.isEmpty){
                    return "Insira seu salario em reais";
                  }else if(double.parse(value) > 10000000000000000) {
                    return "Informe um salario menor que 10000000000000000 reais";
                  }else if(double.parse(value) < 0){
                    return "Informe um número positivo!";
                  }
                },
              ),
              DropdownButton(
                onChanged: (value){
                  valorSelecionado = value.toString();
                },
                items: [
                  DropdownMenuItem(child: Text("(1) -- Possuo até dois filhos (na escola e vacinados)"), value: '2',),
                  DropdownMenuItem(child: Text("(2) -- Possuo mais de três filhos (na escola e vacinados)"), value: '3', ),
                  DropdownMenuItem(child: Text("(3) -- Possuo até dois filhos (na escola e vacinados) e sou mãe solteira."), value: '4',),
                  DropdownMenuItem(child: Text("(4) -- Possuo mais de três filhos (na escola e vacinados) e sou mãe soleira."), value: '5', ),
                  DropdownMenuItem(child: Text("(5) -- Possuo até dois filhos"), value: '6',),
                  DropdownMenuItem(child: Text("(6) -- Possuo mais de três filhos"), value: '7', ),
                  DropdownMenuItem(child: Text("(7) -- Possuo até dois filhos e sou mãe solteira."), value: '8',),
                  DropdownMenuItem(child: Text("(8) -- Possuo mais de três filhos e sou mãe soleira."), value: '9', ),

                ],
                iconEnabledColor: Colors.brown,
                isExpanded: true,

              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate() )
                        _calculate();
                    },
                    child: Text("Calcular",style: TextStyle(color: Colors.white, fontSize: 25.0),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),
              Text(
                "$_infoText", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}