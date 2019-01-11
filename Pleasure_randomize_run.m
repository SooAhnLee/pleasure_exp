%% Save randmoized run order. Each version contains 120 pairs.

Runs = {'REST ', 'CAPS ', 'QUIN ', 'SWEET', 'TOUCH'};
Runs = Runs(perms(1:5)); % all possible pairs from permutation
% Runs = Runs(randperm(size(Runs, 1)), :); % randomize the order
Runs_1 = Runs(1:24,:);  % start with 'TOUCH'
Runs_2 = Runs(25:48,:);  % start with 'SWEET'
Runs_3 = Runs(49:72,:);  % start with 'QUIN'
Runs_4 = Runs(73:96,:);  % start with 'CAPS'
Runs_5 = Runs(97:120,:);  % start with 'REST'

for i = 1:12
    Runs_1_odd(i,:) = Runs_1(2*i-1,:);
    Runs_2_even(i,:) = Runs_2(2*i,:);
    Runs_3_odd(i,:) = Runs_3(2*i-1,:);
    Runs_4_even(i,:) = Runs_4(2*i,:);
end

Runs_5_oddeven(1,:) = Runs_5(1,:);  % 1st row
Runs_5_oddeven(2,:) = Runs_5(4,:);  % 4rd row
Runs_5_oddeven(3,:) = Runs_5(5,:);  % 5th row
Runs_5_oddeven(4,:) = Runs_5(8,:);  % 8th row
Runs_5_oddeven(5,:) = Runs_5(9,:);  % 9th row
Runs_5_oddeven(6,:) = Runs_5(12,:);  % 12th row
Runs_5_oddeven(7,:) = Runs_5(13,:);  % 13th row
Runs_5_oddeven(8,:) = Runs_5(16,:);  % 16th row
Runs_5_oddeven(10,:) = Runs_5(17,:);  % 17th row
Runs_5_oddeven(11,:) = Runs_5(20,:);  % 20th row
Runs_5_oddeven(11,:) = Runs_5(21,:);  % 21st row
Runs_5_oddeven(12,:) = Runs_5(24,:);  % 24th row


Runs_1_odd
Runs_2_even
Runs_3_odd
Runs_4_even
Runs_5_oddeven

Runs_randomized(1:12,:) = Runs_1_odd;
Runs_randomized(13:24,:) = Runs_2_even;
Runs_randomized(25:36,:) = Runs_3_odd;
Runs_randomized(37:48,:) = Runs_4_even;
Runs_randomized(49:60,:) = Runs_5_oddeven;

save('Pleasure_randomized_run_data.mat','Runs_randomized');


Runs_randomized(58,:) = {'REST ', 'CAPS ','QUIN ','TOUCH','SWEET'};
Runs_randomized(8,:) = {'TOUCH', 'QUIN ','CAPS ','SWEET', 'REST '};
Runs_randomized(20,:) = {'REST ','CAPS ','TOUCH','QUIN ','SWEET'};

save('Pleasure_randomized_run_data_v1.mat','Runs_randomized');

% Final version (according to 'Pleasure_scannote.xlsx')
for i = 1:7
    new_runs_randomized(i,:) = Runs_randomized(i,:);
end
new_runs_randomized(8,:) = Runs_randomized(13,:);
new_runs_randomized(9,:) = Runs_randomized(25,:);
new_runs_randomized(10,:) = Runs_randomized(37,:);
new_runs_randomized(11,:) = Runs_randomized(20,:);
new_runs_randomized(12,:) = Runs_randomized(7,:);
new_runs_randomized(13,:) = Runs_randomized(16,:);
new_runs_randomized(14,:) = Runs_randomized(28,:);
new_runs_randomized(15,:) = Runs_randomized(40,:);
new_runs_randomized(16,:) = Runs_randomized(49,:);
new_runs_randomized(17,:) = Runs_randomized(1,:);
new_runs_randomized(18,:) = Runs_randomized(19,:);
new_runs_randomized(19,:) = Runs_randomized(31,:);
new_runs_randomized(20,:) = Runs_randomized(43,:);
new_runs_randomized(21,:) = Runs_randomized(52,:);
new_runs_randomized(22,:) = Runs_randomized(4,:);
new_runs_randomized(23,:) = Runs_randomized(22,:);
new_runs_randomized(24,:) = Runs_randomized(34,:);
new_runs_randomized(25,:) = Runs_randomized(46,:);
new_runs_randomized(26,:) = Runs_randomized(55,:);
new_runs_randomized(27,:) = Runs_randomized(9,:);
new_runs_randomized(28,:) = Runs_randomized(14,:);
new_runs_randomized(29,:) = Runs_randomized(26,:);
new_runs_randomized(30,:) = Runs_randomized(38,:);
new_runs_randomized(31,:) = Runs_randomized(58,:);
new_runs_randomized(32,:) = Runs_randomized(10,:);
new_runs_randomized(33,:) = Runs_randomized(17,:);
new_runs_randomized(34,:) = Runs_randomized(29,:);
new_runs_randomized(35,:) = Runs_randomized(41,:);
new_runs_randomized(36,:) = Runs_randomized(50,:);
new_runs_randomized(37,:) = Runs_randomized(11,:);
new_runs_randomized(38,:) = Runs_randomized(23,:);
new_runs_randomized(39,:) = Runs_randomized(32,:);
new_runs_randomized(40,:) = Runs_randomized(44,:);
new_runs_randomized(41,:) = Runs_randomized(53,:);
new_runs_randomized(42,:) = Runs_randomized(8,:);
new_runs_randomized(43,:) = Runs_randomized(15,:);
new_runs_randomized(44,:) = Runs_randomized(35,:);
new_runs_randomized(45,:) = Runs_randomized(47,:);
new_runs_randomized(46,:) = Runs_randomized(56,:);
new_runs_randomized(47,:) = Runs_randomized(12,:);
new_runs_randomized(48,:) = Runs_randomized(18,:);
new_runs_randomized(49,:) = Runs_randomized(27,:);
new_runs_randomized(50,:) = Runs_randomized(39,:);
new_runs_randomized(51,:) = Runs_randomized(59,:);
new_runs_randomized(52,:) = Runs_randomized(2,:);
new_runs_randomized(53,:) = Runs_randomized(21,:);
new_runs_randomized(54,:) = Runs_randomized(30,:);
new_runs_randomized(55,:) = Runs_randomized(42,:);
new_runs_randomized(56,:) = Runs_randomized(51,:);
new_runs_randomized(57,:) = Runs_randomized(3,:);
new_runs_randomized(58,:) = Runs_randomized(24,:);
new_runs_randomized(59,:) = Runs_randomized(54,:);
new_runs_randomized(60,:) = Runs_randomized(33,:);
new_runs_randomized(61,:) = Runs_randomized(45,:);
new_runs_randomized(62,:) = Runs_randomized(57,:);
new_runs_randomized(63,:) = Runs_randomized(5,:);
new_runs_randomized(64,:) = Runs_randomized(36,:);
new_runs_randomized(65,:) = Runs_randomized(48,:);
new_runs_randomized(66,:) = Runs_randomized(60,:);

save('Pleasure_randomized_run_data_final.mat','new_runs_randomized');