import 'package:flutter/material.dart';
import 'package:master_food/payment.dart';

class CartPage extends StatefulWidget {
  final int selectedCaneCount;
  final int totalAmount;

  CartPage({
    required this.selectedCaneCount,
    required this.totalAmount,
  });

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String _selectedSlot = '6 Mor to 8 Mor'; // Default slot value
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.withOpacity(0.2),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 650,
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Cane Count:',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        ' ${widget.selectedCaneCount}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Total Amount:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 10),
                      Text(
                        ' ${widget.totalAmount}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10),
                      InputDecorator(
                        decoration: InputDecoration(
                          hintText: 'Select Timing',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
                            value: _selectedSlot,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: <String>[
                              '6 Mor to 8 Mor',
                              '8 Mor to 10 Mor',
                              '10 Mor to 12 Mor',
                              '2 Af to 4 Af',
                              '4 Eve to 8 Eve',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedSlot = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _address = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to payment page and pass the details
                        Navigator.push(
                          context,
                          MaterialPageRoute(

                            builder: (context) => PaymentPage(
                              selectedCaneCount: widget.selectedCaneCount,
                              totalAmount: widget.totalAmount,
                              selectedSlot: _selectedSlot,
                              address: _address,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                        child: Text('place', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

