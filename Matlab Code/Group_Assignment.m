%% Load data

data = xlsread('Group-2_data.xlsx');
x = data(:,1:3);
y = data(:,4);

%% Normalisation

norm_mean = mean(x);
norm_std = std(x);
x = (x-norm_mean)./norm_std;
m = length(y);
x = [ones(m,1),x];

%% Parameters

alpha = 0.01;
theta = [0;0;0;0];
iterations = 1000;
cost_difference = 0.01;

%% Gradient descent

cost = (0.5*m)*sum((x*theta-y).^2);
count = 1;
cost_list(1) = cost;
theta_list(1,:) = theta;
while true
    theta = theta - (alpha/m).*(x.'*(x*theta-y));
    cost_temp = (0.5*m)*sum((x*theta-y).^2);
    count = count+1;
    theta_list(count,:) = theta;
    cost_list(count) = cost_temp;
    if (cost - cost_temp) <= cost_difference
        break;
    end
    cost = cost_temp;
    if count >= iterations
        break;
    end
end

%% Plots

figure(1)
plot(cost_list)
xlabel('Iterations')
ylabel('Cost')
title('Cost with each iteration')
figure(2)
plot(1:count,theta_list)
xlabel('Iterations')
ylabel('Theta values')
legend('Theta 0', 'Theta 1', 'Theta 2', 'Theta 3')
title('Theta values with each iteration')

%% Load test data

test_data = xlsread('Test_data.xlsx');
test = (test_data-norm_mean)./norm_std;
test = [ones(length(test),1),test];
result = test*theta;
final_result = table(test_data,result)