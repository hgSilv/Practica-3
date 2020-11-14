import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:noticias/models/noticia.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../secrets.dart';

part 'buscar_event.dart';
part 'buscar_state.dart';

//uwu
class BuscarBloc extends Bloc<BuscarEvent, BuscarState> {
  final _sportsLink =
      "https://newsapi.org/v2/top-headlines?country=mx&category=sports&$apiKey";

  final _businessLink =
      "https://newsapi.org/v2/top-headlines?country=mx&category=business&$apiKey";

  BuscarBloc() : super(BuscarInitial());

  @override
  Stream<BuscarState> mapEventToState(
    BuscarEvent event,
  ) async* {
    if (event is GetNewsEvent) {
      //request de noticias
      try {
        List<Noticia> sportsNews = await _requestSportNoticias();
        List<Noticia> businessNews = await _requestBusinessNoticias();

        yield BuscarSuccessState(
          noticiasSportList: sportsNews,
          noticiasBusinessList: businessNews,
        );
      } catch (e) {}
      //deserializar json -> dart

      //mapear resultado a lista de noticias

      //yield lista de noticias al estado uwu

    }
  }

  Future<List<Noticia>> _requestSportNoticias() async {
    Response response = await get(_sportsLink);
    List<Noticia> _noticiasList = List();
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['articles'];
      _noticiasList =
          ((data).map((element) => Noticia.fromJson(element))).toList();
    }
    return _noticiasList;
  }

  Future<List<Noticia>> _requestBusinessNoticias() async {
    Response response = await get(_businessLink);
    List<Noticia> _noticiasList = List();
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['articles'];
      _noticiasList =
          ((data).map((element) => Noticia.fromJson(element))).toList();
    }
    return _noticiasList;
  }
}
