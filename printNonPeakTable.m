function printNonPeakTable()
% printNonPeakTable - Displays a simplified Non-Peak Hour Inter-Arrival Time Table

    % Inter-arrival times and probabilities
    inter_arrival_times = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    probabilities = [0.02, 0.05, 0.10, 0.15, 0.25, 0.18, 0.10, 0.07, 0.05, 0.03];
    cdf = cumsum(probabilities);

    % Random number ranges (0–999)
    lower_bounds = [0, round(cdf(1:end-1) * 1000)];
    upper_bounds = round(cdf * 1000) - 1;

    % Print table header
    printf('Non-Peak Hour Inter-Arrival Time Table:\n');
    printf('------------------------------------------------------------\n');
    printf('| Time (min) | Prob  |  CDF  | Random Number Range (0-999) |\n');
    printf('------------------------------------------------------------\n');

    % Loop through and print each row
    for i = 1:length(inter_arrival_times)
        printf('|     %2d     | %.2f  | %.2f  |       %3d - %3d             |\n', ...
            inter_arrival_times(i), probabilities(i), cdf(i), lower_bounds(i), upper_bounds(i));
    end

    printf('------------------------------------------------------------\n');
end
