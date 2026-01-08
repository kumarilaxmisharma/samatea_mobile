import 'package:flutter/material.dart';

class RulerPicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onChanged;
  final String unit;
  final bool isHorizontal;

  const RulerPicker({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onChanged,
    required this.unit,
    this.isHorizontal = true,
  });

  @override
  _RulerPickerState createState() => _RulerPickerState();
}

class _RulerPickerState extends State<RulerPicker> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(
      initialItem: widget.initialValue - widget.minValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Display Value
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            // We need to listen to the controller to update this text continuously
            // For simplicity in this mockup, we might just rely on the parent updating
            // passed parameters, but ListWheelScrollView is a bit tricky with continuous updates.
            // Let's rely on the onChanged callback to update the parent state which updates this widget.
             Text(
              '${widget.initialValue}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(width: 5),
            Text(
              widget.unit,
              style: const TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Ruler Area
        SizedBox(
          height: widget.isHorizontal ? 100 : 300,
          width: widget.isHorizontal ? double.infinity : 100,
          child: RotatedBox(
            quarterTurns: widget.isHorizontal ? -1 : 0,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 60, // Spacing between ticks
              perspective: 0.001, // Flat look
              diameterRatio: 100, // Make it look like a straight line
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                widget.onChanged(widget.minValue + index);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: widget.maxValue - widget.minValue + 1,
                builder: (context, index) {
                  final value = widget.minValue + index;
                  final isMajor = value % 5 == 0;
                  
                  return Center(
                    child: RotatedBox(
                       quarterTurns: widget.isHorizontal ? 1 : 0,
                       child: _buildTick(isMajor, value),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        // Indicator arrow
         const Icon(Icons.arrow_drop_up, size: 40, color: Colors.black),
      ],
    );
  }

  Widget _buildTick(bool isMajor, int value) {
    if (widget.isHorizontal) {
       return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isMajor) Text('$value', style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 5),
          Container(
            height: isMajor ? 40 : 20,
            width: 2,
            color: isMajor ? Colors.black : Colors.grey,
          ),
        ],
      );
    } else {
       // Vertical Layout (Height)
       return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: isMajor ? 40 : 20,
            height: 2,
            color: isMajor ? Colors.black : Colors.grey,
          ),
          const SizedBox(width: 10),
          if (isMajor) Text('$value', style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      );
    }
   
  }
}
