import 'package:n_insta/screen_transitions/fade_up.dart';
import 'package:n_insta/screens/home_page/home_page.dart';
import 'package:n_insta/screens/search/search.dart';

const bottomBarScreens = [HomePage(), FadeUp(child: Search())];
