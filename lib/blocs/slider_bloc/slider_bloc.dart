import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_alert/blocs/blocs.dart';
import 'package:smart_alert/utils/constants.dart';
import '../../repositories/repositories.dart';

part 'slider_event.dart';

part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc({
    required DatabaseOps databaseOps,
  }) : super(
          const SliderInitialState(),
        ) {
    on<GetSliderEvent>(
      (event, emit) async {
        emit(
          const GettingSliderState(),
        );
        databaseOps.slider.listen(
          (databaseEvent) {
            final sliderValue = databaseOps.readSlider(
              databaseEvent.snapshot,
            );
            add(
              GotSliderEvent(
                sliderValue: sliderValue,
              ),
            );
          },
        );
      },
    );
    on<WriteSliderEvent>(
      (event, emit) async {
        await databaseOps.writeSlider(
          event.sliderValue,
        );
      },
    );
    on<GotSliderEvent>(
      (event, emit) async {
        emit(
          GotSliderState(
            sliderValue: event.sliderValue,
          ),
        );
      },
    );
  }
}
