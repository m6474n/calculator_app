import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  var history = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          history.toString(),
                          style: const TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 221, 221, 221)),
                        ),
                        Text(
                          userInput.toString(),
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: "AC",
                          onPress: () {
                            userInput = '';
                            answer = '';
                            history = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "+/-",
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "%",
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "/",
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "7",
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "8",
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "9",
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "x",
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "4",
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "5",
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "6",
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "-",
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "1",
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "2",
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "3",
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "+",
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "0",
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: ".",
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                        MyButton(
                          title: "DEL",
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                        MyButton(
                          title: "=",
                          onPress: () {
                            equalPress();
                            history = userInput;
                            userInput = answer;
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
