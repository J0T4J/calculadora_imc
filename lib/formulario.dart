import 'package:calculadora_imc/resultado.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  int _peso = 0;
  int _altura = 0;
  String _imcStr = '';
  String _imcMsg = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Peso'),
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontSize: 20,
            ),
            onChanged: (peso) {
              setState(() {
                try {
                  _peso = int.parse(peso);
                } catch (e) {
                  _peso = 0;
                }
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Altura (cm)'),
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontSize: 20,
            ),
            onChanged: (altura) {
              setState(() {
                try {
                  _altura = int.parse(altura);
                } catch (e) {
                  _altura = 1;
                }
              });
            },
          ),
        ),
        Padding( //Botão de Calcular IMC
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: ElevatedButton(
            child: const Text('Calcular IMC'),
            onPressed: () {
              final alturaMetro = _altura / 100;
              var imc = _peso / (alturaMetro * alturaMetro);
              var imcStrTemp = '';
              if (imc < 18.5) {
                imcStrTemp = 'Abaixo do Peso';
              } 
              else if ((imc >= 18.5) && (imc <= 24.9)) {
                imcStrTemp = 'Peso Normal';
              }
              else if ((imc >= 25) && (imc <= 29.9)) {
                imcStrTemp = 'Sobre Peso';
              }
              else if ((imc >= 30) && (imc <= 34.9)) {
                imcStrTemp = 'Obesidade Grau I';
              }
              else if ((imc >= 35) && (imc <= 39.9)) {
                imcStrTemp = 'Obesidade Grau II';
              }
              else{
                imcStrTemp = 'Obesidade Grau III';
              }
              setState(() {
                _imcStr = '${imc.toStringAsFixed(1)}';
                _imcMsg = imcStrTemp;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) => Resultado( imcStr : _imcStr, imcMsg : _imcMsg )));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green.shade900,
              padding:
                  const EdgeInsets.symmetric(horizontal: 107, vertical: 15),
              textStyle: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
