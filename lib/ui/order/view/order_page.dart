import 'package:flutter/material.dart';
import 'package:flutter_task/ui/order/view/card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin{

TabController? _tabController;
@override
void initState() {
  super.initState();
  _tabController = TabController(length: 2, vsync: this);
}
@override
void dispose() {
  _tabController!.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    int countItemNew = 0;
    int countItemoters = 10;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Order Page"), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Color(0xfffd2c0a),
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              child: Stack(
                children:[

                  Row(
                  children: [
                    Expanded(flex: 3, child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:CrossAxisAlignment.start ,
                                              children: [
                                              Text("Ahmed",style: TextStyle(color: Colors.white,fontSize: 25)),
                                                Text("Othman",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold,))
                                            ],)
                    )),

                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff004f62),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(110),
                          ),
                        ),
                        alignment: Alignment.centerRight,

                        child: GestureDetector(
                          onTap: ()=>{},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all( Radius.circular(10),
                              )),
                            child: Icon(
                                Icons.language_outlined,
                                size: 25,
                                color: Color(0xff057998),

                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
               ),
                  Positioned(
                      left:MediaQuery.of(context).size.width*.45,
                      bottom: 0,

                      child: Image.asset("imgs/man.png",height: 100,width: 120,fit: BoxFit.fill)
                  ),
                ]
              ),
            ),
      Container(
        // height: 50,
        // width: 250,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)

          )]
        ),
        child: TabBar(

          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,


          controller: _tabController,
          indicator: BoxDecoration(

            borderRadius: BorderRadius.circular(25),
            color: Color(0xff004f62),
          ),

            tabs: [
         Tab(text:  "New"),
          Tab(text:  "Others"),

        ],
        )

      ),
      Expanded(child:       TabBarView(
        controller: _tabController,
              children: [
                countItemNew==0?
                    Column(
                      children: [
                        Image.asset("imgs/empty.png",fit: BoxFit.fill,),
                        Text("No orders yet",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                        Text("you don't have any orders yet \n history.",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 15),)
                      ],
                    ):
                ListView.builder(
                  itemCount: countItemNew,
                  itemBuilder: (context, index) =>
                      OrderCard(date: "1/1/2020", price: "400 LE", status: "New"),
                ),

                ListView.builder(
                  itemCount: countItemoters,
                  itemBuilder: (context, index) =>
                      OrderCard(date: "11/6/2020", price: "6378 LE", status: "Delivered"),
                ),
              ],

            )),

          ],
        ),
      ),
    );
  }
}
