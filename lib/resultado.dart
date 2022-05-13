import 'package:flutter/material.dart';
import 'package:calculadora_imc/formulario.dart';

class Resultado extends StatelessWidget {
  const Resultado({ Key? key, required this.imcStr, this.imcMsg }) : super(key: key);

  final imcStr;
  final imcMsg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora da Saude'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Card( //Cartão do resultado
              color: Colors.green.shade900,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:20, horizontal: 50),
                child: Column(
                  children: [
                    Text(
                      imcStr,
                      style: TextStyle(fontSize: 60, color: Colors.white),
                    ),
                    Text(
                      imcMsg,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child:
              Image.network('assets/tabela_imc.jpeg',),
          )
        ],
      )
    );
  }
}