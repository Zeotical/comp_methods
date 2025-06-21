function printNonPeakTable()
% printNonPeakTable - Displays a formatted Non-Peak Hour Inter-Arrival Time Table in FreeMat

    % Inter-arrival times and probabilities
    inter_arrival_times = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    probabilities = [0.02, 0.05, 0.10, 0.15, 0.25, 0.18, 0.10, 0.07, 0.05, 0.03];
    cdf = cumsum(probabilities);

    % Random number ranges (0�999)
    lower_bounds = [0, round(cdf(1:end-1) * 1000)];
    upper_bounds = round(cdf * 1000) - 1;

    % Justifications (will be padded manually)
    justifications = {
        'Rare sudden follow-up';
        'Unlikely but possible';
        'Occasionally quick arrivals';
        'Normal light queue';
        'Most common timing (~12 cars/hour)';
        'Fairly common longer gaps';
        'Happens during slow periods';
        'Less frequent, but possible';
        'Rare delay between cars';
        'Very rare, but plausible'
    };

    % Fixed width for justification
    col_width = 35;

    % Print table header
    printf('Non-Peak Hour Inter-Arrival Time Table:\n');
    printf('-------------------------------------------------------------------------------------------\n');
    printf('| Time (min) | Prob  |  CDF  | Random # Range (0-999)| Justification                      |\n');
    printf('-------------------------------------------------------------------------------------------\n');

    % Loop through and print each row
    for i = 1:length(inter_arrival_times)
        % Pad or trim the justification manually
        just = justifications{i};
        if length(just) > col_width
            just = just(1:col_width);
        else
            padding = repmat(' ', 1, col_width - length(just));
            just = [just padding];
        end

        printf('|     %2d     | %.2f  | %.2f  |   %3d - %3d           | %s|\n', inter_arrival_times(i), probabilities(i), cdf(i), lower_bounds(i), upper_bounds(i), just);
    end

    printf('-------------------------------------------------------------------------------------------\n');
end
