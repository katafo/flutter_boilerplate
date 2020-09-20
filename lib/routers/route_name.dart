/// Construct to define route name.
/// 
/// Route name can be group by path. 
/// Example: If you want to group all events screen. You can define like this: /event/{screen_name}

class RouteName {

    static const String initial = '/';

    static const String event = '/event';
    static const String eventDetails = '$event/details';

}