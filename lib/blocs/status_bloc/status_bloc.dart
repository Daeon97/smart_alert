import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/repositories.dart';

part 'status_event.dart';

part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc({
    required DatabaseOps databaseOps,
  }) : super(
          const StatusInitialState(),
        ) {
    on<GetStatusEvent>(
      (event, emit) async {
        emit(
          const GettingStatusState(),
        );
        databaseOps.status.listen(
          (databaseEvent) {
            databaseOps.readStatus(
              databaseEvent.snapshot,
            )
                ? add(
                    const OnEvent(),
                  )
                : add(
                    const OffEvent(),
                  );
          },
        );
      },
    );
    on<WriteStatusEvent>(
      (event, emit) async {
        await databaseOps.writeStatus(
          event.status,
        );
      },
    );
    on<OnEvent>(
      (event, emit) async {
        emit(
          const OnState(),
        );
      },
    );
    on<OffEvent>(
      (event, emit) async {
        emit(
          const OffState(),
        );
      },
    );
  }
}
