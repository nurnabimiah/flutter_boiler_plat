//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_basic/providers/theme_provider/theme_provider.dart';
// import 'package:flutter_basic/widgets/drawer/my_drawer.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
//
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   double price = 10.0; // Example price
//   String productId = 'product_123';
//
//   // This function will open the Stripe card form when called
//   Future<void> openStripeCardForm() async {
//     try {
//       // Step 1: Create a payment method by showing the card form
//       PaymentMethod paymentMethod = await StripePayment.paymentRequestWithCardForm(
//         CardFormPaymentRequest(),
//       );
//
//       // Show a success message if the card details were entered successfully
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Card entered successfully: ${paymentMethod.id}'),
//       ));
//
//       // You can proceed with further actions like sending payment info to the backend
//     } catch (error) {
//       // Handle errors if the user cancels or the card form fails
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to enter card: $error'),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
//             ? Theme.of(context).cardColor
//             : Theme.of(context).primaryColor,
//         title: const Text(
//           'Basic Flutter',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       drawer: const MyDrawer(), // Assuming you have a custom drawer
//
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             openStripeCardForm(); // Open Stripe card form when button is clicked
//           },
//           child: Text('Order Now - Pay \$${price.toStringAsFixed(2)}'),
//           style: ElevatedButton.styleFrom(
//             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//             textStyle: const TextStyle(fontSize: 18),
//             backgroundColor: Colors.green, // Button color
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//



import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/const/stripe_doc/stripe_const_file.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double price = 10.0; // Example price
  String productId = 'product_123';

  // Function to simulate payment without a real server
  Future<void> processPayment() async {
    try {
      // Step 1: Simulate receiving a payment intent client secret
      String clientSecret =   StripeConstFile.secretKey;

      // Step 2: Display the card input form using the dummy client secret
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Demo Business',
        ),
      );

      // Step 3: Present the payment sheet (opens Stripe card input form)
      await Stripe.instance.presentPaymentSheet();

      // Show a success message on completion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment successful!')),
      );
    } catch (error) {
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Payment failed: $error');
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment failed: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            processPayment(); // Simulates payment process
          },
          child: Text('Order Now - Pay \$${price.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
