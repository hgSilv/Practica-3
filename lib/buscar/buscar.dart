import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/buscar/bloc/buscar_bloc.dart';
import 'package:noticias/models/noticia.dart';
import 'package:noticias/noticias/item_noticia.dart';

class Buscar extends StatefulWidget {
  Buscar({Key key}) : super(key: key);

  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  List<Noticia> _listOfBusiness;
  List<Noticia> _listOfSports;
  List<Noticia> _filteredListOfWords;
  var _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredListOfWords = List();
    _listOfBusiness = List();
    _listOfSports = List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Busqueda"),
        ),
        body: BlocProvider(
          create: (context) => BuscarBloc()..add(GetNewsEvent()),
          child: BlocConsumer<BuscarBloc, BuscarState>(
              builder: (context, state) {
                if (state is BuscarSuccessState) {
                  _listOfBusiness = state.noticiasBusinessList;
                  _listOfSports = state.noticiasSportList;
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _searchTextController,
                          decoration: InputDecoration(
                            labelText: "Buscar palabra",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onChanged: (value) {
                            _filterByWord();
                          },
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView.separated(
                            itemCount: _filteredListOfWords.length,
                            separatorBuilder: (context, index) => Divider(),
                            itemBuilder: (context, index) => ItemNoticia(
                                noticia: _filteredListOfWords[index]),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Text('No se encontro nada uwu');
                }
              },
              listener: (context, state) {}),
        ));
  }

  _filterByWord() {
    setState(() {
      List<Noticia> _listOfNoticas = _listOfBusiness + _listOfSports;
      if (_searchTextController.text == "") {
        _filteredListOfWords = List();
        return;
      }
      _filteredListOfWords = _listOfNoticas.where((noticia) {
        return noticia.title
            .toLowerCase()
            .contains(_searchTextController.text.toLowerCase());
      }).toList();
    });
  }
}
