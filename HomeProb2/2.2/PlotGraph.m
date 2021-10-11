x_space = linspace(-5, 5);
y_space = linspace(-5, 5);
z_space = compute(x_space, y_space);

contour(x_space, y_space, z_space, 30);
hold on;

xlabel('x');
ylabel('y');

minimaList = [-3, 3.14; 3.65, -2.06; -3.44, -3.39; 2.92, 2.09];
scatter(minimaList(:, 1), minimaList(:, 2), 'filled');


function z_space = compute(x_space, y_space)

    len_x = length(x_space);
    len_y = length(y_space);
    
    z_space = zeros(len_y, len_x);
    for i = 1:len_y
        y = y_space(i);
        for j = 1:len_x
            x = x_space(j);
            
            z = (x^2 + y - 11)^2 + (x + y^2 - 7)^2;
            z = log(0.01 + z);
            
            z_space(i, j) = z;
        end
    end

end