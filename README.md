RadioListTile Widget Demo : Trivia Quiz

A tiny Flutter app that shows the RadioListTile widget in action: answer a trivia question by picking one option, then tap Submit to see if you got it right.

How to run

1. Make sure you have Flutter installed (run "flutter --version" to check).

2. Clone this repo and move into the folder:

   git clone https://github.com/tdorcas-akim/RadioListTile-widget.git
   
   cd radiolisttile_widget


3. Get the dependencies:

   flutter pub get


4. Run the app on a connected device/emulator:

   flutter run

The three attributes demonstrated

1. value / groupValue : each tile has its own value; all tiles
share one groupValue. Only the tile whose value matches
groupValue is selected, which keeps the choice mutually exclusive.

2. activeColor : sets the color of the radio circle once selected.
Demo includes color dots to change it live.

3. controlAffinity : sets whether the radio circle appears on the
left (leading) or right (trailing) of the option text. Demo
includes a switch to toggle it live.


Credits

Built following the official Flutter RadioListTile class
documentation:
https://api.flutter.dev/flutter/material/RadioListTile-class.html

Screenshot

<img width="275" height="537" alt="image" src="https://github.com/user-attachments/assets/4a5e993a-0e23-40ce-ace8-1ce0f8e05d17" />

