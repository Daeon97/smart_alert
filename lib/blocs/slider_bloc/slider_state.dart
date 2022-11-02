part of 'slider_bloc.dart';

abstract class SliderState extends Equatable {
  const SliderState();

  @override
  List<Object> get props => [];
}

class SliderInitialState extends SliderState {
  const SliderInitialState();

  @override
  List<Object> get props => [];
}

class GettingSliderState extends SliderState {
  const GettingSliderState();

  @override
  List<Object> get props => [];
}

class GotSliderState extends SliderState {
  final num sliderValue;

  const GotSliderState({
    required this.sliderValue,
  });

  @override
  List<Object> get props => [
        sliderValue,
      ];
}
