import 'dart:async';
import 'dart:math';
import 'dart:async' as async;
import 'package:flutter/material.dart';
import 'global.dart';

Stopwatch stopWatch = Stopwatch();

class timerPage extends StatefulWidget {
  const timerPage({super.key});

  @override
  State<timerPage> createState() => _timerPageState();
}

class _timerPageState extends State<timerPage> {
  late Timer timer;

  void startTimer() {
    timer = async.Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          if (counter % 60 == 0) {
            minute--;
          }

          if (minute % 60 == 59) {
            if (counter % 60 == 0) {
              hour--;
            }
          }
          counter--;
        });
      } else {
        _isStart = false;
        timer.cancel();
      }
    });
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
                        'Timer',
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
                    //todo --------------------------> Circle
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: clockSize * 0.1),
                                child: Text(
                                  '${(hour % 24).toString().padLeft(2, '0')} : ${(minute % 60).toString().padLeft(2, '0')} : ${(counter % 60).toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: clockSize * 0.13),
                                ),
                              ),
                              Text(
                                'Timer',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: clockSize * 0.07),
                              ),
                            ],
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
                        Container(
                          margin: EdgeInsets.all(clockSize * 0.052),
                          height: clockSize,
                          width: clockSize,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            value: (divide == 0)
                                ? 0
                                : (counter.toDouble() / divide),
                            strokeWidth: clockSize * 0.022,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                // todo---------------------------------> +,- Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!_isTimerStart) {
                          setState(() {
                            counter = counter + 60;
                            minute = minute + 1;
                            if (minute % 60 == 0) {
                              hour = hour + 1;
                            }
                            divide = counter.toDouble();
                          });
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: height * 0.07,
                        width: width * 0.17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: bgColor,
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(-2, -2),
                            ),
                            BoxShadow(
                              color: Colors.grey.shade800,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!_isTimerStart) {
                          if (counter > 0) {
                            setState(() {
                              counter = counter - 60;
                              minute = minute - 1;
                              if (hour >= 1) {
                                hour--;
                              }
                              divide = counter.toDouble();
                            });
                          }
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: height * 0.07,
                        width: width * 0.17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: bgColor,
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(-2, -2),
                            ),
                            BoxShadow(
                              color: Colors.grey.shade800,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.09,
                ),
                //todo ---------------------------------> Start Button
                (_isStart)
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    hour = minute = counter = 0;
                                    _isStart = _isPause = _isTimerStart = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: height * 0.06,
                                  width: width * 0.6,
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
                                    'Cancel',
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
                                    _isPause = !_isPause;
                                    if (_isPause) {
                                      timer.cancel();
                                    } else {
                                      startTimer();
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
                                    (_isPause) ? 'Resume' : 'Pause',
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
                          setState(() {
                            if (counter != 0) {
                              _isStart = true;
                              startTimer();
                              _isTimerStart = true;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: height * 0.06,
                          width: width * 0.6,
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
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/');
                      },
                      child: bottomButton(Icons.schedule_outlined, 1, 3),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/StopWatch');
                      },
                      child: bottomButton(Icons.timer_outlined, 2, 3),
                    ),
                    bottomButton(Icons.alarm_outlined, 3, 3),
                    GestureDetector(
                      onTap: () {},
                      child: bottomButton(Icons.more_time_outlined, 4, 3),
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

double divide = 0;
int round = 0, counter = 0, minute = 0, hour = 0;
bool _isStart = false, _isPause = false, _isTimerStart = false;
