import 'package:flutter/material.dart';
//=============================================================//
// Used to manage the global loading state and show a 
// loading overlay whenever needed.
//=============================================================//

class GlobalLoaderManager extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void show() {
    if (!_isLoading) {
      _isLoading = true;
      notifyListeners();
    }
  }

  void hide() {
    if (_isLoading) {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class GlobalLoader extends StatelessWidget {
  final GlobalLoaderManager manager;
  const GlobalLoader({required this.manager, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: manager,
      builder: (context, _) {
        if (!manager.isLoading) return const SizedBox.shrink();
        return const Stack(
          children: [
            ModalBarrier(
              dismissible: false,
              color: Colors.black45,
            ),
            Center(child: CircularProgressIndicator.adaptive()),
          ],
        );
      },
    );
  }
}
