import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/repositories/localStorage/local_storage_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final LocalStorageRepository _localStorageRepository;
  WishlistBloc({
    required LocalStorageRepository localStorageRepository,
  })  : _localStorageRepository = localStorageRepository,
        super(WishlistLoading()) {
    on<WishlistStarted>(_onWishlistStarted);
    on<WishlistProductAdded>(_onWishlistProductAdded);
    on<WishlistProductRemoved>(_onWishlistProductRemoved);
  }

  void _onWishlistStarted(
    WishlistStarted event,
    Emitter<WishlistState> emit,
  ) async {
    Box box = await _localStorageRepository.openBox();
    List<Product> products = _localStorageRepository.getWishList(box);
    emit(WishlistLoaded(wishlist: Wishlist(products: products)));
  }

  void _onWishlistProductAdded(
    WishlistProductAdded event,
    Emitter<WishlistState> emit,
  ) async {
    if (state is WishlistLoaded) {
      Box box = await _localStorageRepository.openBox();
      _localStorageRepository.adddProductToWishList(box, event.product);
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
      Box box = await _localStorageRepository.openBox();
      _localStorageRepository.removeProductFromWishList(box, event.product);
      emit(WishlistLoaded(
          wishlist: Wishlist(
        products: List.from((state as WishlistLoaded).wishlist.products)
          ..remove(event.product),
      )));
    }
  }
}
