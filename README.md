# dialog_loader

<p align="left">
<a href="https://github.com/sud0su/dialog_loader"><img src="https://img.shields.io/pub/v/dialog_loader.svg" alt="Pub Package"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

An easy way to create a loader, you can easily combine the loader with popular state management.


## New Features 💥
- The barrierDismissible default set to false on loading and will be automatically set to true when the load is complete.
- Asset file / Image network support on the loader.
  
## Installation
Include dialog_loader in your pubspec.yaml file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  dialog_loader: version
```

Now in your Dart code, you can use:

```dart
import 'package:dialog_loader/dialog_loader.dart';
```
## Preview


 LoaderTheme.dialogDefault         |  LoaderTheme.dialogCircle
:-------------------------:|:-------------------------:
![](https://raw.githubusercontent.com/sud0su/dialog_loader/main/assets/1.gif) | ![](https://raw.githubusercontent.com/sud0su/dialog_loader/main/assets/2.gif)

 LoaderTheme.dialogDefault (left and right icon)         |  LoaderTheme.dialogCircle (Image network)
:-------------------------:|:-------------------------:
![](https://raw.githubusercontent.com/sud0su/dialog_loader/main/assets/3.gif) | ![](https://raw.githubusercontent.com/sud0su/dialog_loader/main/assets/4.gif)

**with the dialog loader package, you can easily combine the loader with popular state management on handling state updating, like loading, error, and success state.**
## Usage

[You can review the example of usage from the Github repo.](https://github.com/sud0su/dialog_loader/tree/main/example/)

Create a new instance, pass the context as parameter.

```dart
  @override
  Widget build(BuildContext context) {
    DialogLoader dialogLoader = DialogLoader(context: context);
```

Create the default option of the loader
```dart
_dialogLoader(context) async {
      dialogLoader.show(
        theme: LoaderTheme.dialogCircle,
        title: Text("Loading"),
        leftIcon: SizedBox(
          child: CircularProgressIndicator(),
          height: 25.0,
          width: 25.0,
        ),
      );
    }

```

You don't need to update state, just pass the value.
```dart
void _update() {
      _dialogLoader(context);
      Future.delayed(const Duration(seconds: 4), () {
        dialogLoader.update(
          title: Text("Done"),
          leftIcon: Icon(Icons.done),
          autoClose: false,
          barrierDismissible: true,
        );
      });
    }
```


### Constructor
|  Name | Description   | Required   | Default   |
| ------------ | ------------ | ------------ | ------------ |
| context  | Buildcontext to render the dialog | True   |   |

### Properties
|  Name | Description   | Required   | Default   |
| ------------ | ------------ | ------------ | ------------ |
| theme  | Loader theme | False   | LoaderTheme.dialogDefault,  |
| title  | Widget title |  False  |  Container() |
| leftIcon  | Widget on the left side of the loader, and at the top for dialogCircle theme | False   | Container() |
| rightIcon  | Widget on the right side of the loader | False   | Container() |
| barrierColor  | Barrier Color of the loader| False   | Colors.black26 |
| borderRadius  | Double value to indicate the dialog border radius | False   |  5.0 |
| backgroundColor  | Double value to indicate the dialog background color | False   | Colors.white  |
| elevation  |  Double value to indicate the elevation border | False   | 5.0  |
| autoClose  |  Boolean value to indicate auto Close the loader when the processing is complete | False   | true  |
| barrierDismissible  |  Boolean value to indicate barrierDimisable on dialog | False   | false  |

---

## Donate
You like the package ? Buy me a coffee :)


<a href="https://ko-fi.com/sud0su" target="_blank">
    <img src="https://raw.githubusercontent.com/hacktons/convex_bottom_bar/master/doc/donate-kofi1.png" alt="buymeacoffe" style="vertical-align:top; margin:8px" height="40">
</a>
  
<a href="https://www.buymeacoffee.com/sud0su" target="_blank">
    <img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg" alt="buymeacoffe" style="vertical-align:top; margin:8px" height="40">
</a>
  