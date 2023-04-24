import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/routes/routes_handlers.dart';

class FluroRoutes {

  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {

    router.define('/:page', handler: homeHandler);
    router.notFoundHandler = homeHandler;
    
  }

}