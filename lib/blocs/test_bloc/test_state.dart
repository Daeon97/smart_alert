part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();

  @override
  List<Object> get props => [];
}

class TestInitialState extends TestState {
  const TestInitialState();

  @override
  List<Object> get props => [];
}

class GettingTestState extends TestState {
  const GettingTestState();

  @override
  List<Object> get props => [];
}

class GotTestState extends TestState {
  final Test test;

  const GotTestState({
    required this.test,
  });

  @override
  List<Object> get props => [
        test,
      ];
}
