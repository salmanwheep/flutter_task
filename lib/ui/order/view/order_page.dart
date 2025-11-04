import 'package:flutter/material.dart';
import 'package:flutter_task/ui/order/view/card.dart';
import 'package:flutter_task/ui/order/view_models/order_viewmodels.dart';
import 'package:user_idle_detector/user_idle_detector.dart';
import '../../../core/language.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key,required this.viewModel}) ;
final OrderViewModel viewModel;
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin{

TabController? _tabController;
@override
void initState() {
  super.initState();

  _tabController = TabController(length: 2, vsync: this);
UserIdleDetector().initialize(
      listener: () {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, "/login");
      },
      idleTime: const Duration(minutes: 2),
    );

}
@override
void dispose() {
  _tabController!.dispose();
  UserIdleDetector().dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Order Page"), centerTitle: true),
      body: Center(
        child: ListenableBuilder(
          listenable: widget.viewModel.loadOrdersNew,

          builder: (context,child) {
            if(widget.viewModel.loadOrdersNew.running){
              return CircularProgressIndicator();

            }else if(widget.viewModel.loadOrdersNew.error){
              return Center(child: IconButton(onPressed: ()=>widget.viewModel.loadOrdersNew.execute, icon: Icon(Icons.refresh),iconSize: 30) );
            }
            return Column(
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
                              onTap: ()=>{
                                showDialog(
                                  context: context,
                                  builder: (_) => const LanguageDialog(),
                                ).then((lang) {
                                  if (lang != null) {
                                    // widget.viewModel.changeLanguage(lang);
                                  }
                                })

                            },
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
indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
             Tab(text:  "New"),
              Tab(text:  "Others"),

            ],
            )

                  ),
                  Expanded(child:       ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context,_) {
              return TabBarView(
                controller: _tabController,
                      children: [
                        widget.viewModel.ordersNew.isEmpty?
                            Column(
                              children: [
                                Image.asset("imgs/empty.png",fit: BoxFit.fill,),
                                Text("No orders yet",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                                Text("you don't have any orders yet \n history.",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 15),)
                              ],
                            ):
                        ListView.builder(
                          itemCount: widget.viewModel.ordersNew.length,
                          itemBuilder: (context, index) =>
                              OrderCard(price: widget.viewModel.ordersNew[index].price, status: widget.viewModel.ordersNew[index].status, date: widget.viewModel.ordersNew[index].date),
                        ),
                        widget.viewModel.ordersOther.isEmpty?
                        Column(
                          children: [
                            Image.asset("imgs/empty.png",fit: BoxFit.fill,),
                            Text("No orders yet",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                            Text("you don't have any orders yet \n history.",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 15),)
                          ],
                        ):
                        ListView.builder(
                          itemCount: widget.viewModel.ordersOther.length,
                          itemBuilder: (context, index) =>
                              OrderCard(price: widget.viewModel.ordersOther[index].price, status: widget.viewModel.ordersOther[index].status, date: widget.viewModel.ordersOther[index].date),
                        ),
                      ],

                    );
            }
                  )),

              ],
            );
          }
        ),
      ),
    );
  }
}
