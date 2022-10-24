import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsofttask/presentation/screens/details/details_Screen.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}
class _HelpScreenState extends State<HelpScreen> {
   bool expanded= false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GlobalCubit.get(context);
        List<Item> generateItems(int numberOfItems) {
          return List<Item>.generate(numberOfItems, (int index) {
            return Item(
              headerValue: '${cubit.getModel!.help![index].question}',
              expandedValue: '${cubit.getModel!.help![index].answer}',
              isExpanded: cubit.isExpanded
            );
          });
        }
         List<Item> _data = generateItems(cubit.getModel!.help!.length);

        return SafeArea(
          child: Scaffold(
            body:SingleChildScrollView(
              child: Column(
                children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff0062BD),
                            Colors.white,
                          ],
                          stops: [
                            0.05,
                            0.5
                          ])),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Center(
                        child: Text(
                          'Help',
                          style: TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 40,),
                      // ExpansionPanelList(
                      //   expansionCallback: ( index,  isExpandedd){
                      //     setState(() {
                      //       expanded= !isExpandedd;
                      //     });
                      //
                      //   },
                      //   children: [
                      //   ExpansionPanel(
                      //   canTapOnHeader: true,
                      //   headerBuilder: (BuildContext context, bool isExpanded) {
                      //     return Padding(
                      //       padding: const EdgeInsets.only(left: 15.0,top: 20),
                      //       child: Text('asdasd',
                      //         textAlign: TextAlign.start,
                      //       ),
                      //     );
                      //   },
                      //   body: Padding(
                      //     padding: const EdgeInsets.all( 10),
                      //     child: Text('gasfvbsksbdlanlsdknfsdbca',
                      //       textAlign: TextAlign.start,
                      //     ),
                      //   ),
                      //   isExpanded: expanded,
                      // )
                      //   ],),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: ExpansionPanelList(
                            dividerColor: Colors.blue,
                            expansionCallback: ( index,  isExpanded) {
                              setState(() {
                                _data[index].isExpanded = !isExpanded;
                              });


                             cubit.setState( !isExpanded );
                            },
                            children: _data.map((_data) {
                              return ExpansionPanel(
                                isExpanded:false,
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 15.0,top: 20),
                                    child: Text(_data.headerValue,
                                    textAlign: TextAlign.start,
                                    ),
                                  );
                                },
                                body: Padding(
                                  padding: const EdgeInsets.all( 10),
                                  child: Text(_data.expandedValue,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 70),
                      //   child: GestureDetector(
                      //     onTap: (){
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => DetailsScreen(),
                      //         ),
                      //       );
                      //     },
                      //     child: Container(
                      //       height: 48,
                      //       width: 282,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(50),
                      //           gradient: LinearGradient(
                      //               begin: Alignment.centerLeft,
                      //               end: Alignment.centerRight,
                      //               colors: [
                      //                 const Color(0xff0062BD),
                      //                 Colors.lightBlue.shade600
                      //               ],
                      //               stops: [
                      //                 .3,
                      //                 6
                      //               ])),
                      //       child: const Center(
                      //         child: Text(
                      //           'Continue',
                      //           style: TextStyle(
                      //               color: Colors.white, fontSize: 20),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                 const SizedBox(height: 200,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: GestureDetector(


                      onTap: (){


                        cubit.getHomeDetails();
                        Navigator.push(
                          context,
                          MaterialPageRoute(

                            builder: (context) => DetailsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 48,
                        width: 282,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  const Color(0xff0062BD),
                                  Colors.lightBlue.shade600
                                ],
                                stops: [
                                  .3,
                                  6
                                ])),
                        child: const Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),

              ],),
            ),

          ),
        );
      },
    );
  }

}
class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded=false
  });


}



// (cubit.getModel != null)
// ? SafeArea(
// child: Scaffold(
// body: Center(
// child: Container(
// child: cubit.currentIndex == -1
// ? Container(
// width: double.infinity,
// decoration: const BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// colors: [
// Color(0xff0062BD),
// Colors.white,
// ],
// stops: [
// 0.05,
// 0.5
// ])),
// child: Column(
// children: [
// const SizedBox(
// height: 50,
// ),
// const Center(
// child: Text(
// 'Help',
// style: TextStyle(
// fontSize: 30, color: Colors.white),
// ),
// ),
// ExpansionPanelList(
// expansionCallback: (int index, bool isExpanded) {
// setState(() {
// _data[index].isExpanded = !isExpanded;
// cubit.setState( _data[index].isExpanded = !isExpanded);
// }
// );
// },
// children: _data.map<ExpansionPanel>((Item item) {
// return ExpansionPanel(
// headerBuilder: (BuildContext context, bool isExpanded) {
// return ListTile(
// title: Text(item.headerValue),
// );
// },
// body: ListTile(
// title: Text(item.expandedValue),),
// isExpanded: item.isExpanded,
// );
// }).toList(),
// ),
// ],
// ),
// )
// : cubit.currentIndex== 0
// ? Container(
// color: Colors.red,
// )
// : cubit.currentIndex==1
// ? Container(
// color: Colors.black,
// )
// : cubit.currentIndex== 2
// ? Container(
// color: Colors.green,
// )
// : Container(
// color: Colors.amberAccent,
// )),
// ),
// floatingActionButton: FloatingActionButton(
// onPressed: () {
// cubit.changeBottomNavBar(-1);
// },
// child: Icon(Icons.home),
// //params
// ),
// floatingActionButtonLocation:
// FloatingActionButtonLocation.centerDocked,
// bottomNavigationBar: AnimatedBottomNavigationBar(
// icons: [
// Icons.exit_to_app,
// Icons.favorite_border,
// Icons.notification_important,
// Icons.settings,
// ],
// activeIndex: cubit.currentIndex,
// gapLocation: GapLocation.center,
// notchSmoothness: NotchSmoothness.verySmoothEdge,
// leftCornerRadius: 32,
// rightCornerRadius: 32,
// onTap: (index) {
// cubit.changeBottomNavBar(index);
//
// },
// ),
// ),
// )
// : const SizedBox(
// child: Center(
// child: CircularProgressIndicator(),
// ),
// );
