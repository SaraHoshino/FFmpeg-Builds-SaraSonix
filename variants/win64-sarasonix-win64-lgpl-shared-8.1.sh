#!/bin/bash
# SaraSonix v0.12.5 minimal FFmpeg experiment.

source "$(dirname "$BASH_SOURCE")"/windows-install-shared.sh
source "$(dirname "$BASH_SOURCE")"/defaults-lgpl-shared.sh

GIT_BRANCH="n8.1.3"

# Start with a minimal FFmpeg feature surface.
FF_CONFIGURE+=" --disable-everything"

# Programs needed for the runtime and validation.
FF_CONFIGURE+=" --enable-ffmpeg --enable-ffprobe"

# Local files only.
FF_CONFIGURE+=" --enable-protocol=file"

# SaraSonix audio / MediaRecorder inputs.
FF_CONFIGURE+=" --enable-demuxer=matroska,mp3,wav,flac,aac,mov,ogg"
FF_CONFIGURE+=" --enable-decoder=vp8,vp9,opus,mp3,mp3float,flac,aac,vorbis,alac,pcm_s16le,pcm_s24le,pcm_s32le,pcm_f32le,pcm_f64le"
FF_CONFIGURE+=" --enable-parser=vp8,vp9,opus,mpegaudio,aac,vorbis,flac"

# SaraSonix MP4 output.
FF_CONFIGURE+=" --enable-muxer=mp4"
FF_CONFIGURE+=" --enable-encoder=aac"

# Export filters.
FF_CONFIGURE+=" --enable-filter=pad,format"
FF_CONFIGURE+=" --enable-swscale --enable-swresample --enable-avfilter"

# Windows H.264 hardware encoders + CPU fallback.
FF_CONFIGURE+=" --enable-ffnvcodec"
FF_CONFIGURE+=" --enable-nvenc"
FF_CONFIGURE+=" --enable-amf"
FF_CONFIGURE+=" --enable-libvpl"
FF_CONFIGURE+=" --enable-libopenh264"
FF_CONFIGURE+=" --enable-encoder=h264_nvenc,h264_amf,h264_qsv,libopenh264"

# Keep GPL/nonfree codecs out of this build.
FF_CONFIGURE+=" --disable-libx264 --disable-libx265 --disable-nonfree"
FF_CONFIGURE+=" --disable-avisynth"
