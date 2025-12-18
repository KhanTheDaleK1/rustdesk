import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common.dart';
import '../../models/model.dart';
import '../../models/input_model.dart';
import '../../consts.dart';

class MobileFloatingKeyboard extends StatefulWidget {
  final InputModel inputModel;

  const MobileFloatingKeyboard({Key? key, required this.inputModel}) : super(key: key);

  @override
  State<MobileFloatingKeyboard> createState() => _MobileFloatingKeyboardState();
}

class _MobileFloatingKeyboardState extends State<MobileFloatingKeyboard> with WidgetsBindingObserver {
  double _sysKeyboardHeight = 0;
  Timer? _keyboardDebounce;
  final GlobalKey _keyboardKey = GlobalKey();
  double _keyboardHeight = 0;

  InputModel get inputModel => widget.inputModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateKeyboardHeight();
    });
  }

  @override
  void dispose() {
    _keyboardDebounce?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    _keyboardDebounce?.cancel();
    _keyboardDebounce = Timer(const Duration(milliseconds: 20), () {
      final bottomInset = MediaQuery.of(context).viewInsets.bottom;
      setState(() {
        _sysKeyboardHeight = bottomInset;
      });
    });
  }

  void _updateKeyboardHeight() {
    if (_keyboardKey.currentContext != null) {
      final renderBox = _keyboardKey.currentContext!.findRenderObject() as RenderBox;
      _keyboardHeight = renderBox.size.height;
    }
  }

  void _sendKeyToInputModel(String key) {
    String? sendKey;
    // Map terminal keys to RustDesk input model keys
    switch (key) {
      case 'Esc':
        sendKey = 'VK_ESCAPE';
        break;
      case 'Tab':
        sendKey = 'VK_TAB';
        break;
      case 'Ctrl+C':
        // RustDesk input model handles Ctrl+C by setting Ctrl and then sending C
        inputModel.ctrl = true;
        sendKey = 'VK_C';
        break;
      case '↑':
        sendKey = 'VK_UP';
        break;
      case '↓':
        sendKey = 'VK_DOWN';
        break;
      case '→':
        sendKey = 'VK_RIGHT';
        break;
      case '←':
        sendKey = 'VK_LEFT';
        break;
      case 'Home':
        sendKey = 'VK_HOME';
        break;
      case 'End':
        sendKey = 'VK_END';
        break;
      case '/':
        sendKey = 'VK_OEM_2'; // Usually /?
        break;
      case ':':
        sendKey = 'VK_OEM_1'; // Usually ;:
        break;
      case '?':
        // Handled by VK_OEM_2 with Shift if needed, but for simplicity here just send as is
        sendKey = 'VK_OEM_2'; // Assuming direct input for now
        break;
      case '-':
        sendKey = 'VK_OEM_MINUS';
        break;
      case '!':
        sendKey = 'VK_1'; // VK_1 with shift
        break;
      default:
        sendKey = key; // For direct character input
        break;
    }

    if (sendKey != null) {
      inputModel.inputKey(sendKey);
      // If Ctrl+C was sent, release Ctrl after sending C
      if (key == 'Ctrl+C') {
        inputModel.ctrl = false;
      }
    }
  }

  Widget _buildKeyButton(String label) {
    return ElevatedButton(
      onPressed: () {
        _sendKeyToInputModel(label);
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(48, 32),
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(fontSize: 12),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: _sysKeyboardHeight,
      child: Container(
        key: _keyboardKey,
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKeyButton('Esc'),
                const SizedBox(width: 2),
                _buildKeyButton('/'),
                const SizedBox(width: 2),
                _buildKeyButton(':'),
                const SizedBox(width: 2),
                _buildKeyButton('?'),
                const SizedBox(width: 2),
                _buildKeyButton('Home'),
                const SizedBox(width: 2),
                _buildKeyButton('↑'),
                const SizedBox(width: 2),
                _buildKeyButton('End'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildKeyButton('Tab'),
                const SizedBox(width: 2),
                _buildKeyButton('Ctrl+C'),
                const SizedBox(width: 2),
                _buildKeyButton('-'),
                const SizedBox(width: 2),
                _buildKeyButton('!'),
                const SizedBox(width: 2),
                _buildKeyButton('←'),
                const SizedBox(width: 2),
                _buildKeyButton('↓'),
                const SizedBox(width: 2),
                _buildKeyButton('→'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
