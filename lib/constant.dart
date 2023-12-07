import 'package:notfa/core/local/cache_helper.dart';
import 'package:notfa/presentation/screens/auth/login/ui/login_screen.dart';
import 'package:notfa/presentation/widget/widgets/coustoms/coustom_text_form.dart';

void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      navigateAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}





String token = ' ';
 String uId = ' ';