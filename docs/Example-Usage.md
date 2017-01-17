# Example Usage
**Tip:** Run `butterflow -h` for a full list of options and their default values.

### Altering the global playback rate:
#### Examples:
1. Double a video's frame rate with `butterflow -r2x <video>`.
 * `-r` sets the global playback rate.
 * `-r3x` would triple the frame rate, and `-r4x` would quadruple the frame rate, etc.
2. Set a video's frame rate to 60fps with `butterflow -r60 <video>`.
4. Set a fractional frame rate: `butterflow -r 24/1.001 <video>`.
 * This is the same as `butterflow -r 23.976 <video>`.

**Note:** In general, frames will be interpolated if the frame rate is increased, otherwise they will be dropped.

### Altering speed, duration, and region fps:
#### Examples:
1. Set a video to 0.25x speed with `butterflow -s a=0,b=end,spd=0.25 <video>`.
 * `-s` specifies a subregion to work on.
 * `end` is a special keyword that signifies "to the end of the video".
 * `spd` is what we're targeting in the region.
 * Since the playback rate is unchanged, `-r` is not set, this would produce a video with 4x more frames, all interpolated.
2. Set a video's duration to be 8s long with `butterflow -s a=0,b=end,dur=8 <video>`.
3. Create 200 frames for every 1s of video with `butterflow -s a=0,b=end,fps=200 <video>`.
 * `fps` is different from `-r`, which sets the global playback rate.

**Note:** In most cases, slowing a video down or extending its duration will cause frames to be interpolated, otherwise they will be dropped.

### Working on one region:
#### Examples:
1. Double the frame rate on a 1s region with `butterflow -r2x -s a=1:30:24,b=1:30:25,spd=1 <video>`.
 * Setting `spd=1` will not alter the video's speed.
2. Slowmo a 1s region to 0.5x speed with `butterflow -s a=5,b=6,spd=0.5 <video>`.
3. Double the frame rate on a 1s region *and* slow it down: `butterflow -r 2x -s a=0,b=1,spd=0.5x <video>`.
 * Assume the video's original frame rate was 24fps. This command would create an output video with 24\*2\*2 frames.
4. Work on the whole video (the entire region) with `butterflow -s a=0,b=end,spd=0.9`.
 * This command is the same as `butterflow -s full,spd=0.9`.

**Tip:** Rendering will be faster if you're working on smaller regions so use `-s` on small segments of a video when you need to do quick tests. Scaling the video down with `-vs` is another way to speed up rendering.

**Tip:** The `-k` option will render regions that are not explicitly specified into the output video at 1x speed (the playback rate still applies across these regions).

### Multiple regions:
Separate regions with a colon `:`.

#### Examples:
* With two regions: `butterflow -s a=1,b=2,spd=0.5:a=9,b=end,spd=0.5 <video>`.
* With 4 regions: `butterflow -s a=0,b=6,spd=0.125:a=6,b=6.8,dur=3:a=6.8,b=7,dur=0.4:a=20,b=end,fps=200 <video>`.

## Robustness of image:
Butterflow uses the Farneback algorithm to compute dense optical flows for frame interpolation. You can pass in different values to the function to fine-tune the quality (robustness of image) of the resulting videos.

**Tip:** Use the `-sm` flag if having artifact-less frames is a priority. This will tune settings to emphasize blending frames over the default behavior of warping pixels.
