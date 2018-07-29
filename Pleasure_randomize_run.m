%% Save randmoized run order. Each version contains 120 pairs.

Runs = {'REST', 'CAPS', 'QUIN', 'SWEET', 'TOUCH'};
Runs = Runs(perms(1:5)); % all possible pairs from permutation
Runs = Runs(randperm(size(Runs, 1)), :); % randomize the order

save('Pleasure_randomized_run_data.mat','Runs');