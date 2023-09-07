import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:martket_list/data/wishlist_items.dart';
import 'package:martket_list/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:martket_list/features/wishlist/ui/wishlist_ttile_widget.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishlistInialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WishList View"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccsess:
            final successState = state as WishlistSuccsess;
              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return WishlistTileWidget(productDataModel: successState.wishlistItems[index], wishlistartBloc: wishlistBloc);
                },
              );

            default:
            return
          }
        },
      ),
    );
  }
}
