

import 'package:flutter/material.dart';
import 'package:martket_list/features/cart/bloc/cart_bloc.dart';
import 'package:martket_list/features/home/models/home_product_data_model.dart';
import 'package:martket_list/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistartBloc;
  const WishlistTileWidget({super.key, required this.productDataModel, required this.wishlistartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl))),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          productDataModel.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(productDataModel.description),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${productDataModel.price}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children:[
                IconButton(
                    onPressed: () {
                  //    homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        wishlistartBloc.add(WishlistRemoveEvent(productDataModel: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_bag)),
              ]
            )
          ],
        ),
      ]),
    );
  }
}
