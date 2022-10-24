
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, required this.isFavorite}) : super(key: key);
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          Center(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 7,
                    ),
                  ]),
              width: double.infinity,
              height: 114,
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 200),
              child: Image.asset("assets/images/Acer.png",fit: BoxFit.fill,),

            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 83,
                    bottom: MediaQuery.of(context).size.height / 83,
                    right: MediaQuery.of(context).size.width / 28),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ))
        ],
      ),
    );
  }
}
