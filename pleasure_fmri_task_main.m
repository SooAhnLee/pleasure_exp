function pleasure_fmri_task_main(SID, SubjNum, type, varargin)

%% SETUP : Basic parameters

global theWindow W H window_ratio  %window property
global lb rb scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color

basedir = pwd;
cd(basedir);
addpath(genpath(basedir));

explain = false;
practice = false;
run = false;
USE_EYELINK = false;
USE_BIOPAC = false;

%% PARSING VARARGIN

for i = 1:length(varargin)
    if ischar(varargin{i})
        switch varargin{i}
            % functional commands
            case {'explain'}
                explain = true;
            case {'practice'}
                practice = true;
            case {'run'}
                run = true;
                %             case {'savedir'}
                %                 savedir = varargin{i+1};
            case {'eyelink', 'eye', 'eyetrack'}
                USE_EYELINK = true;
            case {'biopac'}
                USE_BIOPAC = true;
                channel_n = 3;
                biopac_channel = 0;
                ljHandle = BIOPAC_setup(channel_n); % BIOPAC SETUP
        end
    end
end

%% SETUP : Check subject information & load run order

SubjRun = input('\nRun number? : ');

%% SETUP : Save data according to subject information

savedir = fullfile(basedir, 'Data');

nowtime = clock;
SubjDate = sprintf('%.2d%.2d%.2d', nowtime(1), nowtime(2), nowtime(3));

data.subject = SID;
data.datafile = fullfile(savedir, [SubjDate, '_', SID, '_subj', sprintf('%.3d', SubjNum), ...
    '_run', sprintf('%.2d', SubjRun), '.mat']);
data.version = 'Pleasure_v1_08-27-2018_Cocoanlab';
data.starttime = datestr(clock, 0);
data.starttime_getsecs = GetSecs;

% if the same file exists, break and retype subject info
if exist(data.datafile, 'file')
    fprintf('\n ** EXSITING FILE: %s %s **', data.subject, SubjDate);
    cont_or_not = input(['\nYou type the run number that is inconsistent with the data previously saved.', ...
        '\nWill you go on with your run number that typed just before?', ...
        '\n1: Yes, continue with typed run number.  ,   2: No, it`s a mistake. I`ll break.\n:  ']);
    if cont_or_not == 2
        error('Breaked.')
    elseif cont_or_not == 1
        save(data.datafile, 'data');
    end
else
    save(data.datafile, 'data');
end

%% SETUP : Create paradigm according to subject information

S.type = type;
% S.dur = 15*60 - 10; % 15 mins - 10 secs for disdaq
S.dur = 10;

S.changecolor = [10:60:S.dur];
changecolor_jitter = randi(10, 1, numel(S.changecolor));
S.changecolor = S.changecolor + changecolor_jitter;
S.changetime = 1; % duration of color change : 1 sec

rating_types_pls = call_ratingtypes_pls;

data.dat.type = S.type;
data.dat.duration = S.dur;
data.dat.changecolor = S.changecolor;
data.dat.changetime = S.changetime;

%% SETUP: Save eyelink filename according to subject information

% need to be revised when the eyelink is here.
if USE_EYELINK
    
    edf_filename = ['E_' SID '_' SubjNum]; % name should be equal or less than 8
    edfFile = sprintf('%s.EDF', edf_filename);
    eyelink_main(edfFile, 'Init');
    
    status = Eyelink('Initialize');
    if status
        error('Eyelink is not communicating with PC. It is okay baby.');
    end
    Eyelink('Command', 'set_idle_mode');
    waitsec_fromstarttime(GetSecs, .5);
    
end

%% SETUP : Screen

bgcolor = 100;
window_ratio = 3;

screens = Screen('Screens');
window_num = screens(end);
Screen('Preference', 'SkipSyncTests', 1);
screen_mode = 'testmode';
window_info = Screen('Resolution', window_num);
switch screen_mode
    case 'full'
        window_rect = [0 0 window_info.width window_info.height]; % full screen
        fontsize = 32;
    case 'semifull'
        window_rect = [0 0 window_info.width-100 window_info.height-100]; % a little bit distance
    case 'middle'
        window_rect = [0 0 window_info.width/2 window_info.height/2];
    case 'small'
        window_rect = [0 0 400 300]; % in the test mode, use a little smaller screen
        fontsize = 10;
    case 'test'
        window_rect = [0 0 window_info.width window_info.height]/window_ratio;
        fontsize = 20;
    case 'testmode'
        window_rect = [0 0 1240 800];
        fontsize = 26;
