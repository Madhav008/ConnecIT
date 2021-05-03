import 'dart:math';

class CreateReferralCode {
  var referralCodeGenerator = Random();

  setReferralCode() {
    var id = referralCodeGenerator.nextInt(92143543) + 09451234356;
    var randomCode = "Ref-${id.toString().substring(0, 8)}";
    return randomCode;
  }
}
