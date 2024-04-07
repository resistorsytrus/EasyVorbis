@echo off
%~dp0ffmpeg.exe -hide_banner -i %1 -af aresample=32000:resampler=soxr:dither_scale=1:dither_method=improved_e_weighted:precision=28:cutoff=1 -vn -c:a pcm_f32le %1.wav
%~dp0venc.exe -q0.571429 -lowpass=99 -ibtune=-15 %1.wav
del /Q %1.wav
%~dp0optivorbis.exe %1.ogg %~n1.ogg
del /Q %1.ogg
