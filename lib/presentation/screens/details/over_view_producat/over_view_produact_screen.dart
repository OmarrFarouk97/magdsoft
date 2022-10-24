import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/account_model.dart';
import '../../../styles/colors.dart';

class OverViewProduactScreen extends StatefulWidget {
  const OverViewProduactScreen({Key? key,required this.productModel}) : super(key: key);
  final Products productModel;
  @override
  State<OverViewProduactScreen> createState() =>
      _OverViewProduactScreenState(productModel:productModel );
}
class _OverViewProduactScreenState extends State<OverViewProduactScreen> with TickerProviderStateMixin {

  final Products productModel;

  final List<String> _productSubImagePathList = [
    'assets/images/pederator2.jpg',
    'assets/images/predator.png',
    'assets/images/product.png',
    'assets/images/pederator2.jpg',
  ];
  _OverViewProduactScreenState({required this.productModel});



  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[600]!.withOpacity(0.9),
                                blurRadius: 10,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.grey,
                            size: 28,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 41,
                      ),
                      Text(
                        productModel.name!,
                        style: TextStyle(fontSize:25,color: Colors.white ),
                      ),
                      Text(
                        productModel.type!,
                        style: TextStyle(fontSize:15,color: Colors.white ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 82,
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(blurRadius: 7, color: Colors.grey[600]!),
                            ]),
                        width: double.infinity,
                        height: 200.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width / 100,
                              vertical: MediaQuery.of(context).size.height / 100),
                          child: Image.asset("assets/images/product.png"),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      ProductSubImagesList(
                        productSubImagePathList: _productSubImagePathList,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      const StoreInfo(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20.5,
                      ),
                      Row(
                        children: [
                          Text(' price \n ${productModel.price}',style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff464646)
                          ),),
                          const Spacer(),
                           Container(
                            padding: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height / 170,
                                horizontal: MediaQuery.of(context).size.width / 11),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 4, color: Colors.grey[400]!, spreadRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryColor,
                                  AppColors.primaryColor.withOpacity(0.5),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                'Add To Cart',
                                style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 16.5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 20),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      ProductDetailsTabBar(tabController: tabController),
                      ProductDetailsTabBarView(
                        tabController: tabController,
                        productDescription: productModel.description!,
                      ),
                    ],
                  ),
                )
                )
        ),
      ),
    );
  }
}
class ProductSubImagesList extends StatelessWidget {
  const ProductSubImagesList({Key? key, required this.productSubImagePathList})
      : super(key: key);
  final List<String> productSubImagePathList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 7.7,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 85,
                    vertical: MediaQuery.of(context).size.height / 85),
                child: ProductSubImage(
                  imagePath: productSubImagePathList[index],
                ));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.width / 41,
            );
          },
          itemCount: 4),
    );
  }
}
class ProductSubImage extends StatelessWidget {
  const ProductSubImage({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(blurRadius: 7, color: Colors.grey[600]!),
          ]),
      width: MediaQuery.of(context).size.width / 3.5,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 85,
            vertical: MediaQuery.of(context).size.height / 85),
        child: Image.asset(imagePath),
      ),
    );
  }
}
class StoreInfo extends StatelessWidget {
  const StoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 20.0),
      height: 75.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(blurRadius: 7, color: Colors.grey[600]!),
          ]),
      child: Row(
        children: [
          const ProductStoreImage(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 41,
          ),
          const ViewStoreInfo(),
          const Spacer(),
          const ForwardArrow(),
        ],
      ),
    );
  }
}

class ProductStoreImage extends StatelessWidget {
  const ProductStoreImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(blurRadius: 4, color: Colors.grey[600]!),
          ]),
      child: Image.asset("assets/images/acerlogo.png"),
    );
  }
}
class ViewStoreInfo extends StatelessWidget {
  const ViewStoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ProductStoreName(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 117,
        ),
        Text(
          'View Store',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
class ProductStoreName extends StatelessWidget {
  const ProductStoreName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Acer Official Store',
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
class ForwardArrow extends StatelessWidget {
  const ForwardArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 25.w,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(blurRadius: 4, color: Colors.grey[600]!),
          ]),
      child: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.primaryColor,
      ),
    );
  }
}


class ProductDetailsTabBar extends StatelessWidget {
  const ProductDetailsTabBar({Key? key, required this.tabController})
      : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TabBar(
        controller: tabController,
        indicator: CircleTabBarIndicator(color: AppColors.primaryColor, radius: 5),
        indicatorWeight: 15.0,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        tabs: <Widget>[
          Text(
            'Overview',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16.sp, color: Colors.black),
          ),
          Text(
            'Specification',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16.sp, color: Colors.black),
          ),
          Text(
            'Review',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
class CircleTabBarIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabBarIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}
class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class ProductDetailsTabBarView extends StatelessWidget {
  const ProductDetailsTabBarView(
      {Key? key, required this.tabController, required this.productDescription})
      : super(key: key);
  final TabController tabController;
  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20),
      width: double.infinity,
      height: 410.h,
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          Text(
            productDescription,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey, fontSize: 16.sp),
          ),
          Text(
            productDescription,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey, fontSize: 16.sp),
          ),
          Text(
            productDescription,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}


