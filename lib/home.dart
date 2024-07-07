// import 'package:flutter/material.dart';
//
//
// import 'detials.dart'; // Import the DetailsScreen
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int numberOfCane = 0;
//   int appBarCount = 100;
//   String selectedPaymentMode = 'Credit Card';
//   String selectedArea = 'choolaimedu HR 1';
//
//   void _resetValues() {
//     setState(() {
//       numberOfCane = 0;
//       appBarCount = 100;
//       selectedPaymentMode = 'Credit Card';
//       selectedArea = 'choolaimedu HR 1';
//     });
//   }
//   void _confirmOrder() {
//     if (numberOfCane == 0 || selectedArea.isEmpty || selectedPaymentMode.isEmpty) {
//       // Show a snackbar indicating that the user needs to fill all fields
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill all fields and increase cane count.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } else {
//       // Navigate to the details screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DetailsScreen(
//             numberOfCane: numberOfCane,
//             paymentMode: selectedPaymentMode,
//             area: selectedArea,
//           ),
//         ),
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amberAccent,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => Home2()),
//             );// Navigate back to the previous screen
//           },
//         ),
//          actions:[
//
//               Text('Available Stock: $appBarCount', style: TextStyle(fontWeight: FontWeight.bold)),
//             ],
//           ),
//
//
//
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.lightBlueAccent,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 6,
//                 offset: Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView(
//                   children: [
//                     _buildTile1(),
//                     SizedBox(height: 10),
//                     _buildTile2(),
//                     SizedBox(height: 10),
//                     _buildTile3(),
//                     SizedBox(height: 10),
//                     _buildTile4(),
//                     // Add more tiles as needed
//                   ],
//                 ),
//               ),
//               _buildButtons(), // Add the buttons at the bottom
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTile1() {
//     return ListTile(
//       title: Text('Availability', style: TextStyle(fontWeight: FontWeight.bold)),
//       subtitle: Text('Available'),
//     );
//   }
//
//   Widget _buildTile2() {
//     return ListTile(
//       title: Text('Number of Cane', style: TextStyle(fontWeight: FontWeight.bold)),
//       subtitle: Row(
//         children: [
//           IconButton(
//             icon: Icon(Icons.remove),
//             onPressed: () {
//               setState(() {
//                 if (numberOfCane > 0) {
//                   numberOfCane--;
//                   appBarCount++;
//                 }
//               });
//             },
//           ),
//           Text('$numberOfCane', style: TextStyle(fontWeight: FontWeight.bold)),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               setState(() {
//                 numberOfCane++;
//                 appBarCount--;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTile3() {
//     return ListTile(
//       title: Text('Select Payment Mode', style: TextStyle(fontWeight: FontWeight.bold)),
//       subtitle: DropdownButton<String>(
//         value: selectedPaymentMode,
//         onChanged: (String? newValue) {
//           setState(() {
//             selectedPaymentMode = newValue!;
//           });
//         },
//         items: <String>['Credit Card', 'Debit Card', 'Cash', 'UPI']
//             .map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget _buildTile4() {
//     return ListTile(
//       title: Text('Select Area', style: TextStyle(fontWeight: FontWeight.bold)),
//       subtitle: DropdownButton<String>(
//         value: selectedArea,
//         onChanged: (String? newValue) {
//           setState(() {
//             selectedArea = newValue!;
//           });
//         },
//         items: <String>['choolaimedu HR 1', 'Bajanai KoilStreet 2', 'Sakthi Nagar 3', 'Gill Nagar 4']
//             .map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget _buildButtons() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ElevatedButton(
//             onPressed: _confirmOrder,
//             //     () {
//             //   Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //       builder: (context) => DetailsScreen(
//             //         numberOfCane: numberOfCane,
//             //         paymentMode: selectedPaymentMode,
//             //         area: selectedArea,
//             //       ),
//             //     ),
//             //   );
//             // },
//             child: Text('Confirm'),
//           ),
//           ElevatedButton(
//             onPressed: _resetValues,
//             child: Text('Cancel'),
//           ),
//         ],
//       ),
//     );
//   }
// }
