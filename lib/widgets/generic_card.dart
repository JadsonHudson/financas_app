import 'package:flutter/material.dart';

class GenericCard extends StatefulWidget {
  final List<Widget> children;
  final String type;
  final String title;
  final IconData? icon;
  const GenericCard({
    Key? key,
    required this.children,
    required this.type,
    this.title = "",
    this.icon,
  }) : super(key: key);

  @override
  State<GenericCard> createState() => _GenericCardState();
}

class _GenericCardState extends State<GenericCard> {
  BorderRadius getWidget() {
    if (widget.type == "top") {
      return getWidgetTop();
    } else if (widget.type == "middle") {
      return getWidgetMiddle();
    } else if (widget.type == "bottom") {
      return getWidgetBottom();
    } else {
      return getWidgetMiddle();
    }
  }

  Widget? hasHeaderWidget() {
    if (widget.title != "" && widget.type == "middle") {
      if (widget.icon != null) {
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      )),
                  Icon(
                    widget.icon,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        );
      }
      return Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            child: Row(children: [
              Text(widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  )),
            ]),
          ),
          const SizedBox(height: 10.0),
        ],
      );
    } else {
      return null;
    }
  }

  Widget isBottomOrTop() {
    if (widget.type == "bottom") {
      return Flexible(
        child: Column(
          children: [
            if (hasHeaderWidget() != null) hasHeaderWidget()!,
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 24.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF37343b),
                  borderRadius: getWidget(),
                ),
                child: Column(children: widget.children),
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        child: Column(
          children: [
            if (hasHeaderWidget() != null) hasHeaderWidget()!,
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              decoration: BoxDecoration(
                color: const Color(0xFF37343b),
                borderRadius: getWidget(),
              ),
              child: Column(children: widget.children),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isBottomOrTop();
  }
}

BorderRadius getWidgetTop() =>
    const BorderRadius.vertical(bottom: Radius.circular(32.0));
BorderRadius getWidgetMiddle() => const BorderRadius.all(Radius.circular(32.0));
BorderRadius getWidgetBottom() =>
    const BorderRadius.vertical(top: Radius.circular(32.0));
