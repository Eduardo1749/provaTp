void main() {
   runApp(MaterialApp(
       home: Home(), //stateful widget para podermos interagir
       ));
   }

    class _HomeState extends State<Home> {
   @override
    Widget build(BuildContext context) {
      return Scaffold (
          appBar: AppBar(
              title : Text("Calculadora de IMC"),
           centerTitle : true ,
           backgroundColor: Colors .green,
          actions : <Widget>[
       IconButton(icon: Icon(Icons . refresh ),

     onPressed: () {}),

     ],
            appBar: AppBar(
            backgroungColor: Colors .white, // cor do corpo do aplicativo
            body: Column(
              crossAxisAlignment: CrossAxisAlignment. stretch , // para tentar preencher toda a largura
              hildren : <Widget>[
                Icon(Icons .person_outline, size : 120.0, color : Colors .green,) ,
              TextField (keyboardType: TextInputType.number,
                   decoration : InputDecoration(
                   labelText : "Peso (kg)",
                   labelStyle : TextStyle ( color :
                  Colors .green),

               ),
          textAlign : TextAlign. center ,
           style : TextStyle ( color : Colors .green,

          fontSize : 25.0)
       ), //campo de texto para numeros

   return Container() ; //No lugar de Container() vamos comecar a criar nossa interface
   }
   }
