part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  //addproduct
  const factory CheckoutEvent.addProduct(ProductModel product) = _AddProduct;
  //removeproduct
  const factory CheckoutEvent.removeProduct(ProductModel product) = _RemoveProduct;
}