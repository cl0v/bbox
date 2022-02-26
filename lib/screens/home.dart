import 'package:flutter/material.dart';
import 'create.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateScreen()));
          //TODO: Pegar o index e ir paga a pagina correspondente para adicionar o que ele quer.
        },
      ),
      //TODO: Corrigir a bottom navbar
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Descobrir', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: 'Perfil', icon: Icon(Icons.person)),
          ]),
      appBar: AppBar(
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(child: Text('Beats')),
            Tab(child: Text('Voice')),
            Tab(child: Text('Lyrics')),
            // Tab(child: Text('Productions'),),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          BeatsView(l: beatList),
          BeatsView(l: voiceList),
          // VoicesView(),
          LyricsView(),
        ],
      ),
    );
  }
}

const List<String> beatList = [
  'Verão - Prima Vera',
  'Inverno - Prima Vera',
  'Primavera - Prima Vera',
  'Outono - Prima Vera',
  'Verão',
  'Inverno',
  'Primavera',
  'Outono',
  'Verão',
  'Inverno',
  'Primavera',
  'Outono',
  'Verão',
  'Inverno',
  'Primavera',
  'Outono',
  'Verão',
  'Inverno',
  'Primavera',
  'Outono',
];

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

var isPlaying = beatList.map((e) => false).toList();
var isFavorite = beatList.map((e) => false).toList();

class BeatsView extends StatefulWidget {
  const BeatsView({Key? key, required this.l}) : super(key: key);
  final List l;
  @override
  State<BeatsView> createState() => _BeatsViewState();
}

class _BeatsViewState extends State<BeatsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        widget.l.length,
        (index) {
          return ListTile(
              subtitle: Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red.withOpacity(.4),
                    size: 14,
                  ),
                  Text(
                    '32',
                    style: TextStyle(
                        fontSize: 10, color: Colors.grey.withOpacity(.7)),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Icon(
                    Icons.message,
                    color: Colors.grey.withOpacity(.7),
                    size: 14,
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                        fontSize: 10, color: Colors.grey.withOpacity(.7)),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Icon(
                    Icons.switch_account_rounded,
                    color: Colors.grey.withOpacity(.7),
                    size: 14,
                  ),
                  Text(
                    '120',
                    style: TextStyle(
                        fontSize: 10, color: Colors.grey.withOpacity(.7)),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.grey.withOpacity(.7),
                    size: 14,
                  ),
                  Text(
                    '3',
                    style: TextStyle(
                        fontSize: 10, color: Colors.grey.withOpacity(.7)),
                  ),
                ],
              ),
              title: Text(widget.l[index]),
              leading: IconButton(
                onPressed: () {
                  print(isPlaying[index]);
                  setState(() {
                    isPlaying[index] = !isPlaying[index];
                  });
                },
                icon: Icon(
                  !isPlaying[index]
                      ? Icons.play_circle_outline_rounded
                      : Icons.pause_circle_outline_rounded,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    print(isFavorite[index]);
                    isFavorite[index] = !isFavorite[index];
                  });
                },
                icon: Icon(
                  !isFavorite[index] ? Icons.favorite_border : Icons.favorite,
                  color: isFavorite[index] ? Colors.red : null,
                ),
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(title: widget.l[index]),
                    ),
                  ));
        },
      ),
    );
  }
}

//TODO: Adicionar legenda aos voices (Se o cara quiser);
class VoicesView extends StatelessWidget {
  const VoicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LyricsView extends StatelessWidget {
  const LyricsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
