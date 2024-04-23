@echo off
%~dp0ffmpeg.exe -hide_banner -i %1 -af aresample=32000:resampler=soxr:dither_scale=1:dither_method=improved_e_weighted:precision=28:cutoff=1 -vn -c:a pcm_f32le -f f32le - | %~dp0oggenc2.exe -r -F 3 -B 32 -R 32000 -q 0.571429 --advanced-encode-option impulse_noisetune=0 --advanced-encode-option impulse_trigger_profile=6 --advanced-encode-option lowpass_frequency=99 -o %1.ogg -
%~dp0optivorbis.exe %1.ogg %~n1.ogg
del /Q %1.ogg
