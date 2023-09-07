// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState{}

 class WishlistInitial extends WishlistState {}
 
class WishlistSuccsess extends WishlistState {
  final List<ProductDataModel> wishlistItems;
  WishlistSuccsess({
    required this.wishlistItems,
  });
 }

 class WishlistRemove extends WishlistState {}
