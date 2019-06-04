clear;

A = [1 2 -2; 1 1 1; 2 2 1];
b = [7; 2; 5];

T_j = [0 -2 2; -1 0 -1; -2 -2 0];
disp("eig T_j");
disp(eig(T_j));

x = zeros(3, 1);
C = diag([1; 1; 1]) * b;
i = 0;
while max(abs(x - [1; 2; -1])) >= 10^(-5)
    i = i + 1;
    x = T_j*x + C;
end
disp("i");
disp(i);
disp("After iteration");
disp(x);
disp("error");
disp(max(abs(x - [1; 2; -1])));

temp1 = [1 0 0; 1 1 0; 2 2 1];
temp2 = [0 -2 2; 0 0 -1; 0 0 0];
T_g = inv(temp1)*temp2; %#ok<MINV>
disp("eig T_g");
disp(eig(T_g));

x = zeros(3, 1);
C = inv(temp1) * b; %#ok<MINV>
for i = 1:25
    x = T_g*x + C;
end
disp("After iteration");
disp(x);
