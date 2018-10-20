function plot_defect_freq(bpf,nbpf,color,side,nside,colors)
%       Plot vertical line of bearing defect frequency in the spectrum
%           by Eric, 04 Apr 06
%
ymax=get(gca,'Ylim');
xmax=get(gca,'Xlim');
for ii=1:nbpf
    line([bpf*ii bpf*ii],ymax,'LineStyle','-.','Color',color);
    if nargin>3 % Sideband
        for jj=1:nside
%             line([bpf*ii-side*jj bpf*ii-side*jj],ymax,'LineStyle',':','Color',colors);
            line([bpf*ii+side*jj bpf*ii+side*jj],ymax,'LineStyle',':','Color',colors);
        end
    end
end