part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class GetTestEvent extends TestEvent {
  const GetTestEvent();

  @override
  List<Object> get props => [];
}

class GotTestEvent extends TestEvent {
  final Test test;

  const GotTestEvent({
    required this.test,
  });

  @override
  List<Object> get props => [
        test,
      ];
}
