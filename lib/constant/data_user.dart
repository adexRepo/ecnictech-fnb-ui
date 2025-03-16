import 'package:ecnictech_fnb_ui/features/auth/models/user_credential.dart';
import 'package:ecnictech_fnb_ui/features/auth/models/user_info.dart';

class DataUsers {
  static List<UserCredential> dataUser = [
    UserCredential(
      token: "token2",
      userInfo: UserInfo(
        id: "a96ef936-d861-4340-9797-927e2a267d12",
        username: "sutardi",
        nickName: "sutardi",
        password: "sutardi222",
        userStatus: "ACTIVE",
        userRoles: ["EMPLOYEE"],
      ),
    ),
    UserCredential(
      token: "token1",
      userInfo: UserInfo(
        id: "419087ec-2814-48c0-82a1-a444ee90dc42",
        username: "aris",
        nickName: "aris",
        password: "aris111",
        userStatus: "ACTIVE",
        userRoles: ["ADMIN"],
      ),
    ),
    UserCredential(
      token: "token0",
      userInfo: UserInfo(
        id: "143d1105-0b4a-4932-9438-88e7a1cd52d4",
        username: "adek",
        nickName: "adek",
        password: "adek000",
        userStatus: "ACTIVE",
        userRoles: ["SUPER_ADMIN"],
      ),
    ),
  ];
}
