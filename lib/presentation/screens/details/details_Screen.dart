import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsofttask/data/models/account_model.dart';
import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../componant/item_card.dart';
import '../../styles/colors.dart';

class DetailsScreen extends StatelessWidget {
  var searchController = TextEditingController();
  late final Products productModel;
  final List<String> _filterChoicesNameList = ['All', 'Acer', 'Razer', 'Apple'];
  final List<String> _filterChoicesImagesPathList = [
    'assets/images/cup.png',
    'assets/images/acer1.png',
    'assets/images/razer.png',
    'assets/images/apple.png'
  ];



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = GlobalCubit.get(context);
         return SafeArea(
          child: Scaffold(
            body: Center(
              child: Container(
                  child: cubit.currentIndex == -1
                      ?

                  (state is GetProducatSuccessState )
                      ? Container(
                    width: double.infinity,
                    decoration:const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff0062BD),
                              Colors.white,
                            ],
                            stops: [0.05, 0.5]
                        )        ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 320,
                                height: 50,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  color:  Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: searchController,
                                  decoration: InputDecoration(
                                      suffixIcon:Icon( Icons.search,size: 27,) ,
                                      contentPadding: EdgeInsets.all( 20),
                                      labelText: 'Search',
                                      suffixIconColor:  Colors.black

                                  ),
                                ),
                              ),
                              Container(
                                  height:50 ,
                                  width: 50,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color:  Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt,color: Color(0xffB1B1B1),)))
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Container(
                              height:176 ,
                              width: 369,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                color:  Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/Acer.png'),

                              )
                          ),
                          const SizedBox(height: 30,),
                          FilterChoicesList(
                              filterChoicesImages: _filterChoicesImagesPathList,
                              filterChoicesNames: _filterChoicesNameList),
                          // Container(
                          //   height: 239,
                          //   width: 168,
                          //   child: ConditionalBuilder(
                          //     condition: state is GetProducatSuccessState,
                          //     builder: (context) =>   ListView.builder(
                          //       scrollDirection: Axis.vertical,
                          //           itemBuilder: (context, index) =>
                          //               ItemCard(productModel: cubit.getProductModel!.products![index],),
                          //           itemCount: cubit.getProductModel!.products!.length,
                          //         ),
                          //     fallback:(context)=>Center(child: CircularProgressIndicator()) ,
                          //
                          //
                          //
                          //
                          //   ),
                          // ),
                          if(state is GetProducatSuccessState)
                            SizedBox(
                              height: 1000,
                              width: double.infinity,
                              child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: StaggeredGrid.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 25,
                                children: [
                                  StaggeredGridTile.fit(
                                    crossAxisCellCount: 1,
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height / 5,
                                      child: Text(
                                        "Recommended \nFor You",
                                        softWrap: false,
                                        maxLines: 3,
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: const Color(0xff464646),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ),
                                  ),

                                   for (var product in state.getProductModel.products!)
                                     ItemCard(productModel: product),

                                ],
                              ),
                          ),
                            ),
                        ],
                      ),
                    ),
                  )
                      :const SizedBox(height: 400, child: Center(child: CircularProgressIndicator()),)


                      : cubit.currentIndex == 0
                      ? Container(
                    width: double.infinity,
                    decoration:const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff0062BD),
                              Colors.white,
                            ],
                            stops: [0.05, 0.5]
                        )        ),)
                      : cubit.currentIndex == 1
                      ? Container(
                    width: double.infinity,
                    decoration:const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff0062BD),
                              Colors.white,
                            ],
                            stops: [0.05, 0.5]
                        )        ),)
                      : cubit.currentIndex == 2
                      ? Container(
                    width: double.infinity,
                    decoration:const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff0062BD),
                              Colors.white,
                            ],
                            stops: [0.05, 0.5]
                        )        ),)
                      : Container(
                    width: double.infinity,
                    decoration:const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff0062BD),
                              Colors.white,
                            ],
                            stops: [0.05, 0.5]
                        )        ),)
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.changeBottomNavBar(-1);
                cubit.getHomeDetails();
              },
              child: Icon(Icons.home),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: [
                Icons.exit_to_app,
                Icons.favorite_border,
                Icons.notification_important,
                Icons.settings,
              ],
              activeIndex: cubit.currentIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
          ),
        );
      },
    );


  }
}


class FilterChoicesList extends StatelessWidget {
  const FilterChoicesList(
      {Key? key,
        required this.filterChoicesImages,
        required this.filterChoicesNames})
      : super(key: key);
  final List<String> filterChoicesImages;
  final List<String> filterChoicesNames;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 11,
        child: BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FilterChoice(
                      filterName: filterChoicesNames[index],
                      filterImagePath: filterChoicesImages[index],
                      defaultChoice:
                      GlobalCubit.get(context).filtersDefaultChoice,
                      onSelected: () {
                        GlobalCubit.get(context)
                            .selectFilter(filterIndex: index);
                      },
                      index: index);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  );
                },
                itemCount: 4);
          },
        ),
      ),
    );
  }
}

class FilterChoice extends StatelessWidget {
  const FilterChoice(
      {Key? key,
        required this.filterName,
        required this.filterImagePath,
        required this.defaultChoice,
        required this.onSelected,
        required this.index})
      : super(key: key);
  final String filterName;
  final String filterImagePath;
  final int defaultChoice;
  final int index;
  final Function onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 55),
        child: ChoiceChip(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 20,
              left: MediaQuery.of(context).size.width / 85),
          shadowColor: Colors.grey,
          elevation: 6,
          pressElevation: 0.0,
          selectedColor: AppColors.primaryColor,
          backgroundColor: Colors.white,
          label: Row(
            children: [
              Container(
                child: CircleAvatar(
                  minRadius: 22,
                  backgroundColor: AppColors.white,
                  child: Image.asset(
                    filterImagePath,
                    height: 32,
                    width: 32,
                  ),
                ),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey)]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 42,
              ),
              Text(
                filterName,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: defaultChoice == index ? Colors.white : Colors.black,
                    fontSize: 20),
              ),
            ],
          ),
          selected: defaultChoice == index,
          onSelected: (bool selected) {
            onSelected();
          },
        ));
  }
}
