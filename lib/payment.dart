import 'package:flutter/material.dart';
import 'package:master_food/detials.dart';

class PaymentPage extends StatefulWidget {
  final int selectedCaneCount;
  final int totalAmount;
  final String selectedSlot;
  final String address;

  PaymentPage({
    required this.selectedCaneCount,
    required this.totalAmount,
    required this.selectedSlot,
    required this.address,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isChecked = false;

  final primary = const Color(0xff696b9e);
  final secondary = const Color(0xfff29a94);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.lightBlueAccent.withOpacity(0.2),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return buildList(context, index);
                      },
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        //  color: primary,
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget buildList(
    BuildContext context,
    int index,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 650,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Text('Selected Cane Count: ${widget.selectedCaneCount}',style: TextStyle(

                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28
                ),),
                Text('Total Amount: ${widget.totalAmount}',style: TextStyle(

                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28
                ),),
                Text('Selected Slot: ${widget.selectedSlot}',style: TextStyle(

                    color:Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 28
                ),),
                Text('Address: ${widget.address}'),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text('I accept the terms and conditions'),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isChecked ? confirmButtonPressed : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 16.0),
                    child: Text('Confirm', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ].toList(),
            ),
          ),
        ],
      ),
    );
  }

  void confirmButtonPressed() {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Landing(),
      ),
    );
    // Perform confirmation action
    print('Confirmed');
  }
}
// Center(
// child: SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Card(
// elevation: 50.0,
// margin: EdgeInsets.all(6),
//
// child: Padding(
// padding: const EdgeInsets.all(36.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// child: Column(
// children: [
// Text('Selected Cane Count: ${widget.selectedCaneCount}'),
// Text('Total Amount: ${widget.totalAmount}'),
// Text('Selected Slot: ${widget.selectedSlot}'),
// Text('Address: ${widget.address}'),
// SizedBox(height: 20),
// Row(
// children: [
// Checkbox(
// value: _isChecked,
// onChanged: (bool? value) {
// setState(() {
// _isChecked = value!;
// });
// },
// ),
// Text('I accept the terms and conditions'),
// ],
// ),
// SizedBox(height: 20),
//
// ElevatedButton(
// onPressed: _isChecked ? confirmButtonPressed : null,
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
// child: Text('Confirm', style: TextStyle(fontSize: 18)),
// ),
// ),
// ].toList(),
// ),
// ),
//
// ],
// ),
// ),
// ),
// ),
// ),
