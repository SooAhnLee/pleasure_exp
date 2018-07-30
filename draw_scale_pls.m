function draw_scale_pls(scale)

global theWindow W H window_ratio  %window property
global lb rb scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color

%% Basic setting
% x = W/2; %center
% y = H*(3/4); %center*(3/2)
% SetMouse(x,y)


%% Drawing scale
switch scale
    case 'cont_glms'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_glms'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_int'  % not glms?!
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);

    case 'overall_boredness'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 지겹지\n 않음'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 지겨움'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_alertness'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 졸림'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 또렷'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
 
    case 'overall_relaxed'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 불편함'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 편함'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_attention'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 집중되지\n 않음'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 집중\n 잘 됨'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_positive'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);

        
    case 'overall_resting_negative'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_myself'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_others'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_imagery'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_present'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_past'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_future'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_bitter_int'  
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_bitter_glms'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_capsai_int'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_capsai_glms'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_sweet_int'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_sweet_glms'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_touch_int'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-90, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_resting_touch_glms'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
                
    case 'overall_comfortness'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 불편함'), lb-50, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 편함'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        
    case 'overall_mood'
        Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 부정적'), lb-70, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 긍정적'), rb+20, H*(3/4)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
        rawFormattedText(theWindow, double('중간'), W/2-30, H*(3/4)+scale_H/2*1.6);
        Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);        
           
end

end


