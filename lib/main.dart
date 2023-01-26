// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Peso (pegar valor)
TextEditingController pesoController = TextEditingController();
// Altura (pegar valor)
TextEditingController alturaController = TextEditingController();
// IMC inicia em 0
double imcInit = 0;

class _MyHomePageState extends State<MyHomePage> {
  void _calculoIMC() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / (altura * altura);
      imcInit = imc;
      /*
    if (imc < 18.6) {
      _info = 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 18.6 && imc < 24.9) {
      _info = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 24.9 && imc < 29.9) {
      _info = 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 29.9 && imc < 34.9) {
      _info = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 34.9 && imc < 39.9) {
      _info = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 40) {
      _info = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
    }
    */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Color.fromARGB(255, 246, 255, 241),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: text_1(),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: textformfield_1(),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: textformfield_2(),
              ),
              const Text(
                'Seu IMC é:',
                style: TextStyle(
                  height: 3,
                  fontSize: 20,
                ),
              ),
              Text(
                imcInit.toStringAsPrecision(4),
                style: TextStyle(
                  fontSize: 60,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculoIMC,
        tooltip: 'Calculate',
        child: const Icon(Icons.calculate),
      ),
    );
  }
}

class text_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Insira Seus Dados',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        height: 0,
      ),
    );
  }
}

class textformfield_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Peso:',
          hintText: 'Digite o valor do peso (Ex: 80.5kg)',
        ),
        controller: pesoController,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class textformfield_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Altura:',
          hintText: 'Digite sua altura (Ex: 1.70cm)',
        ),
        controller: alturaController,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}
