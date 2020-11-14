import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/mis%20noticias/bloc/mis_noticias_bloc.dart';
import 'package:noticias/noticias/item_noticia.dart';

class MisNoticias extends StatelessWidget {
  MisNoticiasBloc _bloc = MisNoticiasBloc();

  MisNoticias({Key key}) : super(key: key);
  //TODO: mostrar noticias guradadas en firebase
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return _bloc..add(LeerNoticiasEvent());
        },
        child: BlocConsumer<MisNoticiasBloc, MisNoticiasState>(
          listener: (context, state) {
            //TODO: dialogo o snackbar de error
          },
          builder: (context, state) {
            if (state is NoticiasDescargadasState) {
              return Scaffold(
                body: RefreshIndicator(
                  child: ListView.builder(
                    itemCount: state.noticias.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemNoticia(noticia: state.noticias[index]);
                    },
                  ),
                  onRefresh: () async {
                    _bloc..add(LeerNoticiasEvent());
                    return Future.delayed(Duration(seconds: 1));
                  },
                ),
              );
            } else if (state is NoticiasErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Center(
              child: Text('No hay noticias disponibles'),
            );
          },
        ),
      ),
    );
  }
}