end

% size
W = window_rect(3); % width
H = window_rect(4); % height

lb = W*(1/6); % rating scale left bounds 1/6
rb = W*(5/6); % rating scale right bounds 5/6

scale_W = W*0.1;
scale_H = H*0.1;

anchor_lms = [W/2-0.01*(W/2-lb) W/2-0.06*(W/2-lb) W/2-0.18*(W/2-lb) W/2-0.35*(W/2-lb) W/2-0.5*(W/2-lb);
    W/2+0.01*(W/2-lb) W/2+0.06*(W/2-lb) W/2+0.18*(W/2-lb) W/2+0.35*(W/2-lb) W/2+0.5*(W/2-lb)];
%W/2-lb = rb-W/2

% color
% bgcolor = 50;
white = 255;
red = [158 1 66];
orange = [255 164 0];

% font
font = 'NanumBarunGothic';
Screen('Preference', 'TextEncodingLocale', 'ko_KR.UTF-8');

%% PROMPT SETUP:
% rating_types_pls.prompts_ex = ...
%     {
%     '지금부터 실험이 시작됩니다. 먼저, 실험을 진행하기에 앞서 평가 척도에 대한 설명을 진행하겠습니다.\n\n참가자는 모든 준비가 완료되면 버튼을 눌러주시기 바랍니다.', ...
%     '평가 예제 : 실험자는 평가 방법에 대해 충분히 설명한 후, 스페이스바를 눌러주시기 바랍니다.', ...
%     '평가 예제 : 참가자는 충분히 평가 방법을 연습한 후, 연습이 끝나면 버튼을 눌러주시기 바랍니다.', ...
%     };
% run_start_prompt = double('\n실험자는 모든 것이 잘 준비되었는지 체크해주세요 (Biopac, Eyelink, 등등).\n\n모두 준비되었으면, 스페이스바를 눌러주세요.');
% run_ready_prompt = double('참가자가 준비되었으면, 이미징을 시작합니다 (s).');
% run_end_prompt = double('잘하셨습니다. 잠시 대기해 주세요.');

%% Start : Screen
sca
theWindow = Screen('OpenWindow', window_num, bgcolor, window_rect); % start the screen
%Screen('TextFont', theWindow, font);
Screen('TextSize', theWindow, fontsize);

Screen(theWindow, 'FillRect', bgcolor, window_rect); % Just getting information, and do not show the scale.
Screen('Flip', theWindow);
HideCursor;

%% Start

