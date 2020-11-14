part of 'buscar_bloc.dart';

abstract class BuscarEvent extends Equatable {
  const BuscarEvent();

  @override
  List<Object> get props => [];
}

class GetNewsEvent extends BuscarEvent {}
