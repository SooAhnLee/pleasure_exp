function [lb, rb, one_directional] = draw_scale_pls(scale)

global theWindow W H window_ratio  %window property
global lb rb scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color

%% Basic Settings
one_directional = false;


%% Drawing scale
switch scale
    case 'cont_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_int'  % one-directional
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(5/8)+10, white);

    case 'overall_boredness'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 지겹지\n 않음'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 지겨움'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_alertness'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 졸림'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 또렷'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
 
    case 'overall_relaxed'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 불편함'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 편함'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_attention'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 집중되지\n 않음'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 집중\n 잘 됨'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_positive'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);

        
    case 'overall_resting_negative'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_myself'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_others'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_imagery'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_present'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_past'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_future'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n 않다'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_bitter_int'
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(5/8)+10, white);
        
    case 'overall_resting_bitter_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_capsai_int'
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(5/8)+10, white);
        
    case 'overall_resting_capsai_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_sweet_int'
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(5/8)+10, white);
        
    case 'overall_resting_sweet_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_touch_int'
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n 않음'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n 가장 심한'), rb+20, H*(5/8)+10, white);
        
    case 'overall_resting_touch_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);       
           
end

end


