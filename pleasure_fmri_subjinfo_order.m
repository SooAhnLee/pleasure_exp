function [SID, SubjNum, order] = pleasure_fmri_subjinfo_order

SID = input('\nSubject ID? : ', 's');
SID = strtrim(SID);
SubjNum = input('\nSubject number? : ');
% SubjRun = input('\nRun number? : ');

basedir = pwd;
cd(basedir); addpath(genpath(basedir));

% version 1
rundatdir = fullfile(basedir, 'Pleasure_randomized_run_data_v1.mat');
load(rundatdir, 'Runs_randomized');
order = strtrim(Runs_randomized(SubjNum,:));

% version 2
% Runs = {'REST', 'CAPS', 'QUIN', 'SWEET', 'TOUCH'};
% for i = 1:80
%     order{i} = Runs(randperm(5)); % produce a randomized order
% end
% order = Runs(randperm(5));

SubjInfo_Order.SID = SID;
SubjInfo_Order.SubjNum = SubjNum;
SubjInfo_Order.order = order; 

nowtime = clock;
SubjDate = sprintf('%.2d%.2d%.2d', nowtime(1), nowtime(2), nowtime(3));
save_subjinfo_order = fullfile(basedir, [SubjDate, '_', SID, '_PLS', sprintf('%.3d', SubjNum), '_SubjInfo_Order.mat']);
save(save_subjinfo_order, 'SubjInfo_Order');

end