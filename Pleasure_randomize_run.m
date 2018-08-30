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