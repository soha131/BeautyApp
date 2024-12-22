import 'package:beautyapp/models/makeup_model.dart';
import 'package:equatable/equatable.dart';

abstract class MakeupState extends Equatable {
  const MakeupState();

  @override
  List<Object> get props => [];
}

class MakeupInitial extends MakeupState {}

class MakeupLoading extends MakeupState {}

class MakeupLoaded extends MakeupState {
  final List<Makeup> makeups;

  const MakeupLoaded(this.makeups);

  @override
  List<Object> get props => [makeups];
}

class MakeupError extends MakeupState {
  final String message;

  const MakeupError(this.message);

  @override
  List<Object> get props => [message];
}
