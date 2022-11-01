import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/repositories.dart';
import '../../models/models.dart';

part 'test_event.dart';

part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc({
    required DatabaseOps databaseOps,
  }) : super(
          const TestInitialState(),
        ) {
    on<GetTestEvent>(
      (event, emit) async {
        emit(
          const GettingTestState(),
        );
        databaseOps.testData.listen(
          (databaseEvent) {
            final test = Test.fromDataSnapshot(
              databaseEvent.snapshot,
            );
            add(
              GotTestEvent(
                test: test,
              ),
            );
          },
        );
      },
    );
    on<GotTestEvent>(
      (event, emit) {
        emit(
          GotTestState(
            test: event.test,
          ),
        );
      },
    );
  }
}
