function rating_types_pls = call_ratingtypes_pls
%call_ratingtypes
%This function can call dictionary of rating types and prompts.
%its output is rating_types, and it has 3 substructure.
%rating_types.prompts_ex : prompts for explanation
%rating_types.alltypes : dictionary of rating types
%rating_types.prompts : prompts for each rating type


% ********** IMPORTANT NOTE **********
% YOU CAN ADD TYPES AND PROMPTS HERE. "cont_" AND "overall_" ARE IMPORTANT.
% * CRUCIAL: THE ORDER BETWEEN alltypes AND prompts SHOULD BE THE SAME.*


temp_rating_types_pls = {
    'overall_alertness', '방금 세션동안 얼마나 졸리셨나요, 혹은 얼마나 정신이 또렷했나요?'; ...
    'overall_relaxed', '지금 얼마나 편안하신가요?';...
    'overall_attention', '방금 세션동안 과제에 얼마나 집중하셨나요?'; ...
    'overall_resting_bitter_int', '방금 세션동안 경험했던 쓴 맛은 가장 강했을 때 얼마나 강했나요?';...
    'overall_resting_bitter_glms', '방금 세션동안 경험했던 쓴 맛은 가장 강했을 때 얼마나 불쾌 혹은 유쾌했나요?';...
    'overall_resting_capsai_int', '방금 세션동안 경험했던 혀의 통증은 가장 강했을 때 얼마나 강했나요?';...
    'overall_resting_capsai_glms', '방금 세션동안 경험했던 혀의 통증은 가장 강했을 때 얼마나 불쾌 혹은 유쾌했나요?';...
    'overall_resting_sweet_int', '방금 세션동안 경험했던 단 맛은 가장 강했을 때 얼마나 강했나요?';...
    'overall_resting_sweet_glms', '방금 세션동안 경험했던 단 맛은 가장 강했을 때 얼마나 유쾌 혹은 불쾌했나요?';...
    'overall_resting_touch_int', '방금 세션동안 경험했던 촉감은 가장 강했을 때 얼마나 강했나요?';...
    'overall_resting_touch_glms', '방금 세션동안 경험했던 촉감은 가장 강했을 때 얼마나 유쾌 혹은 불쾌했나요?';...
    };
%     'cont_glms', '현재 자극이 얼마나 유쾌 혹은 불쾌한지 평가해주세요.'; ...
%     'overall_glms', '자극이 얼마나 유쾌 혹은 불쾌했나요?'; ...
%     'overall_int', '자극이 얼마나 강했나요?';...
%     'overall_boredness', '방금 세션동안 얼마나 지겨우셨나요?'; ...
%     'overall_resting_positive', '방금 세션동안 했던 생각이 주로 긍정적이었나요?'; ...
%     'overall_resting_negative', '방금 세션동안 했던 생각이 주로 부정적이었나요?'; ...
%     'overall_resting_myself', '방금 세션동안 했던 생각이 주로 나 자신에 대한 것이었나요?'; ...
%     'overall_resting_others', '방금 세션동안 했던 생각이 주로 다른 사람들에 대한 것이었나요?'; ...
%     'overall_resting_imagery', '방금 세션동안 했던 생각이 주로 생생한 이미지를 포함하고 있었나요?';...
%     'overall_resting_present', '방금 세션동안 했던 생각이 주로 지금, 여기에 대한 것이었나요?';...
%     'overall_resting_past',  '방금 세션동안 주로 했던 생각이 과거에 대한 것이었나요?';...
%     'overall_resting_future', '방금 세션동안 주로 했던 생각이 미래에 대한 것이었나요?';...
rating_types_pls.alltypes = temp_rating_types_pls(:,1);
rating_types_pls.prompts = temp_rating_types_pls(:,2);


rating_types_pls.postallstims = {'REST ', 'CAPS ', 'QUIN ', 'SWEET', 'TOUCH'};
rating_types_pls.postalltypes{1} = ...
    {'overall_relaxed', ...
    'overall_attention', ...
    'overall_alertness'};
%     'overall_boredness', ...
%     'overall_resting_positive', ...
%     'overall_resting_negative', ...
%     'overall_resting_myself', ...
%     'overall_resting_others', ...
%     'overall_resting_imagery', ...
%     'overall_resting_present', ...
%     'overall_resting_past', ...
%     'overall_resting_future'};
rating_types_pls.postalltypes{2} = ...
    [rating_types_pls.postalltypes{1}, ...
    {'overall_resting_capsai_int', ...
    'overall_resting_capsai_glms'}];
rating_types_pls.postalltypes{3} = ...
    [rating_types_pls.postalltypes{1}, ...
    {'overall_resting_bitter_int', ...
    'overall_resting_bitter_glms'}];
rating_types_pls.postalltypes{4} = ...
    [rating_types_pls.postalltypes{1}, ...
    {'overall_resting_sweet_int', ...
    'overall_resting_sweet_glms'}];
rating_types_pls.postalltypes{5} = ...
    [rating_types_pls.postalltypes{1}, ...
    {'overall_resting_touch_int', ...
    'overall_resting_touch_glms'}];


end
