import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:estudo_flutter/bloc/users/user_model.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 3));

      // COMO FUNCIONA ISSO AQUII?? QUANDO ELE MUDA O STATUS PRA USERLOADED?
      // Ao carregar usuario vai emitir um evento pra passar uma lsita de usuario vazia ao evento UserLoaded depois de 3 segundos
      emit(const UserLoaded(users: <UserModel>[UserModel(id: 9895, name: 'marcos', email: 'marcos@hotmail')]));
    });

    on<AddUser>((event, emit) async {
      // await Future<void>.delayed(const Duration(seconds: 3));

      if (state is UserLoaded) {
        final state = this.state as UserLoaded;
        emit(
            // dois pontos eu dou tipagem ao metodo ADD da class LIST
            UserLoaded(users: List.from(state.users)..add(event.user)));
      } else {
        print(
            'o state nao eh user loaded, entao nao eh possivel ADICIONAR usuario');
      }
    });

    on<RemoveUser>((event, emit) {
      if (state is UserLoaded) {
        final state = this.state as UserLoaded;
        emit(
            // dois pontos eu dou tipagem ao metodo remove da class LIST
            UserLoaded(users: List.from(state.users)..remove(event.user)));
      } else {
        print(
            'o state nao eh user loaded, entao nao eh possivel REMOVER usuario');
      }
    });
  }
}
