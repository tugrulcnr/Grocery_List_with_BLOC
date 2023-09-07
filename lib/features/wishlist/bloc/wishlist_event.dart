// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInialEvent extends WishlistEvent {}
class WishlistRemoveEvent extends WishlistEvent {
  final ProductDataModel productDataModel;
  WishlistRemoveEvent({
    required this.productDataModel,
  });
}
