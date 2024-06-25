import 'package:e_mart/common/widgets/customShapes/curvedEdges/curved_edge.dart';
import 'package:flutter/material.dart';

class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({
    super.key,this.child, required Color backgroundColor,
  });
    final Widget?child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdge(),
      child:child, 
    );
  }
}
