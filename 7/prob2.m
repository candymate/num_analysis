clear;

A = [2 -1 -1; 2 2 2; -1 -1 2];
b = [-1; 4; -5];

T_j = [0 1/2 -1/2; -1 0 -1; 1/2 1/2 0];
disp("eig T_j");
disp(eig(T_j));
% sqrt(5)/2 % just to check if 1.1180 is sqrt(5)/2

x = zeros(3, 1);
C = diag([1/2; 1/2; 1/2]) * b;
for i = 1:25
    x = T_j*x + C;
end
disp("After iteration");
disp(x);

temp1 = [2 0 0; 2 2 0; -1 -1 2];
temp2 = [0 1 -1; 0 0 -2; 0 0 0];
T_g = inv(temp1)*temp2; %#ok<MINV>
disp("eig T_g");
disp(eig(T_g));

x = zeros(3, 1);
C = inv(temp1) * b; %#ok<MINV>
i = 0;
while max(abs(x - [1; 2; -1])) >= 10^(-5)
    i = i + 1;
    x = T_g*x + C;
end
disp("i");
disp(i);
disp("After iteration");
disp(x);
disp("error");
disp(max(abs(x - [1; 2; -1])));
