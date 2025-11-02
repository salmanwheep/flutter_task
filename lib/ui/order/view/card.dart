import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget{
 const OrderCard({required this.price,required this.status,required this.date});
  final price;
  final status;
  final date;


  @override
  Widget build(BuildContext context){
    final Color clr = status=="New"? Color(0xff2bde0a):status=="Delivered"?
    Color(0xff6f6f6f):
    status=="Delivering"? Color(0xff004f62):
    Color(0xffd32a0f);
    return SizedBox(
      height: 120,
      child: Card(
        borderOnForeground: true,
        shadowColor: Colors.grey,

        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.all(Radius.circular(10)),

        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Container(
            padding: EdgeInsets.only(left: 20),
           alignment: Alignment.centerLeft,child: Text("#1569877",style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,)),
                  Expanded(
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Status",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w500)),

                            Text(status,style: TextStyle(color: clr,fontSize: 18,fontWeight: FontWeight.w600))
                          ],

                        ),
                        Container(height: 50,
                          width: 1,
                          alignment: Alignment.center,color: Colors.grey,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total price",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w500)),

                            Text(price,style: TextStyle(color: Color(0xff126879),fontSize: 18,fontWeight: FontWeight.w600))
                          ],

                        ),
                        Container(height: 50,
                          width: 1,
                          alignment: Alignment.center,color: Colors.grey,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Date",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w500)),

                            Text(date,style: TextStyle(color: Color(0xff126879),fontSize: 18,fontWeight: FontWeight.w600))
                          ],

                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
            Container(

              decoration: BoxDecoration(
            color: clr,
                borderRadius: BorderRadius.horizontal(right: Radius.circular(10))
            )
        ,
              padding: EdgeInsets.all(10),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,

                children:[
        Text("Order \n Details",style: TextStyle(color: Colors.white,fontSize: 12),textAlign: TextAlign.center,),
                  Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,size: 20,)
                ]
              ),
            ),

          ]
        )
      ),
    );
  }
}