import 'package:flutter/material.dart';

/// Busca pelas categorias, nome, authores, etc (Mesmas tabs, mas procura por author e musica)

class FinderScreen extends StatefulWidget {
  const FinderScreen({Key? key}) : super(key: key);

  @override
  _FinderScreenState createState() => _FinderScreenState();
}

class _FinderScreenState extends State<FinderScreen>
    with TickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  late List<String> _voiceList;

  late TabController tcontroller;
  @override
  void initState() {
    _voiceList = voiceList.reversed.toList();
    tcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(hintText: 'Pesquisar'),
          onChanged: (_) {
            setState(() {
              _voiceList.removeLast();
            });
          },
        ),
        bottom: TabBar(controller: tcontroller, tabs: const [
          Tab(
            text: 'Beat',
          ),
          Tab(
            text: 'Voz',
          ),
          Tab(
            text: 'Letra',
          )
        ]),
        actions: [
          IconButton(
              onPressed: () {
                //TODO: Quando toca para pesquisar ou nao...
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                //TODO: Abrir mais filtros (Por categoria, tags etc,)
              },
              icon: const Icon(
                Icons.menu,
              ))
        ],
      ),
      body: ListView(
        children: _voiceList
            .map<Widget>((e) => ListTile(
                  title: Text(e),
                ))
            .toList()
          ..insert(
            0,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Chip(label: Text('Beat')),
                Chip(label: Text('Autor')),
                Chip(label: Text('Popular')),
                //TODO: Quando adicionar a categoria, jogar nessa tag tambem (O cara pesquisa por sertanejo, vai cair aqui se na categoria tiver adicionado sertanejo, pois vai ser criado uma tag com a categoria, pra dar mais motivo do cara usar o assistente (Mas posso comecar primeiro farmando categorias que nao conheco simplesmente deixando os cara add tag))
                Chip(label: Text('Tags')),
              ],
            ),
          ),
      ),
    );
  }
}

const List<String> voiceList = [
  'Verão - Prima Vera',
  'Inverno - Prima Vera',
  'Primavera - Prima Vera',
  'Outono - Prima Vera',
  'Verão - Prima Vera',
  'Inverno - Prima Vera',
  'Primavera - Prima Vera',
  'Outono - Prima Vera',
  'Verão - Prima Vera',
  'Inverno - Prima Vera',
  'Primavera - Prima Vera',
  'Outono - Prima Vera',
  'Verão - Prima Vera',
  'Inverno - Prima Vera',
  'Primavera - Prima Vera',
  'Outono - Prima Vera',
  'Verão - Prima Vera',
  'Inverno - Prima Vera',
  'Primavera - Prima Vera',
  'Outono - Prima Vera',
];
