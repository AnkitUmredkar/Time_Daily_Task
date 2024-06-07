import 'dart:math';
import 'dart:async' as async;
import 'package:flutter/material.dart';
import 'package:practice_of_lecture/utils/global.dart';
import 'global.dart';

Stopwatch stopWatch = Stopwatch();
ScrollController scrollController = ScrollController();
bool isRunning = true;

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  void handleStartStop() {
    if (stopWatch.isRunning) {
      stopWatch.stop();
    } else {
      stopWatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopWatch.elapsed.inMilliseconds;
    String milliSeconds = (milli % 1000).toString().padLeft(3, '0');
    String seconds = ((milli / 1000) % 60).toInt().toString().padLeft(2, '0');
    round = int.parse(seconds);
    String minutes = ((milli / 1000) / 60).toInt().toString().padLeft(2, '0');
    String houre =
        (((milli / 1000) / 60) / 60).toInt().toString().padLeft(2, '0');
    lapTime = '$houre : $minutes : $seconds';
    return '$houre : $minutes : $seconds : $milliSeconds';
  }

  @override
  void initState() {
    super.initState();
    async.Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double clockSize = min(width * 0.82, height * 0.42);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'StopWatch',
                        style: TextStyle(
                            fontSize: width * 0.078,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Spacer(),
                      Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF1A1A1A),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade800,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2),
                            ),
                            const BoxShadow(
                              color: Colors.black,
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(-2, -2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.language,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.018),
                Padding(
                  padding: EdgeInsets.all(height * 0.027),
                  child: Container(
                    height: clockSize,
                    width: clockSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF1A1A1A),
                            Color(0xFF121212),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black,
                          blurRadius: 32,
                          spreadRadius: 1,
                          offset: Offset(-20, -10),
                        ),
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.13),
                          blurRadius: 32,
                          spreadRadius: 1,
                          offset: const Offset(30, 20),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            returnFormattedText(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: clockSize * 0.0975),
                          ),
                        ),
                        ...List.generate(
                          60,
                          (index) => Transform.rotate(
                            angle: ((index) * 6 * pi) / 180,
                            child: VerticalDivider(
                              indent: clockSize * 0.04,
                              endIndent: clockSize * 0.935,
                              width: 20,
                              thickness: 3,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: (round * 6 * pi) / 180,
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 6,
                            indent: clockSize * 0.09,
                            endIndent: clockSize * 0.895,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 9),
                  child: Container(
                    height: height * 0.205,
                    width: width,
                    padding: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                            lapList.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        (lapList.length - index)
                                            .toString()
                                            .padLeft(2, '0'),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.051),
                                      ),
                                      Text(
                                        lapList[lapList.length-index-1],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.051),
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                  ),
                ),
                (isStart)
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isPause) {
                                      stopWatch = Stopwatch();
                                      isStart = false;
                                      isPause = false;
                                      lapList.clear();
                                    } else {
                                      lapList.add(lapTime);
                                    }
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: height * 0.06,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: Offset(-3, -3),
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.shade800,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: const Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    (isPause) ? 'Restart' : 'Lap',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.05),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.055),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    handleStartStop();
                                    isPause = !isPause;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: height * 0.06,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: Offset(-3, -3),
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.shade800,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: const Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    (isPause) ? 'Resume' : 'Pause',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.05),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          handleStartStop();
                          isStart = true;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: height * 0.06,
                          width: width * 0.65,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(-3, -3),
                              ),
                              BoxShadow(
                                color: Colors.grey.shade800,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            'Start',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.056),
                          ),
                        ),
                      ),
                SizedBox(height: height * 0.039),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/');
                      },
                      child: bottomButton(Icons.schedule_outlined, 1, 2),
                    ),
                    bottomButton(Icons.timer_outlined, 2, 2),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/Timer');
                      },
                      child: bottomButton(Icons.alarm_outlined, 3, 2),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: bottomButton(Icons.more_time_outlined, 4, 2),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.022)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

int round = 0;
