% Touch
%behav_results_touch-1
close
figure
suptitle('Touch result 1')
load('20180827_JJL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y)
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('JJL 180827')
load('20180827_BK_subj002_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y)
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('BK 180827')
load('20180827_LK_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y)
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('LK 180827')

%behav_results_touch-2
close
figure
suptitle('Touch result 2')
load('20180829_SYL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 530 -0.1 0.8]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SYL 180829')
load('20180901_DEL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('DEL 180901')
load('20180901_SYL_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SYL 180901')

%behav_results_touch-3
close
figure
suptitle('Touch result 3')
load('20180827_SHG_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SHG 180827')
load('20180828_YWH_subj002_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 600 -0.1 0.5]);xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('YWH 180828')
load('20180903_HBK_subj002_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 500 -0.1 0.5]);
% title('HBK 180903')

%behav_results_touch-4
close
figure
suptitle('Touch result 4')
load('20180905_JHH_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 800 -0.1 0.5]);
% title('JHH 180905')
load('20180905_JWP_subj001_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 500 -0.1 0.7]);
% title('JWP 180905')
load('20180907_HJK_subj002_behav_dat_touch.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 500 0 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('HJK 180904')


% Sweet
%behav_results_sweet-1
close
figure
suptitle('Sweet result 1')
load('20180901_DEL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 700 -0.3 0.6]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('DEL 180901')
load('20180901_SYL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 600 -0.3 0.4]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SYL 180901')
load('20180903_SWL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 600 -0.3 0.8]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SWL 180903')

%behav_results_sweet-2
close
figure
suptitle('Sweet result 2')
load('20180904_SHG_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 500 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SHG 180904')
load('20180904_JJL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 600 -0.1 0.7]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('JJL 180904')
load('20180904_BK_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 600 -0.1 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('BK 180904')

%behav_results_sweet-3
close
figure
suptitle('Sweet result 3')
load('20180905_JHH_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,1);
plot(x,y) 
axis([0 500 -0.1 0.6]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('JHH 180905')
load('20180905_HBK_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,2);
plot(x,y) 
axis([0 500 -0.1 0.6]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('HBK 180905')
load('20180905_SYL_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(3,1,3);
plot(x,y) 
axis([0 500 -0.1 0.6]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('SYL 180905')

%behav_results_sweet-4
close
figure
suptitle('Sweet result 4')
% load('20180907_YWH_subj001_behav_dat_sweet.mat')
% x = data.dat.time_fromstart;
% y = data.dat.cont_rating;
% subplot(3,1,1);
% plot(x,y) 
% axis([0 500 0 0.5]);
% xlabel('time (secs)', 'FontSize', 10);
% ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('YWH 180907')
load('20180907_HJK_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(2,1,1);
plot(x,y) 
axis([0 500 0 0.5]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('HJK 180907')
load('20180905_JWP_subj001_behav_dat_sweet.mat')
x = data.dat.time_fromstart;
y = data.dat.cont_rating;
subplot(2,1,2);
plot(x,y) 
axis([0 500 -0.5 0.1]);
xlabel('time (secs)', 'FontSize', 10);
ylabel('rating (-1 ~ 1)', 'FontSize', 10);
% title('JWP 180905')

% load('20180904_LK_subj001_behav_dat_sweet.mat')
% x = data.dat.time_fromstart;
% y = data.dat.cont_rating;
% subplot(3,1,3);
% plot(x,y) 
% axis([0 500 0 0.5]);
% % title('LK 180904')
