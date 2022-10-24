import 'package:flutter/material.dart';
import 'package:magdsofttask/presentation/styles/colors.dart';

import '../../data/models/account_model.dart';
import '../screens/details/over_view_producat/over_view_produact_screen.dart';
import '../screens/details/prod_image/produ_image.dart';

class ItemCard extends StatelessWidget {
  const ItemCard( {Key? key,required this.productModel}) : super(key: key);

  final Products productModel;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OverViewProduactScreen(productModel: productModel,


            ),
          ),
        );

      },
      child: Container(
        height: 239,
        width: 168,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          children: [
            const ProductImage(
              isFavorite: false,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 42),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.name!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      Text(
                        productModel.type!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 83,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productModel.price!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                  color: Colors.black, fontSize: 12),
                            ),
                            Container(
                              height: double.infinity,
                              width: MediaQuery.of(context).size.width / 9,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primaryColor,
                                      AppColors.primaryColor.withOpacity(0.7),
                                      AppColors.primaryColor.withOpacity(0.2),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  color: AppColors.primaryColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                              child: const Icon(
                                Icons.add,
                                color: AppColors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
