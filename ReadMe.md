# Mile.FramelessHelper

Work In Progress.

Customized version of FramelessHelper created by Yuhang Zhao.

## Features

- Use [VC-LTL 5.x](https://github.com/Chuyu-Team/VC-LTL5) toolchain to make the
  binary size smaller.
- Use [YY-Thunks](https://github.com/Chuyu-Team/YY-Thunks) toolchain to achieve
  the Windows Vista RTM (Build 6000) support.

## Usage

Please set the YYTHUNKS_INSTALL_DIR environment variable the to path of
[the latest YY-Thunks binaries](https://github.com/Chuyu-Team/YY-Thunks/releases/latest)
without double quotation mark before compile x86 and x64 targets of Mile.Qt.

Please set the QtBinaryFolder environment variable the to path of Qt6 toolchain
binaries.

After set the environment variable, run onekey-build-*.bat which you want.

## System Requirements

- Supported OS: Windows Vista RTM (Build 6000) or later
- Supported Platforms: x86, x86-64(AMD64) and ARM64 (experimental).

## Documents

- [License](License.md)

## Credits

Note: This list sort in alphabetical order.

- Kenji Mouri, https://github.com/MouriNaruto
- Yuhang Zhao, https://github.com/wangwenx190
