import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<StatusBloc>(context).add(
      const GetStatusEvent(),
    );
    BlocProvider.of<TestBloc>(context).add(
      const GetTestEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<SliderBloc, SliderState>(
        builder: (sliderContext, sliderState) =>
            BlocBuilder<StatusBloc, StatusState>(
          builder: (statusContext, statusState) =>
              BlocBuilder<TestBloc, TestState>(
            builder: (testContext, testState) => Scaffold(
              backgroundColor: baseColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.bars,
                            ),
                            onPressed: () {},
                            color: accentColor,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  alert,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  livingRoom,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(
                                      0.1,
                                    ),
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.bars,
                            ),
                            onPressed: () {},
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 64.0,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 200.0,
                            width: 200.0,
                            child: CircularProgressIndicator(
                              value: testState is GotTestState
                                  ? (testState.test.sliderValue.toDouble() /
                                          255)
                                      .toDouble()
                                  : nil.toDouble(),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                statusState is OnState
                                    ? accentColor
                                    : Colors.white.withOpacity(
                                        0.1,
                                      ),
                              ),
                              strokeWidth: 40.0,
                              backgroundColor: weakerBaseColor.withOpacity(
                                statusState is OnState ? 0.3 : 0.1,
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${testState is GotTestState ? testState.test.sliderValue : nil}',
                                  style: TextStyle(
                                    color: statusState is OnState
                                        ? Colors.white
                                        : Colors.white.withOpacity(
                                            0.1,
                                          ),
                                    fontSize: 70.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      FontAwesomeIcons.sliders,
                                      color: accentColor,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      slider,
                                      style: TextStyle(
                                        color: weakerBaseColor,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 64.0,
                      ),
                      Slider(
                        value: 50,
                        min: 0,
                        max: 255,
                        label: '5',
                        activeColor: statusState is OnState
                            ? accentColor
                            : Colors.white.withOpacity(
                                0.1,
                              ),
                        inactiveColor: Colors.white.withOpacity(
                          0.1,
                        ),
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 24.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(
                              0.1,
                            ),
                          ),
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.ghost,
                                      color: statusState is OnState
                                          ? accentColor
                                          : accentColor.withOpacity(
                                              0.3,
                                            ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${testState is GotTestState ? testState.test.floatValue : nil}',
                                          style: TextStyle(
                                            color: statusState is OnState
                                                ? Colors.white
                                                : Colors.white.withOpacity(
                                                    0.1,
                                                  ),
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Text(
                                          float,
                                          style: TextStyle(
                                            color: weakerBaseColor,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.white.withOpacity(
                                  0.1,
                                ),
                                width: 1,
                                thickness: 1,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.ship,
                                      color: statusState is OnState
                                          ? accentColor
                                          : accentColor.withOpacity(
                                              0.3,
                                            ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${testState is GotTestState ? testState.test.intValue : nil}',
                                          style: TextStyle(
                                            color: statusState is OnState
                                                ? Colors.white
                                                : Colors.white.withOpacity(
                                                    0.1,
                                                  ),
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Text(
                                          int,
                                          style: TextStyle(
                                            color: weakerBaseColor,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80.0,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            CircleBorder(
                              side: BorderSide(
                                color: Colors.white.withOpacity(
                                  0.1,
                                ),
                              ),
                            ),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(
                              24.0,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            baseColor.withOpacity(
                              0.1,
                            ),
                          ),
                        ),
                        onPressed: testState is GotTestState
                            ? () {
                                statusContext.read<StatusBloc>().add(
                                      WriteStatusEvent(
                                        status: testState.test.statusValue,
                                      ),
                                    );
                              }
                            : null,
                        child: Icon(
                          FontAwesomeIcons.powerOff,
                          color: statusState is OnState
                              ? accentColor
                              : Colors.white.withOpacity(
                                  0.1,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
