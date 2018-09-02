clc;
clear;
close all;
%% EXPERIMENT %%
%% Subject info & load run ordert

[SID, SubjNum, order] = pleasure_fmri_subjinfo_order;

%% MAIN %%
%% T1

pleasure_fmri_t1(SID, SubjNum);

%% Main
%% Run 1

run_i = 1;
pleasure_fmri_task_main(SID, SubjNum, order(run_i), 'explain', 'practice', 'run') %, 'eyelink', 'biopac')

%% RUN 2

run_i = 2;
pleasure_fmri_task_main(SID, SubjNum, order(run_i), 'explain', 'practice', 'run'); % 'eyelink', 'biopac')

%% RUN 3

run_i = 3;
pleasure_fmri_task_main(SID, SubjNum, order(run_i), 'explain', 'practice', 'run', 'eyelink', 'biopac')

%% RUN 4

run_i = 4;
pleasure_fmri_task_main(SID, SubjNum, order(run_i), 'explain', 'practice', 'run', 'eyelink', 'biopac')

%% RUN 5

run_i = 5;
pleasure_fmri_task_main(order(run_i), 'explain', 'practice', 'run', 'eyelink', 'biopac')

%% SEND DATA

% Send mail (mail address, title of mail, contents, attachments files )
% e.g, sendmail(rec_mail,[sbj datestr(now)],[sbj datestr(now)
% 'data_files'], {Cali_dir, Learn_dir, Main_dir, Mot_dir });

rec_mail = 'pbc1159@daum.net'; %Sooan's daum mail
% message
msg_title = ['MRI_experiment_' sbj '_' datestr(now)];
msg_text = ['MRI_experiment' 10 ...
    'Subject Name:' SID 10 ...
    'Time:' datestr(now) 10 ...
    'data_files'];
% Attach files
attachment = CheFiles(data_dir);
sendmail(rec_mail, msg_title, msg_text, attachment);

%final_msg = strcat('Send total files\n',num2str(numel(attachment)),'see detatis:''\n',attachment, '\n:::');
clc;
fprintf('=======================Send total %d files================================\n',numel(attachment));
fprintf('DETAILS:\n');
fprintf(['Subject name:' sbj '\n']);
fprintf(string(attachment));
fprintf('\n');

% Function 'attachment'
function attachment = CheFiles(data_dir)
data_dir = {fullfile(pwd,'Data',['20180831_SAL_subj001_run04.mat'])};
ii = 1;
for i = 1:length(data_dir)
    if exist(data_dir{1,i},'file')
        attachment{1, ii} = data_dir{1,i};
        ii = ii+1;
    end
end
end
