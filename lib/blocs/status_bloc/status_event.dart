part of 'status_bloc.dart';

abstract class StatusEvent extends Equatable {
  const StatusEvent();

  @override
  List<Object> get props => [];
}

class GetStatusEvent extends StatusEvent {
  const GetStatusEvent();

  @override
  List<Object> get props => [];
}

class OnEvent extends StatusEvent {
  const OnEvent();

  @override
  List<Object> get props => [];
}

class OffEvent extends StatusEvent {
  const OffEvent();

  @override
  List<Object> get props => [];
}

class WriteStatusEvent extends StatusEvent {
  final num status;

  const WriteStatusEvent({
    required this.status,
  });

  @override
  List<Object> get props => [
        status,
      ];
}
