# GEMINI.md

This file provides guidance to Gemini when working with code in this repository.

## Development Commands

### Build Commands

* `cargo run` - Build and run the desktop application (requires libsciter library)
* `python3 build.py --flutter` - Build Flutter version (desktop)
* `python3 build.py --flutter --release` - Build Flutter version in release mode
* `python3 build.py --hwcodec` - Build with hardware codec support
* `cargo build --release` - Build Rust binary in release mode

### Flutter Mobile Commands

* `cd flutter && flutter build android` - Build Android APK
* `cd flutter && flutter build ios` - Build iOS app
* `cd flutter && flutter run` - Run Flutter app in development mode
* `cd flutter && flutter test` - Run Flutter tests

### Testing

* `cargo test` - Run Rust tests
* `cd flutter && flutter test` - Run Flutter tests

### Platform-Specific Build Scripts

* `flutter/build_android.sh` - Android build script
* `flutter/build_ios.sh` - iOS build script
* `flutter/build_fdroid.sh` - F-Droid build script

## Project Architecture

### Directory Structure

* **`src/`** - Main Rust application code
* `src/ui/` - Legacy Sciter UI (deprecated, use Flutter instead)
* `src/server/` - Audio/clipboard/input/video services and network connections
* `src/client.rs` - Peer connection handling


* **`flutter/`** - Flutter UI code for desktop and mobile
* `flutter/lib/mobile/` - **Target for Toolbar Injection.**
* `flutter/lib/common/` - Shared logic and Enhanced Features settings.


* **`libs/`** - Core libraries
* `libs/hbb_common/` - Video codec, config, network wrapper, and `config.rs`.
* `libs/enigo/` - Platform-specific keyboard/mouse control.



### Key Components

* **Remote Desktop Protocol**: Custom protocol for communicating with rustdesk-server.
* **Input Handling**: Cross-platform input simulation in `libs/enigo/`.
* **Audio/Video Services**: Real-time audio/video streaming in `src/server/`.

### UI Architecture

* **Modern UI**: Flutter-based - files in `flutter/`
* Desktop: `flutter/lib/desktop/`
* Mobile: `flutter/lib/mobile/`
* Shared: `flutter/lib/common/` and `flutter/lib/models/`



## Important Build Notes

### Dependencies

* Requires vcpkg for C++ dependencies: `libvpx`, `libyuv`, `opus`, `aom`
* Set `VCPKG_ROOT` environment variable on OptiPlex-7040.
* Android NDK is required for `cargo ndk` mobile builds.

### Ignore Patterns

When working with files, ignore these directories:

* `target/` - Rust build artifacts
* `flutter/build/` - Flutter build output
* `flutter/.dart_tool/` - Flutter tooling files

### Feature Flags

* `hwcodec` - Hardware video encoding/decoding
* `flutter` - Enable Flutter UI