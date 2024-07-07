import 'package:flutter/material.dart';
import 'package:master_food/cart_page.dart';


class Waca_Ui extends StatefulWidget {
  const Waca_Ui({super.key});

  @override
  State<Waca_Ui> createState() => _Waca_UiState();
}

class _Waca_UiState extends State<Waca_Ui> {


final primary =const Color(0xff696b9e);
final secondary=const Color(0xfff29a94);
final List<Map>details=[
  {
    "name":"Wa-Ca",
    "tag":"Quench Your Thirst",
    "bottle ltr":"20 Ltr",
    "logo":"assets/images/ltr_20.png",
    "mrp":"price : Rs-30 "
  }
];
int _itemCount = 0;
final int itemPrice = 30;
int _totalItemValue = 0;
 // Default timing

void _incrementCounter() {
  setState(() {
    _itemCount++;
    _updateTotalItemValue();
  });
}

void _decrementCounter() {
  if (_itemCount > 0) {
    setState(() {
      _itemCount--;
      _updateTotalItemValue();
    });
  }
}
void _updateTotalItemValue() {
  _totalItemValue = _itemCount * itemPrice;
}
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(

        ),
        //     bottomNavigationBar: Container(
        //
        //       child: BottomNavigationBar(
        //         currentIndex: 1,
        //         items: [
        //           BottomNavigationBarItem(
        //               icon: IconButton(
        //                 iconSize:12 ,onPressed: () {
        //
        //           }, icon: Icon(Icons.abc,),),label: "order"),
        //           BottomNavigationBarItem(icon: Icon(Icons.access_alarms,size: 12,),label: "cart"),
        //           BottomNavigationBarItem(icon: Icon(Icons.account_box,size: 12),label: "DashBoard"),
        //         ],),
        //     ),
        // backgroundColor:Colors.lightBlueAccent.withOpacity(0.2),
        body:SingleChildScrollView(
          scrollDirection:Axis.vertical,
          child: SizedBox
            (
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ListView.builder(itemCount:1 ,
                    itemBuilder: (BuildContext context,int index){
                    return buildList(context,index);
                  },
                    ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),

                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );

}

  Widget buildList(BuildContext context, int index,) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,

      ),
      width: double.infinity,
      height: 650,
      margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Text(
                          details[index]['name'],
                style: TextStyle(

                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23
                ),
                          )
                        ],),
              ),
            ],
          ),Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Text(
                  details[index]['tag'],
                  style: TextStyle(

                      color:Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Text(
                  details[index]['mrp'],
                  style: TextStyle(

                      color:Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [


             Container(
               width: 250,
               height: 300,
               margin: EdgeInsets.all(20),
               decoration: BoxDecoration(
                 //borderRadius: BorderRadius.all(Radius.circular(10)),


               ),
                 child: Image.asset("assets/images/big-bottle.jpg")
             ),
              Text(
               "Mineral water 20ltr",
                style: TextStyle(

                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: Row(
                 // mainAxisSize: MainAxisSize.min,

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: _decrementCounter,
                      icon: Icon(size: 40,
                          Icons.arrow_circle_left_outlined),
                    ),
                    Text( '$_itemCount',style: TextStyle(

                        color:Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28
                    ),),
                    IconButton(
                      onPressed: _incrementCounter,
                      icon: Icon(size: 40,
                          Icons.arrow_circle_right_outlined),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                   // Navigator.pushReplacementNamed(context, '/login');
                  }, child:  Text("Item Total: $_totalItemValue"),),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(
                            selectedCaneCount: _itemCount,
                            totalAmount: _totalItemValue,
                          ),
                        ),
                      );
                    },
                    child: Text("Add to Cart"),
                  ),

                ],
              )
          ],)
          )
        ],
      ),
    );
  }
}
