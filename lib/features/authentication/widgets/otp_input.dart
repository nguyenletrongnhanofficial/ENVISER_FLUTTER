// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';

// class OtpInputField extends StatefulWidget {
//   const OtpInputField({super.key});

//   @override
//   State<OtpInputField> createState() => _OtpInputFieldState();
// }

// class _OtpInputFieldState extends State<OtpInputField> {
//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(30, 60, 87, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: const Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );
//     return Pinput(
//       defaultPinTheme: defaultPinTheme,
//       focusedPinTheme: focusedPinTheme,
//       submittedPinTheme: submittedPinTheme,
//       validator: (s) {
//         return s == '2222' ? null : 'Pin is incorrect';
//       },
//       pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//       showCursor: true,
//       onCompleted: (pin) => print(pin),
//     );
//   }
// }
