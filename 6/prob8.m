clear;

% problem a
A1 = [2 3 -6; 1 -6 8; 3 -2 1];
b1 = [-10; 13; 2];
[x1, L1, U1, P1] = mylinsolve(A1, b1);

disp("problem a");
disp("A"); disp(A1);
disp("b"); disp(b1);
disp("result");
disp("x"); disp(x1);
disp("L"); disp(L1);
disp("U"); disp(U1);
disp("P"); disp(P1);
C11 = L1*U1-P1*A1;
C12 = A1*x1 - b1;
disp("check1"); disp(C11);
disp("check2"); disp(C12);

% problem b
A2 = [14 14 -9 3 -5; ...
      14 52 -15 2 -32; ...
      -9 -15 36 -5 16; ...
      3 2 -5 47 49; ...
      -5 -32 16 49 79];
b2 = [-15; -100; 106; 329; 463];
[x2, L2, U2, P2] = mylinsolve(A2, b2);

disp("problem b");
disp("A"); disp(A2);
disp("b"); disp(b2);
disp("result");
disp("x"); disp(x2);
disp("L"); disp(L2);
disp("U"); disp(U2);
disp("P"); disp(P2);
C21 = L2*U2-P2*A2;
C22 = A2*x2-b2;
disp("check1"); disp(C21);
disp("check2"); disp(C22);

% problem c
A3 = zeros(5);
for i = 1:5
    for j = 1:5
        A3(i,j) = 1/(i+j-1);
    end
end
b3 = [5; 3.55; 2.81428571428571; 2.34642857142857; 2.01746031746032];
[x3, L3, U3, P3] = mylinsolve(A3, b3);

disp("problem c");
disp("A"); disp(A3);
disp("b"); disp(b3);
disp("result");
disp("x"); disp(x3);
disp("L"); disp(L3);
disp("U"); disp(U3);
disp("P"); disp(P3);
C31 = L3*U3-P3*A3;
C32 = A3*x3-b3;
disp("check1"); disp(C31);
disp("check2"); disp(C32);

% problem d
A4 = rand(10);
b4 = rand(10,1);
[x4, L4, U4, P4] = mylinsolve(A4, b4);

disp("problem d");
disp("A"); disp(A4);
disp("b"); disp(b4);
disp("result");
disp("x"); disp(x4);
disp("L"); disp(L4);
disp("U"); disp(U4);
disp("P"); disp(P4);
C41 = L4*U4-P4*A4;
C42 = A4*x4-b4;
C43 = abs(inv(A4)*b4 - x4); %#ok<MINV>
disp("check1"); disp(C41);
disp("check2"); disp(C42);
disp("check3"); disp(C43);
