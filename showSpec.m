function [tfreq, tval]=showSpec(signal,  speed, fs,visible, fsol)
if nargin==4
    fsol=1;
end
%speed=1748;
[tfreq, tval]=calcSpec(signal,fs,fsol,speed,visible);
end