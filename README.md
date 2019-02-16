# do_dart BETA

[![Pub](https://img.shields.io/pub/v/dio.svg?style=flat-square)](https://pub.dartlang.org/packages/dodart)
[![support](https://img.shields.io/badge/platform-flutter%7Cdart%20vm-ff69b4.svg?style=flat-square)](https://github.com/flutterchina/dio)

A Dart SDK for the DigitalOcean Api v2

```yaml
dependencies:
  do_dart: ^0.0.2 #latest version
```

## Easy to use

To get started, you need a DigitalOcean API key with sufficient privileges for the tasks you want to perform.

Then:
Initializing the client
```dart
import 'package:do_dart/do_dart.dart';

Client client = Client(<DigitalOcean API Key>);
```


## Examples

Initializing the client
```dart
import 'package:do_dart/do_dart.dart';

Client client = Client(<DigitalOcean API Key>);
```

Creating a droplet
```
DropletCreateRequest dcr =
        DropletCreateRequest("test-droplet", 'nyc1', 's-1vcpu-1gb', 43515152, ssh_keys: [<SSH KEY ID or Fingerprint]);

Droplet d = await client.droplet.create(dcr);
```

## Copyright & License

The license is MIT.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/dlombard/do_dart/issues