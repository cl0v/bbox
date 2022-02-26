import 'package:flutter/material.dart';

/// Página onde será uplodado um arquivo para voz.
class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: Adicionar recomendação de app bom para gravação para celular. (Diferenciar para ios e android)
    return Scaffold(
      appBar: AppBar(title: Text('BEAT'),),
      bottomNavigationBar: MaterialButton(
        color: Colors.blue,
        child: const SizedBox(
          child: Center(child:  Text('Continuar')),
          height: 72,
          width: double.infinity,
        ),
        onPressed: () {},
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.upload),
              title: Text('Adicionar arquivo'),
              subtitle: Text('Formatos aceitos: mp3, oxl, wav'),
            ),
          ), //ou voice, ou lyric
        ],
      ),
    );
  }
}
