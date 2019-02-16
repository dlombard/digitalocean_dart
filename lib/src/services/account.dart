import '../models/account.dart';
import '../client.dart';
import 'doService.dart';

class AccountService extends DOService {
  AccountService(Client client) : super(client, 'v2/account');

  /// Get User Information
  Future<Account> get() async {
    dynamic data = await client.execute('GET', basePath);

    return Account.fromJson(data['account']);
  }
}
