import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onCartStarted);
    on<CartProductAdded>(_onCartProductAdded);
    on<CartProductRemoved>(_onCartProductRemoved);
  }

  void _onCartStarted(
    CartStarted event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoaded());
  }

  void _onCartProductAdded(
    CartProductAdded event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      emit(CartLoaded(
          cart: Cart(
        products: List.from((state as CartLoaded).cart.products)
          ..add(event.product),
      )));
    }
  }

  void _onCartProductRemoved(
    CartProductRemoved event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      emit(CartLoaded(
          cart: Cart(
        products: List.from((state as CartLoaded).cart.products)
          ..remove(event.product),
      )));
    }
  }

  // @override
  // Stream<CartState> mapEventToState(
  //   CartEvent event,
  // ) async* {
  //   if (event is CartStarted) {
  //     yield* _mapCartStartedToState();
  //   } else if (event is CartProductAdded) {
  //     yield* _mapCartProductAddedToState(event, state);
  //   } else if (event is CartProductRemoved) {
  //     yield* _mapCartProductRemovedToState(event, state);
  //   }
  // }

  // Stream<CartState> _mapCartStartedToState() async* {
  //   yield CartLoading();
  //   try {
  //     await Future<void>.delayed(const Duration(seconds: 1));
  //     yield const CartLoaded();
  //   } catch (_) {
  //     yield CartError();
  //   }
  // }

  // Stream<CartState> _mapCartProductAddedToState(
  //   CartProductAdded event,
  //   CartState state,
  // ) async* {
  //   if (state is CartLoaded) {
  //     try {
  //       yield CartLoaded(
  //         cart: Cart(
  //           products: List.from(state.cart.products)..add(event.product),
  //         ),
  //       );
  //     } on Exception {
  //       yield CartError();
  //     }
  //   }
  // }

  // Stream<CartState> _mapCartProductRemovedToState(
  //   CartProductRemoved event,
  //   CartState state,
  // ) async* {
  //   if (state is CartLoaded) {
  //     try {
  //       yield CartLoaded(
  //         cart: Cart(
  //           products: List.from(state.cart.products)..remove(event.product),
  //         ),
  //       );
  //     } on Exception {
  //       yield CartError();
  //     }
  //   }
  // }
}
