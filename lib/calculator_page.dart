import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'widgets/neu_container.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

 
  @override
  // ignore: library_private_types_in_public_api
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  bool darkMode = false;
  String _history = '';
  String _expression = '';

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              darkMode ? darkMode = false : darkMode = true;
                            });
                          },
                          child: _switchMode()),
                      const SizedBox(height: 80),
                      Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                         _history,
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.red),
                      ),
                    ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '=',
                          style: TextStyle(
                              fontSize: 35,
                              color: darkMode ? Colors.green : Colors.grey),
                        ),
                        Text(
                          _expression,
                          style: TextStyle(
                              fontSize: 35,
                              color: darkMode ? Colors.green : Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(
                          onTap: (){
                           setState(() {
                              _history = '';
                              _expression = '';
                            });
                          },
                            title: 'C',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(title: '(',textColor: darkMode ? Colors.white : Colors.black,
                        onTap: (){
                          setState(() => _expression += '(');
                        }),
                        _buttonRounded(title: ')',textColor: darkMode ? Colors.white : Colors.black,
                        onTap: (){
                         setState(() => _expression += ')');
                        }),
                        _buttonRounded(
                            title: '/',
                            textColor: darkMode ? Colors.green : Colors.redAccent,
                            onTap: (){
                           setState(() => _expression += '/');
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '7',textColor: darkMode ? Colors.white : Colors.black,
                        onTap: (){
                          setState(() => _expression += '7');
                        }),
                        _buttonRounded(title: '8',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '8');
                        }),
                        _buttonRounded(title: '9',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '9');
                        }),
                        _buttonRounded(
                            title: '*',
                            textColor: darkMode ? Colors.green : Colors.redAccent,onTap: (){
                          setState(() => _expression += '*');
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '4',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '4');
                        }),
                        _buttonRounded(title: '5',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '5');
                        }),
                        _buttonRounded(title: '6',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '6');
                        }),
                        _buttonRounded(
                            title: '-',
                            textColor: darkMode ? Colors.green : Colors.redAccent,onTap: (){
                          setState(() => _expression += '-');
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '1',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '1');
                        }),
                        _buttonRounded(title: '2',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '2');
                        }),
                        _buttonRounded(title: '3',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '3');
                        }),
                        _buttonRounded(
                            title: '+',
                            textColor: darkMode ? Colors.green : Colors.redAccent,onTap: (){
                          setState(() => _expression += '+');
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '0',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '0');
                        }),
                        _buttonRounded(title: '.',textColor: darkMode ? Colors.white : Colors.black,onTap: (){
                          setState(() => _expression += '.');
                          if (kDebugMode) {
                            print(_expression);
                          }
                        }),
                        _buttonRounded(
                            title: '⟪',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent,onTap: (){
                          setState(() {
                            _expression = _expression.substring(0, _expression.length - 1);
                          });
                        }),
                        _buttonRounded(
                            title: '=',
                            textColor: darkMode ? Colors.green : Colors.redAccent,onTap: (){
                          setState(() {
                            calculateResult(_expression);
                          });
                        })
                      ],
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
    );
  }
  Widget _buttonRounded({
    String title = "",
    double padding = 17,
    required Function onTap,
    IconData icon = Icons.block,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NeuContainer(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(padding),
        onTap: onTap,
        child: SizedBox(
          width: padding * 2,
          height: padding * 2,
          child: Center(
            // ignore: unnecessary_null_comparison
            child: title != null
                ? Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                    ),
                  )
                : Icon(
                    icon,
                    color: iconColor,
                    size: 30,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return NeuContainer(
      darkMode: darkMode,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      onTap: (){},
      child: SizedBox(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: darkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: darkMode ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  void calculateResult(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }
}
