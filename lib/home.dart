import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            ("Número inválido, digite números maiores que 0 e utilizando (.)");
      });
    } else {
      if (precoAlcool / precoGasolina >= 0.7) {
        setState(() {
          _textoResultado = ("Melhor abastecer com gasolina");
        });
      } else {
        setState(() {
          _textoResultado = ("Melhor abastecer com alcool");
        });
      }
      _limparCampos();
    }
  }
  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Alcool ou Gasolina"), backgroundColor: Colors.blue),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset('assets/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                    'Saiba qual a melhor opção para abastecimento do seu carro',
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Alcool, ex: 1.59"),
                style: TextStyle(fontSize: 20),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina, ex: 1.59"),
                style: TextStyle(fontSize: 20),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    _calcular();
                    FocusScope.of(context).unfocus();
                  },
                  child: Text("Validar"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                  ),
                ),
              ),
              Text(
                _textoResultado,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
