import 'package:flutter/material.dart';

class DynamicIcon extends StatelessWidget {
  final String affordabilityValue;

  const DynamicIcon({
    Key key,
    @required this.affordabilityValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (affordabilityValue == '\$') {
      return Icon(Icons.monetization_on);
    } else if (affordabilityValue == '\$\$') {
      return Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          Icon(Icons.monetization_on),
          Icon(Icons.monetization_on),
        ],
      );
    } else if (affordabilityValue == '\$\$\$') {
      return Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          Icon(Icons.monetization_on),
          Icon(Icons.monetization_on),
          Icon(Icons.monetization_on),
        ],
      );
    } else {
      return Icon(
        Icons.error,
        color: Colors.red,
      );
    }
  }
}
