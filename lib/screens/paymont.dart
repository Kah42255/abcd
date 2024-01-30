import 'package:flutter/material.dart';
import 'package:ihateu/wig/custom.dart';
import 'package:ihateu/commme/comme.dart';

class Paymont extends StatefulWidget {
  const Paymont({Key? key}) : super(key: key);

  @override
  State<Paymont> createState() => _PaymontState();
}

class _PaymontState extends State<Paymont> {
  final List<String> _selectedMethods = []; // Selected payment methods
  final TextEditingController _infoController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _showInputDialog(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Your Information',style: Common().mediumTheme,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _infoController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Enter your $action',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _amountController,
                onChanged: (value) {
                  setState(() {});
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter amount to pay',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic for handling user input
                String info = _infoController.text;
                String amount = _amountController.text;
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Submitted: $info, Amount: $amount'),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> paymentMethods = [
      'Credit Card',
      'Debit Card',
      'PayPal',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE8ECF4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Payment Method',
              style: Common().titelTheme
,
            ),
            const SizedBox(height: 20),
            Column(
              children: paymentMethods
                  .map((method) => PaymentMethodCard(
                        method: method,
                        selected: _selectedMethods.contains(method),
                        onTap: () {
                          setState(() {
                            if (_selectedMethods.contains(method)) {
                              _selectedMethods.remove(method);
                            } else {
                              _selectedMethods.add(method);
                            }
                          });
                        },
                        onArrowTap: () {
                          _showInputDialog(context, method);
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              function: () {
                // Implement logic for handling the selected payment methods
                String selectedMethodsText =
                    _selectedMethods.isNotEmpty ? _selectedMethods.join(", ") : "None";
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected Payment Methods: $selectedMethodsText'),
                  ),
                );
              },
              message: 'Submit',
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final String method;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onArrowTap;

  const PaymentMethodCard({
    Key? key,
    required this.method,
    required this.selected,
    required this.onTap,
    required this.onArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: selected,
                    onChanged: (bool? value) {
                      onTap();
                    },
                  ),
                  Text(
                    method,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onArrowTap,
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

