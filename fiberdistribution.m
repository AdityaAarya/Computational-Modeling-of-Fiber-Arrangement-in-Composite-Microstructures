fiber_diameter = 6e-3; % mm
block_size = 1; 
vf_values = [0.1, 0.3, 0.6]; 
fiber_radius = fiber_diameter / 2; 
central_region = [0.25, 0.75]; % Central region
cell_size = fiber_diameter; 
num_cells = floor(block_size / cell_size); % Number of cells in one direction
total_cells = num_cells^2; % Total number of grid cells

for vf = vf_values
    fiber_area = pi * (fiber_radius^2); 
    num_fibers = floor((vf * block_size^2) / fiber_area); 
    
    if num_fibers > total_cells
        error('Number of fibers exceeds available grid cells. Increase cell size or reduce Vf.');
    end

    fiber_positions = zeros(num_fibers, 2); 
    selected_cells = randperm(total_cells, num_fibers); 
    
    for i = 1:num_fibers
        idx = selected_cells(i);
        row = floor((idx - 1) / num_cells);
        col = mod((idx - 1), num_cells); 
        
        x = (col + 0.5) * cell_size;
        y = (row + 0.5) * cell_size;
        fiber_positions(i, :) = [x, y];
    end

    in_central = fiber_positions(:, 1) >= central_region(1) & fiber_positions(:, 1) <= central_region(2) & ...
                 fiber_positions(:, 2) >= central_region(1) & fiber_positions(:, 2) <= central_region(2);
    central_positions = fiber_positions(in_central, :);

    if ~isempty(central_positions)
        random_idx = randi(size(central_positions, 1));
        random_fiber = central_positions(random_idx, :);
        center_distances = sqrt((central_positions(:, 1) - random_fiber(1)).^2 + ...
                                (central_positions(:, 2) - random_fiber(2)).^2);
        edge_to_edge_distances = max(center_distances - fiber_diameter, 0);
        avg_spacing = mean(edge_to_edge_distances);
        std_spacing = std(edge_to_edge_distances);
    else
        avg_spacing = NaN;
        std_spacing = NaN;
    end

    figure;
    scatter(fiber_positions(:, 1), fiber_positions(:, 2), 3, 'b', 'filled');
    hold on;
    rectangle('Position', [central_region(1), central_region(1), 0.5, 0.5], 'EdgeColor', 'g', 'LineWidth', 3);
    scatter(central_positions(:, 1), central_positions(:, 2), 5, 'r', 'filled');
    viscircles(random_fiber, fiber_radius, 'EdgeColor', 'k', 'LineWidth', 2);
    axis equal;
    xlim([0, block_size]);
    ylim([0, block_size]);
    title(sprintf('Fiber Distribution for Vf = %.1f%% (Num Fibers = %d)', vf * 100, num_fibers));
    xlabel('X (mm)');
    ylabel('Y (mm)');

    fprintf('Vf = %.1f%%: Num Fibers = %d, Avg Spacing = %.3f mm, Std Dev = %.3f mm\n', ...
        vf * 100, num_fibers, avg_spacing, std_spacing);
end
