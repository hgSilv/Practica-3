part of 'noticias_bloc.dart';

abstract class NoticiasState extends Equatable {
  const NoticiasState();

  @override
  List<Object> get props => [];
}

class NoticiasInitial extends NoticiasState {}

class NoticiasSuccessState extends NoticiasState {
  final List<Noticia> noticiasSportList;
  final List<Noticia> noticiasBusinessList;

  NoticiasSuccessState(
      {@required this.noticiasSportList, this.noticiasBusinessList});
  @override
  List<Object> get props => [noticiasSportList, noticiasBusinessList];
}

class NoticiasErrorState extends NoticiasState {
  final String message;

  NoticiasErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
