close
figure
load('20180827_JJL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y)
axis([0 500 0 0.5]);
% title('JJL 180827')
load('20180827_BK_subj002_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 500 0 0.5]);
% title('BK 180827')
load('20180827_LK_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y)
axis([0 500 0 0.5]);
% title('LK 180827')

figure
load('20180829_SYL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 500 0 0.5]);
% title('SYL 180829')