try
    %% (Explain) Continuous
    
    % Explain scale with visualization
    
    if explain
        
        x = W/2; %center
        y = H*(5/8); %center*(3/2)
        
        while true % Button
            msgtxt = '지금부터 실험이 시작됩니다. 먼저, 실험을 진행하기에 앞서 평가 척도에 대한 설명을 진행하겠습니다.\n\n참가자는 모든 준비가 완료되면 버튼을 눌러주시기 바랍니다.';
            DrawFormattedText(theWindow, double(msgtxt), 'center', H*(1/4), white, [], [], [], 2);
            Screen('Flip', theWindow);
            
            [~,~,button] = GetMouse(theWindow);
            if button(1) == 1
                break
            end
        end
        
        while true % Space
            msgtxt = '평가 예제 : 실험자는 평가 방법에 대해 충분히 설명한 후, 스페이스바를 눌러주시기 바랍니다.';
            DrawFormattedText(theWindow, double(msgtxt), 'center', H*(1/4), white, [], [], [], 2);
            Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); %rating scale
            % penWidth: 0.125~7.000
            for i = 2:5
                Screen('DrawLine', theWindow, white, anchor_lms(1,i), H*(5/8)-scale_H/4, anchor_lms(1,i), H*(5/8)+scale_H/4, 2);
                Screen('DrawLine', theWindow, white, anchor_lms(2,i), H*(5/8)-scale_H/4, anchor_lms(2,i), H*(5/8)+scale_H/4, 2);
            end
            DrawFormattedText(theWindow, double('불쾌감'), lb-70, H*(5/8)+10, white);
            DrawFormattedText(theWindow, double('쾌감'), rb+20, H*(5/8)+10, white);
            DrawFormattedText(theWindow, double('중립'), W/2-20, H*(5/8)+scale_H/2*1.5);
            Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
            Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
            Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
            
            %         DrawFormattedText(theWindow, double('거의 느껴지지 않음'), anchor_lms(1,1)-scale_W/5, H*(5/8)+scale_H/4, white,2,[],[],1);
            DrawFormattedText(theWindow, double('약함'), anchor_lms(1,2)-scale_W/5, H*(5/8)+scale_H/2, white, [],[],[],1);
            DrawFormattedText(theWindow, double('중간'), anchor_lms(1,3)-scale_W/5, H*(5/8)+scale_H/2, white, [],[],[],1);
            DrawFormattedText(theWindow, double('강함'), anchor_lms(1,4)-scale_W/5, H*(5/8)+scale_H/2, white, [],[],[],1);
            DrawFormattedText(theWindow, double('매우 강함'), anchor_lms(1,5)-scale_W/5, H*(5/8)+scale_H/2, white, 2,[],[],1);
            
            %         DrawFormattedText(theWindow, double('거의 느껴지지 않음'), anchor_lms(2,1), H*(5/8)+scale_H/4, white,2,[],[],1);
            DrawFormattedText(theWindow, double('약함'), anchor_lms(2,2)-scale_W/5, H*(5/8)+scale_H/2, white, [],[],[],1);
            DrawFormattedText(theWindow, double('중간'), anchor_lms(2,3)-scale_W/5, H*(5/8)+scale_H/2, white, [],[],[],1);
            DrawFormattedText(theWindow, double('강함'), anchor_lms(2,4)-scale_W/5, H*(5/8)+scale_H/2, white, [],[],[],1);
            DrawFormattedText(theWindow, double('매우 강함'), anchor_lms(2,5)-scale_W/5, H*(5/8)+scale_H/2, white, 2,[],[],1);
            
            Screen('Flip', theWindow);
            
            [~,~,keyCode] = KbCheck;
            if keyCode(KbName('space')) == 1
                break
            elseif keyCode(KbName('q')) == 1
                abort_experiment('manual');
            end
        end
        
    end
    
    %% (Practice) Continuous
    
    if practice
        
        x = W/2; %center
        y = H*(5/8); %center*(3/2)
        SetMouse(x,y)
        
        while true % Space
            msgtxt = '평가 예제 : 참가자는 충분히 평가 방법을 연습한 후, 연습이 끝나면 버튼을 눌러주시기 바랍니다.';
            DrawFormattedText(theWindow, double(msgtxt), 'center', H*(1/4), white, [], [], [], 2);
            
            [x,~,button] = GetMouse(theWindow);
            [~,~,keyCode] = KbCheck;
            
            if x < lb
                x = lb;
            elseif x > rb
                x = rb;
            end
            
            if button(1) == 1
                break
            elseif keyCode(KbName('q')) == 1
                abort_experiment('manual');
            end
            
            
            Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); %rating scale
            % penWidth: 0.125~7.000
            Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
            Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
            Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
            Screen('DrawLine', theWindow, orange, x, H*(5/8)-scale_H/2, x, H*(5/8)+scale_H/2, 6); %rating bar
            Screen('Flip', theWindow);
            
        end
        
    end
    
    %% (Main) Continuous
    
    if run
        
        while true % Start, Space
            msgtxt = '\n실험자는 모든 것이 잘 준비되었는지 체크해주세요 (Biopac, Eyelink, 등등).\n\n모두 준비되었으면, 스페이스바를 눌러주세요.';
            DrawFormattedText(theWindow, double(msgtxt), 'center', 100, white, [], [], [], 2);
            Screen('Flip', theWindow);
            
            [~,~,keyCode] = KbCheck;
            if keyCode(KbName('space')) == 1
                break
            elseif keyCode(KbName('q')) == 1
                abort_experiment('manual');
            end
        end
        
        while true % Ready, s
            msgtxt = '참가자가 준비되었으면, 이미징을 시작합니다 (s).';
            DrawFormattedText(theWindow, double(msgtxt), 'center', 'center', white, [], [], [], 2);
            Screen('Flip', theWindow);
            
            [~,~,keyCode] = KbCheck;
            if keyCode(KbName('s')) == 1
                break
            elseif keyCode(KbName('q')) == 1
                abort_experiment('manual');
            end
        end
        
        %% For disdaq : 10 secs --> NEED MODIFY??
        % For disdaq ("시작합니다…") : 4 secs
        data.runscan_starttime = GetSecs;
        Screen(theWindow, 'FillRect', bgcolor, window_rect);
        DrawFormattedText(theWindow, double('시작합니다…'), 'center', 'center', white, [], [], [], 1.2);
        Screen('Flip', theWindow);
        waitsec_fromstarttime(data.runscan_starttime, 4);
        
        [~,~,keyCode] = KbCheck;
        if keyCode(KbName('q')) == 1
            abort_experiment('manual');
        end
        
        % For disdaq (blank / EYELINK & BIOPAC START) : 6 secs
        Screen(theWindow,'FillRect',bgcolor, window_rect);
        Screen('Flip', theWindow);
        
        if USE_EYELINK
            Eyelink('StartRecording');
            data.dat.eyelink_starttime = GetSecs; % eyelink timestamp
            Eyelink('Message','Task Run start');
        end
        
        if USE_BIOPAC
            data.dat.biopac_starttime = GetSecs; % biopac timestamp
            BIOPAC_trigger(ljHandle, biopac_channel, 'on');
            waitsec_fromstarttime(data.dat.biopac_starttime, 0.6);
            BIOPAC_trigger(ljHandle, biopac_channel, 'off');
        end
        
        waitsec_fromstarttime(data.runscan_starttime, 10);  % 4+6
        
        %% Continuous rating
        
        run_start_t = GetSecs;
        data.dat.runsession_starttime = run_start_t;
        
        rec_i = 0;
        x = W/2; %center
        y = H*(5/8); %center*(3/2)
        SetMouse(x,y)
        
        while GetSecs - run_start_t < S.dur
            
            rec_i = rec_i + 1;
            [x,~,button] = GetMouse(theWindow);
            if x < lb
                x = lb;
            elseif x > rb
                x = rb;
            end
            
            Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); %rating scale
            % penWidth: 0.125~7.000
            Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
            DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(5/8)+10, white);
            Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
            DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(5/8)+10, white);
            Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
            Screen('DrawLine', theWindow, orange, x, H*(5/8)-scale_H/2, x, H*(5/8)+scale_H/2, 6); %rating bar
            
            run_cur_t = GetSecs;
            data.dat.run_time_fromstart(rec_i,1) = run_cur_t-run_start_t;
            data.dat.run_cont_rating(rec_i,1) = (x-W/2)/(rb-lb).*2;
            data.dat.run_changecolor_response(rec_i,1) = button(1);
            
            % Behavioral task
            if any(S.changecolor <= run_cur_t - run_start_t & run_cur_t - run_start_t <= S.changecolor + S.changetime) % It takes 1 sec from the S.changecolor
                Screen('DrawLine', theWindow, red, x, H*(5/8)-scale_H/2, x, H*(5/8)+scale_H/2, 6); %rating bar turns in red
                data.dat.changecolor_stim(rec_i) = 1;
            else
                Screen('DrawLine', theWindow, orange, x, H*(5/8)-scale_H/2, x, H*(5/8)+scale_H/2, 6); %rating bar returns to its own color
                data.dat.changecolor_stim(rec_i) = 0;
            end
            
            Screen('Flip', theWindow);
            
            % save data every 1 min
            if mod(S.dur, 60) == 0
                save(data.datafile, '-append', 'data')
            end
            
            [~,~,keyCode] = KbCheck;
            if keyCode(KbName('q')) == 1
                abort_experiment('manual');
            end
            
        end
        
        data.dat.run_dur = GetSecs - run_start_t;
        
        if USE_EYELINK
            Eyelink('Message','Run End');
        end
        
        
        %% MAIN : Postrun questionnaire
        
        all_start_t = GetSecs;
        data.dat.postrun_starttime = all_start_t;
        ratestim = strcmp(rating_types_pls.postallstims, S.type);
        % rating_types_pls.postallstims = {'REST', 'CAPS', 'QUIN', 'SWEET', 'TOUCH'};
        scales = rating_types_pls.postalltypes{ratestim};
        
        
        for scale_i = 1:numel(scales)
            
            if scale_i == 1
                
                msgtxt = [num2str(SubjRun) '번째 세션이 끝났습니다.\n잠시 후 질문들이 제시될 것입니다. 참가자분께서는 기다려주시기 바랍니다.'];
                msgtxt = double(msgtxt);
                DrawFormattedText(theWindow, msgtxt, 'center', 'center', white, [], [], [], 2);
                Screen('Flip', theWindow);
                waitsec_fromstarttime(all_start_t, 5)
                
                Screen(theWindow, 'FillRect', bgcolor, window_rect);
                Screen('Flip', theWindow);
                
                if USE_EYELINK
                    Eyelink('Message','Postrun Start');
                end
                
                [~,~,keyCode] = KbCheck;
                if keyCode(KbName('q')) == 1
                    abort_experiment('manual');
                end
            end
            
            scale = scales{scale_i};
            SetMouse(x,y)
            
            [lb, rb, one_directional] = draw_scale_pls(scale);
            if one_directional
                lb = W*(1/4);
                rb = W*(3/4);
                SetMouse(W*(1/4), H*(5/8));
            else
                lb = W*(1/6);
                rb = W*(5/6);
                SetMouse(W/2, H*(5/8));
            end
            
            Screen(theWindow, 'FillRect', bgcolor, window_rect);
            
            start_t = GetSecs;
            eval(['data.dat.' scale '_timestamp = start_t;']);
            
            rec_i = 0;
            ratetype = strcmp(rating_types_pls.alltypes, scale);
            
            [x,~,button] = GetMouse(theWindow);
            
            % Get ratings
            while true
                rec_i = rec_i + 1;
                [x,~,button] = GetMouse(theWindow);
                draw_scale_pls(scale);
                if x < lb; x = lb; elseif x > rb; x = rb; end
                
                DrawFormattedText(theWindow, rating_types_pls.prompts{ratetype}, 'center', H*(1/4), white, [], [], [], 2);
                Screen('DrawLine', theWindow, orange, x, H*(5/8)-scale_H/2, x, H*(5/8)+scale_H/2, 6); %rating bar
                Screen('Flip', theWindow);
                
                if button(1)
                    while button(1)
                        [~,~,button] = GetMouse(theWindow);
                    end
                    break
                end
                
                cur_t = GetSecs;
                eval(['data.dat.' scale '_time_fromstart(rec_i,1) = cur_t-start_t;']);
                eval(['data.dat.' scale '_cont_rating(rec_i,1) = (x-lb)./(rb-lb);']);
                
            end
            
            % Freeze the screen 0.5 second with red line if overall type
            freeze_t = GetSecs;
            while true
                draw_scale_pls(scale);
                DrawFormattedText(theWindow, rating_types_pls.prompts{ratetype}, 'center', H*(1/4), white, [], [], [], 2);
                Screen('DrawLine', theWindow, red, x, H*(5/8)-scale_H/2, x, H*(5/8)+scale_H/2, 6);
                Screen('Flip', theWindow);
                freeze_cur_t = GetSecs;
                if freeze_cur_t - freeze_t > 0.5
                    break
                end
            end
            
            if scale_i == numel(scales)
                msgtxt = '질문이 끝났습니다.';
                msgtxt = double(msgtxt); % korean to double
                DrawFormattedText(theWindow, msgtxt, 'center', 'center', white, [], [], [], 2);
                Screen('Flip', theWindow);
                
                start_t = GetSecs;
                while true
                    cur_t = GetSecs;
                    if cur_t - start_t >= 2  % postrun_end_t
                        break
                    end
                end
                
            end
            
        end
        
        
        if USE_EYELINK
            Eyelink('Message','Postrun End');
            eyelink_main(edfFile, 'Shutdown');
        end
        if USE_BIOPAC
            data.dat.biopac_endtime = GetSecs; % biopac timestamp
            BIOPAC_trigger(ljHandle, biopac_channel, 'on');
            waitsec_fromstarttime(data.dat.biopac_endtime, 0.1);
            BIOPAC_trigger(ljHandle, biopac_channel, 'off');
        end
        
        
        all_end_t = GetSecs;
        data.dat.postrun_dur = all_end_t - all_start_t;
        
        save(data.datafile, '-append', 'data');
        
        %% Closing screen
        
        while true % Space
            
            [~,~,keyCode] = KbCheck;
            if keyCode(KbName('space'))
                while keyCode(KbName('space'))
                    [~,~,keyCode] = KbCheck;
                end
                break
            end
            
            if keyCode(KbName('q')) == 1
                abort_experiment('manual');
                break
            end
            
            msgtxt = [num2str(SubjRun) '번째 세션이 끝났습니다.\n세션을 마치려면, 실험자는 스페이스바를 눌러주시기 바랍니다.'];
            msgtxt = double(msgtxt); % korean to double
            DrawFormattedText(theWindow, msgtxt, 'center', 'center', white, [], [], [], 2);
            Screen('Flip', theWindow);
            
        end
        
        ShowCursor;
        sca;
        Screen('CloseAll');
        
    end
    
    
catch err
    % ERROR
    disp(err);
    for i = 1:numel(err.stack)
        disp(err.stack(i));
    end
    %     fclose(t);
    %     fclose(r);  % Q??
    abort_experiment('error');
end
end