import 'package:flutter/material.dart';
import 'package:noticias/models/noticia.dart';

import 'item_noticia.dart';

class NoticiaNegocios extends StatefulWidget {
  final List<Noticia> noticias;
  NoticiaNegocios({Key key, @required this.noticias}) : super(key: key);

  @override
  _NoticiaNegociosState createState() => _NoticiaNegociosState();
}

class _NoticiaNegociosState extends State<NoticiaNegocios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemNoticia(noticia: widget.noticias[index]);
        },
      ),
    );
  }
}
