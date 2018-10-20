function [tfreq, tval]=calcSpec(signal, fs, fsol, speed, visible)

defectfreq = [5.2419 7.7581 2.4866*2];       % defect frequencies at 900 RPM (outer, inner, roller)
Dfreq = [speed defectfreq.*speed/60];   % defect frequencies at operaing speed

outH = hilbert(signal);
outh = abs(outH);
% outh=rcfs;

% power spectrum
fsig = fft(outh, fs*fsol);
magsig = abs(fsig(1:(fs*fsol)/2));
tval = magsig.^2;

tfreq = (0: 1/fsol : (fs/2)+1);
tfreq = tfreq(1:length(tval));
ob_fr = uint16(max(Dfreq(2:end))*3.5*fsol);

if visible==1
%     norm_tval=tval(1:ob_fr);
%     norm_tval=(norm_tval-min(norm_tval(2*fsol:end)))/(max(norm_tval(2*fsol:end))-min(norm_tval(2*fsol:end)));
    figure, plot(tfreq(1:ob_fr), tval(1:ob_fr));

    max_disp_freq = max(Dfreq(2:end))*3.5;
    xlim([0 max_disp_freq]);
    ylim([0 max(tval(2*fsol:ob_fr))*1.3]);
    plot_defect_freq(Dfreq(4),4,'r');      % roller fault frequency
    plot_defect_freq(Dfreq(3),3,'g');      % inner fault frequency
    plot_defect_freq(Dfreq(2),4,'k');      % outer fault frequency
%     legend('Roller','Inner','Outer');
    xlabel('Frequency [Hz]')
    ylabel('Amplitude')
end