import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:martket_list/data/cart_items.dart';
import 'package:martket_list/features/cart/bloc/cart_bloc.dart';
import 'package:martket_list/features/cart/ui/cart_tile_widget.dart';
import 'package:martket_list/features/home/ui/product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart view"),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final successState = state as CartSuccessState;
                return ListView.builder(
                  itemCount: successState.cartList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartTileWidget(
                        productDataModel: successState.cartList[index],
                        cartBloc: cartBloc);
                  },
                );
              default:
                return const Scaffold(body: Center(child: Text("Error occured"),),);
            }
          },
        ));
  }
}
