# example

A model assistance code file generation sample by the build_runner.

## Getting Started

Open a terminal and move to the example directory.  
Execute `pub get` command.  
And more execute `pub run build_runner build --delete-conflicting-outputs` command, for generate to assistant code files.  
It will create two files `lib/src/model_daifuku.model_assist.g.dart` and `lib/src/model_chocolate.model_assist.g.dart`.  

now then you can run this sample by `dart lib/main.dart` command with using `DaifukuBase` and `ChocolateBase` classes.  

- if you will executed `pub run build_runner clean` then generated two files `model daifuku.model_assist.g.dart` and `model chocolate.model_assist.g.dart` are deleted.  
- and you can recreate these files are only execute `pub run build_runner built` command.