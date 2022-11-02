part of 'slider_bloc.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class GetSliderEvent extends SliderEvent {
  const GetSliderEvent();

  @override
  List<Object> get props => [];
}

class WriteSliderEvent extends SliderEvent {
  final num sliderValue;

  const WriteSliderEvent({
    required this.sliderValue,
  });

  @override
  List<Object> get props => [
        sliderValue,
      ];
}

class GotSliderEvent extends SliderEvent {
  final num sliderValue;

  const GotSliderEvent({
    required this.sliderValue,
  });

  @override
  List<Object> get props => [
        sliderValue,
      ];
}
