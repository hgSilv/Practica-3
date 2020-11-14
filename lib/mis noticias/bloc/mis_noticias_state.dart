part of 'mis_noticias_bloc.dart';

abstract class MisNoticiasState extends Equatable {
  const MisNoticiasState();

  @override
  List<Object> get props => [];
}

class MisNoticiasInitial extends MisNoticiasState {}

class NoticiasDescargadasState extends MisNoticiasState {
  final List<Noticia> noticias;

  NoticiasDescargadasState({@required this.noticias});

  @override
  List<Object> get props => [noticias];
}

class NoticiasCreadaState extends MisNoticiasState {}

class NoticiasErrorState extends MisNoticiasState {
  final String errorMessage;

  NoticiasErrorState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class ImagenCargadaState extends MisNoticiasState {
  final File imagen;

  ImagenCargadaState({@required this.imagen});

  @override
  List<Object> get props => [imagen];
}
