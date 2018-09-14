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

