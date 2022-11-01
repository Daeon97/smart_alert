part of 'status_bloc.dart';

abstract class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object> get props => [];
}

class StatusInitialState extends StatusState {
  const StatusInitialState();

  @override
  List<Object> get props => [];
}

class GettingStatusState extends StatusState {
  const GettingStatusState();

  @override
  List<Object> get props => [];
}

class OnState extends StatusState {
  const OnState();

  @override
  List<Object> get props => [];
}

class OffState extends StatusState {
  const OffState();

  @override
  List<Object> get props => [];
}
