import 'package:diyo/gen/assets.gen.dart';
import 'package:diyo/helpers/navigation_helper.dart';
import 'package:diyo/modules/home/view/home_page.dart';
import 'package:diyo/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController pinEditingController = TextEditingController();
  String enteredPin = '';

  void _addToPin(String value) {
    setState(() {
      enteredPin += value;
      pinEditingController.text = enteredPin;
    });
  }

  void _removeLastFromPin() {
    setState(() {
      if (enteredPin.isNotEmpty) {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
        pinEditingController.text = enteredPin;
      }
    });
  }

  void _validatePin() {
    if (enteredPin == '1234') {
      GetIt.I<NavigationHelper>().goToHome();
    }
  }

  @override
  void dispose() {
    pinEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.logo.image(),
            const SizedBox(height: 40),
            Text('Enter PIN',style: captionSemiBold(),),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: PinCodeTextField(
                onCompleted: (value) async {
                  _validatePin();
                },
                controller: pinEditingController,
                obscureText: true,
                obscuringWidget: const Icon(Icons.circle, size: 10),
                appContext: context,
                length: 4,
                pinTheme: PinTheme(
                  fieldWidth: 20,
                  shape: PinCodeFieldShape.circle,
                  inactiveColor: Colors.black,
                  activeColor: Colors.black,
                  disabledColor: Colors.black,
                  activeFillColor: Colors.black,
                  selectedColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberButton(
                  number: '1',
                  onPressed: () => _addToPin('1'),
                ),
                NumberButton(
                  number: '2',
                  onPressed: () => _addToPin('2'),
                ),
                NumberButton(
                  number: '3',
                  onPressed: () => _addToPin('3'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberButton(
                  number: '4',
                  onPressed: () => _addToPin('4'),
                ),
                NumberButton(
                  number: '5',
                  onPressed: () => _addToPin('5'),
                ),
                NumberButton(
                  number: '6',
                  onPressed: () => _addToPin('6'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberButton(
                  number: '7',
                  onPressed: () => _addToPin('7'),
                ),
                NumberButton(
                  number: '8',
                  onPressed: () => _addToPin('8'),
                ),
                NumberButton(
                  number: '9',
                  onPressed: () => _addToPin('9'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IconButton(
                    icon: Text(''),
                    onPressed: null,
                  ),
                  NumberButton(
                    number: '0',
                    onPressed: () => _addToPin('0'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.backspace),
                    onPressed: _removeLastFromPin,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.number,
    required this.onPressed,
  });

  final String number;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: IconButton(
        onPressed: onPressed,
        icon: SizedBox(
          child: Text(
            number,
            style: heading4Bold(),
          ),
        ),
      ),
    );
  }
}
