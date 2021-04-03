function mainProgramm3v2()
	N = 10;
	cities = zeros(N,2);
	cities(1,:) = [0.556, 0.560];
	cities(2,:) = [0.099, 0.775];
	cities(3,:) = [0.895, 0.546];
	cities(4,:) = [0.059, 0.864];
	cities(5,:) = [0.208, 0.748];
	cities(6,:) = [0.055, 0.217];
	cities(7,:) = [0.434, 0.660];
	cities(8,:) = [0.835, 0.696];
	cities(9,:) = [0.679, 0.210];
	cities(10,:) = [0.126, 0.597];
	
    M = 2*N;
    
	rng('shuffle');
	weights = (2*rand(M,2)-1)/10;
	learningRate = 0.5;
	landa = 0.0005;
	adjustmentRadius = 4;
	
    show(cities, weights);
    
	t = 0;
	while(t < 1000)
        order = randperm(N);
        for i=order
			x = cities(i, :);
			distances = zeros(M, 1);
			for j = 1:M
				distances(j) = norm(x - weights(j, :));
			end
			[minval, winner] = min(distances);
			for j = 1:M
				dist = min([abs(j-winner), M - abs(j-winner)]);
				if adjustmentRadius == 0
					if dist == 0
						fnb = 1;
					else
						fnb = 0;
					end
				else
					fnb = exp(-dist*dist/(2*adjustmentRadius*adjustmentRadius));
				end
				weights(j, :) = weights(j, :) + learningRate * fnb * (x - weights(j, :));
			end
			t = t+1;
			learningRate = learningRate - landa;
			if t <= 50
				adjustmentRadius = adjustmentRadius - 0.04;
			elseif t <= 150
				adjustmentRadius = adjustmentRadius - 0.02;
            end
            if t == 25
                show(cities, weights);
            elseif t == 50
                show(cities, weights);
            elseif t == 100
                show(cities, weights);
            end
        end
	end
	show(cities, weights);
    winners = zeros(N,1);
    for i=1:N
        x = cities(i, :);
        distances = zeros(M, 1);
        for j = 1:M
            distances(j) = norm(x - weights(j, :));
        end
        [minval, winner] = min(distances);
        winners(i) = winner;
    end
    winners = [winners (1:N)'];
    winners = sortrows(winners);
    weights = weights(winners(:, 1), :);
    show(cities, weights);
    tour = winners(:,2);
    len = 0;
    fprintf('nodes of tour is: \n');
    for i =1:N-1
        fprintf('%d, ', tour(i));
        len = len + norm(cities(tour(i), :) - cities(tour(i+1), :));
    end
    fprintf('%d\n', tour(N));
    len = len + norm(cities(tour(N), :) - cities(tour(1), :));
    fprintf('length of tour is: %f\n', len);
    cities = cities(tour, :);
    figure;
	hold on;
	plot([cities(:,1); cities(1,1)], [cities(:,2); cities(1,2)], '-*', 'MarkerEdgeColor','black');
    hold off;
end

function show(cities, weights)
    figure;
	hold on;
	plot(cities(:,1), cities(:,2), '*', 'MarkerEdgeColor','black');
	plot([weights(:,1); weights(1,1)], [weights(:,2); weights(1,2)], '-o', 'MarkerEdgeColor','blue');
    %plot(weights(:,1), weights(:,2), '-o', 'MarkerEdgeColor','blue');
	hold off;
end