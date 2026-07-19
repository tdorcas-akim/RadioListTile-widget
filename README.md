RadioListTile Widget Demo: Trivia Quiz

A tiny Flutter app that shows the RadioListTile widget in action: answer a trivia question by picking one option, then tap Submit to see if you got it right.

How to run

Make sure you have Flutter installed (run "flutter --version" to check).
Clone this repo and move into the folder:

   git clone https://github.com/tdorcas-akim/RadioListTile-widget.git
   
   cd radiolisttile_widget


Get the dependencies:

   flutter pub get


Run the app on a connected device/emulator:

   flutter run

The three attributes demonstrated


value / groupValue : each tile has its own value; all tiles
share one groupValue. Only the tile whose value matches
groupValue is selected, which keeps the choice mutually exclusive.

activeColor : sets the color of the radio circle once selected.
Demo includes color dots to change it live.

controlAffinity : sets whether the radio circle appears on the
left (leading) or right (trailing) of the option text. Demo
includes a switch to toggle it live.


Credits

Built following the official Flutter RadioListTile class
documentation:
https://api.flutter.dev/flutter/material/RadioListTile-class.html
