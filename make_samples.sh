#!/bin/bash

#BF=./butterflow-0.2.2.dev0-alpha.1/butterflow.exe
BF=butterflow

generate() {
  $BF -a -l -s a=0,b=end,spd=0.1 $1 -o a.mp4
  ffmpeg -y -ss 0 -t 1 -i $1 -filter:v "setpts=10*PTS" -c:v libx264 -qp 0 b.mp4
  ffmpeg -y -i a.mp4 -i b.mp4 -filter_complex \
  "[0:v]setpts=PTS-STARTPTS, \
  pad=iw*2:ih[left]; [1:v]setpts=PTS-STARTPTS[right]; \
  [left][right]overlay=overlay_w" \
  -an -sn -c:v libx264 -preset veryslow -crf 18 side.mp4
  ffmpeg -y -i side.mp4 -vf scale=-2:200 $2.gif
  echo "Done"
}

if [ ! -f blow.mp4 ]; then
  curl -O https://dl.dropboxusercontent.com/u/103239050/blow.mp4
fi
generate blow.mp4 blow
if [ ! -f ink.mp4 ]; then
  curl -O https://dl.dropboxusercontent.com/u/103239050/ink.mp4
fi
generate ink.mp4 ink
