import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          //TODO: Na voz, adiciona beat a voz
          const ListTile(
            leading: Icon(Icons.mic),
            title: Text(
              'Cantar nesse beat (Adicionar voz)',
              textAlign: TextAlign.center,
            ),
          ),
          ...const [
            ListTile(
              leading: Icon(Icons.music_note_rounded),
              title: Text(
                'Remixar',
                textAlign: TextAlign.center,
              ),
            ),
            ExpansionTile(
              title: Text(
                'Ler comentários',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Text(
                'Adicionar comentário',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Text(
                'Ver detalhes (Curtidas/Compartilhamentos...',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Text(
                'Compartilhar',
                textAlign: TextAlign.center,
              ),
            ),
          ]
        ]
            .map((e) => Card(
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}
