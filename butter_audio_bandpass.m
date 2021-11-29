Fcp_low=750;  %lower cutoff frequency
Fcp_high=6000;  %higher cutoff frequency
Fsp=44100;
signal=w;


[z,p,k]=butter(8,[Fcp_low Fcp_high]/(Fsp/2),'bandpass');
[sos,g]=zp2sos(z,p,k);
%fvtool(sos,'Analysis','freq')
data_filt=filtfilt(sos,g,signal);

filename = 'prueba_A_L1_comp.wav';
audiowrite(filename,w,fs);