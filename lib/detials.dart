// import 'package:flutter/material.dart';
//
// import 'home.dart';
// // Import the OrderConfirmationScreen
//
// class DetailsScreen extends StatelessWidget {
//   final int numberOfCane;
//   final String paymentMode;
//   final String area;
//
//   DetailsScreen({
//     required this.numberOfCane,
//     required this.paymentMode,
//     required this.area,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Number of Cane: $numberOfCane', style: TextStyle(fontSize: 18)),
//                     SizedBox(height: 10),
//                     Text('Payment Mode: $paymentMode', style: TextStyle(fontSize: 18)),
//                     SizedBox(height: 10),
//                     Text('Area: $area', style: TextStyle(fontSize: 18)),
//                   ],
//                 ),
//               ),
//             ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomeScreen()),
//                     );
//                   },
//                   child: Text('Edit'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => OrderConfirmationScreen()),
//                     );
//                   },
//                   child: Text('Place Order'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final primary =const Color(0xff696b9e);

  final secondary=const Color(0xfff29a94);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: SizedBox
          (
          child: Stack(
            children: [

              Container(
                padding: EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child:GridView.count(
                  crossAxisCount: 2 ,
                  children: List.generate(4,(index){
                    return Container(
                      child: Card(
                        color: Colors.blue,
                      ),
                    );
                  }),
                )
              ),

            ],
          ),
        ),
      )

    );

  }


}
