clear;

A = [0.2 0.1 1 1 0; 0.1 4 -1 1 -1; 1 -1 60 0 -2; 1 1 0 8 4; 0 -1 -2 4 700];
b = [1; 2; 3; 4; 5];
exact_sol = [7.859713071; ... 
            0.4229264082; ... 
            -0.07359223906; ... 
            -0.5406430164; ... 
            0.01062616286];
D = diag(diag(A));
U = -triu(A, 1);
L = -tril(A, -1);

disp("a - jacobi method");
x = zeros(5, 1);
T = inv(D) * (L + U); %#ok<MINV>
C = inv(D) * b; %#ok<MINV>
i = 0;
while max(abs(x - exact_sol)) >= 10^(-2)
    i = i + 1;
    x = T*x + C;
end
disp("i");
disp(i);
disp("After iteration");
disp(x);
disp("error");
disp(max(abs(x - exact_sol)));

disp("b - gauss siedel method");
x = zeros(5, 1);
T = inv(D - L) * U; %#ok<MINV>
C = inv(D - L) * b; %#ok<MINV>
i = 0;
while max(abs(x - exact_sol)) >= 10^(-2)
    i = i + 1;
    x = T*x + C;
end
disp("i");
disp(i);
disp("After iteration");
disp(x);
disp("error");
disp(max(abs(x - exact_sol)));

disp("c - sor method");
x = zeros(5, 1);
w = 1.25;
T = inv(D - w*L) * (w*U + (1-w)*D); %#ok<MINV>
C = inv(D - w*L) * w*b; %#ok<MINV>
i = 0;
while max(abs(x - exact_sol)) >= 10^(-2)
    i = i + 1;
    x = T*x + C;
end
disp("i");
disp(i);
disp("After iteration");
disp(x);
disp("error");
disp(max(abs(x - exact_sol)));

disp("d - cg method");
x = zeros(5, 1);
r = b - A*x;
v = r;
while max(abs(x - exact_sol)) >= 10^(-2)
    i = i + 1;
    t = (r'*r) / (v'*A*v);
    x = x + t*v;
    r_temp = r;
    r = r - t*A*v;
    s = -(r'*r) / (r_temp'*r_temp);
    v = r + s*v;
end
disp("i");
disp(i);
disp("After iteration");
disp(x);
disp("error");
disp(max(abs(x - exact_sol)));
