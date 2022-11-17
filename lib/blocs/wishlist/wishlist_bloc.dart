import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '/models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<WishlistStarted>(_onWishlistStarted);
    on<WishlistProductAdded>(_onWishlistProductAdded);
    on<WishlistProductRemoved>(_onWishlistProductRemoved);
  }

  void _onWishlistStarted(
    WishlistStarted event,
    Emitter<WishlistState> emit,
  ) async {
    emit(const WishlistLoaded());
  }

  void _onWishlistProductAdded(
    WishlistProductAdded event,
    Emitter<WishlistState> emit,
  ) async {
    if (state is WishlistLoaded) {
      emit(WishlistLoaded(
          wishlist: Wishlist(
        products: List.from((state as WishlistLoaded).wishlist.products)
          ..add(event.product),
      )));
    }
  }

  void _onWishlistProductRemoved(
    WishlistProductRemoved event,
    Emitter<WishlistState> emit,
  ) async {
    if (state is WishlistLoaded) {
      emit(WishlistLoaded(
          wishlist: Wishlist(
        products: List.from((state as WishlistLoaded).wishlist.products)
          ..remove(event.product),
      )));
    }
  }
}
