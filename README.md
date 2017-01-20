# Butterflow
## Features:
1. Make **motion interpolated videos** (*increase a video's frame rate by rendering new frames based on motion through a combination of pixel-warping and blending*).
2. Make **smooth motion videos** (*simple blending between frames*).
3. Leverage interpolated frames to make **fluid slow motion** videos.

## How it works:
BF works by rendering intermediate frames between existing frames using a process called [motion interpolation](http://en.wikipedia.org/wiki/Motion_interpolation). For example, given two existing frames, `A` and `B`, this program can generate frames `C.1`, `C.2`...`C.n` that are positioned between the two. In contrast to other tools that can only *blend or dupe* frames, this program *warps pixels based on motion* to generate new ones.

BF uses these interpolated frames to increase a video's frame rate, which can give the perception of smoother motion and more fluid animation, an effect that most people know as the "soap opera effect".

Here's a demo of BF leveraging motion interpolation to make a fluid slow motion video:

![](http://srv.dthpham.me/static/bf-example-1.gif)

In this example, BF has slowed down a `1s` video down by `10x`. An additional `270` frames were interpolated from `30` original source frames giving the video a smooth feel during playback. The same video was slowed down with FFmpeg alone (shown on the right-hand side), but because it dupes frames and can't interpolate new ones the video has a noticeable stutter.

Here's another example of the same concept. Frame-stepping through the BF'd file would make the interpolated frames, marked `Int: Y`, more obvious.

![](http://srv.dthpham.me/static/bf-example-2.gif)

See the script used to make these demos [here](https://github.com/dthpham/butterflow/tree/master/make_samples.sh).

## How to install:
**Important:** BF only works on 64-bit systems.

* **Mac OS X:** With [Homebrew](http://brew.sh/), `brew install homebrew/science/butterflow`.
* **Windows (Portable)**: Download [butterflow-0.2.2.dev0-alpha.1.7z](http://srv.dthpham.me/butterflow/releases/win/butterflow-0.2.2.dev0-alpha.1.7z).
  * Sha256: 12174d3c1d6cfba5a2a21866f2fe312a0d9e12f53955dff872f48dd6682dd1a9
* **Arch Linux:** A package is available in the AUR under [`butterflow`](https://aur.archlinux.org/packages/butterflow/).
* **From Source (Ubuntu, Debian):** Refer to the [Install From Source Guide](https://github.com/dthpham/butterflow/blob/master/docs/Install-From-Source-Guide.md) for instructions.

## Setup (recommended):
**Note:** No setup is necessary on OS X or Windows. Read [this](https://github.com/dthpham/butterflow/blob/master/docs/Setting-Up-OpenCL.md#os-x-mavericks-and-newer) if you run into a problem with OpenCL on OS X.

BF requires no additional setup to use, however it's too slow out of the box to do any serious work. It's recommended that you set up a functional OpenCL environment on your machine so you can take advantage of hardware accelerated methods that will make rendering significantly faster.

See: [Setting up OpenCL](https://github.com/dthpham/butterflow/blob/master/docs/Setting-Up-OpenCL.md) for details on how to do this.

## Usage:
Run `butterflow -h` for a full list of options. See: [Example Usage](https://github.com/dthpham/butterflow/blob/master/docs/Example-Usage.md) for typical commands.

## More documentation:
Check the [docs folder](https://github.com/dthpham/butterflow/tree/master/docs).
