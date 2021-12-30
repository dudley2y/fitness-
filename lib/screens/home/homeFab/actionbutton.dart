// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/themes.dart';

@immutable
class ActionButton extends StatelessWidget{
  final VoidCallback? onPressed;
  final Icon icon;

  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon
    }) : super(key:key);

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.secondary,
      elevation: 4.0,
      child: IconTheme.merge(
        data  : theme.iconTheme,
        child : IconButton(onPressed: onPressed,icon : icon) 
      )
    );

  }

}