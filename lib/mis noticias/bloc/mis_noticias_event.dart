part of 'mis_noticias_bloc.dart';

abstract class MisNoticiasEvent extends Equatable {
  const MisNoticiasEvent();

  @override
  List<Object> get props => [];
}

class CrearNoticiaEvent extends MisNoticiasEvent {
  final String titulo;
  final String descripcion;
  final String autor;
  final String fuente;

  CrearNoticiaEvent({
    @required this.titulo,
    @required this.descripcion,
    @required this.autor,
    @required this.fuente,
  });

  @override
  List<Object> get props => [titulo, descripcion, autor, fuente];
}

class CargarImagenEvent extends MisNoticiasEvent {
  final bool takePictureFromCamera;

  CargarImagenEvent({@required this.takePictureFromCamera});
  @override
  List<Object> get props => [takePictureFromCamera];
}

class LeerNoticiasEvent extends MisNoticiasEvent {
  @override
  List<Object> get props => [];
}
