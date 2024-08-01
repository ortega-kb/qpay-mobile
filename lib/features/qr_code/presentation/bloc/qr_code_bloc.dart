import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/qr_code/domain/usecases/get_qr_static.dart';

import '../../domain/entities/qr_static.dart';
import '../../domain/usecases/add_qr_static.dart';
import '../../domain/usecases/delete_qr_static.dart';

part 'qr_code_event.dart';

part 'qr_code_state.dart';

class QRCodeBloc extends Bloc<QRCodeEvent, QRCodeState> {
  final AddQRStatic _addQRStatic;
  final DeleteQRStatic _deleteQRStatic;
  final GetQRStatic _getQRStatic;

  QRCodeBloc(
      {required AddQRStatic addQRStatic,
      required DeleteQRStatic deleteQRStatic,
      required GetQRStatic getQRStatic})
      : _addQRStatic = addQRStatic,
        _deleteQRStatic = deleteQRStatic,
        _getQRStatic = getQRStatic,
        super(QRCodeInitial()) {
    on<QRCodeEvent>((event, emit) {
      log("Event $event");
    });

    // QRStatic Events
    on<GetAllQRStatic>((event, emit) async {
      emit(QRStaticLoadingState());

      final response = await _getQRStatic.invoke(NoParams());

      response.fold(
        (err) {},
        (qrStatics) => emit(QRStaticLoadedState(qrStatics)),
      );
    });

    on<AddQRStaticEvent>((event, emit) async {
      emit(QRStaticLoadingState());

      final response = await _addQRStatic.invoke(AddQRStaticParams(
        account: event.account,
        amount: event.amount,
        motif: event.motif,
        currency: event.currency,
      ));

      response.fold(
        (err) {},
        (qrStatics) {},
      );
    });

    on<DeleteQRStaticEvent>((event, emit) async {
      emit(QRStaticLoadingState());

      final response = await _deleteQRStatic.invoke(
        DeleteQRStaticParams(index: event.index),
      );

      response.fold(
        (err) {},
        (qrStatic) {},
      );
    });
  }
}
