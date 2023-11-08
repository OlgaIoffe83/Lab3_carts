
function fft_plot(x,fs,ax)

n = length(x);
fshift = (-n/2:n/2-1)*(fs/n);

y = fft(x);
yshift = fftshift(y);
power = abs(yshift).^2/n; 

plot(ax, fshift,power)
hold on
xlabel('Frequency (Hz)')
ylabel('Power')
xlim([0 fs/2])