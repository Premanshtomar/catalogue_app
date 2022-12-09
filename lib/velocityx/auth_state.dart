import 'package:catalogue_app/velocityx/vx_store.dart';
import 'package:velocity_x/velocity_x.dart';
class AuthState {
  bool? onChanged;

  AuthState({bool onChanges = false});
}



class ChangeAuthState extends VxMutation<MyVxStore>{
  bool val;
  ChangeAuthState(this.val);
  @override
  perform() {
    store?.authState.onChanged = val;
  }
}

class ResetAuthState extends VxMutation<MyVxStore>{
  @override
  perform() {
    store?.authState.onChanged = false;
  }
}

