% Assad Anabosi - UB21044053

% Ellipse 1 (Eq. 1)

% Range for Eq. 1
x1 = -5.25:pi/3000:-0.75;
x1 = real(x1);

% Solving Eq. 1 for y gives us two Eq.'s:
y1 = real(sqrt( -( x1 .* x1 ) - ( 6 .* x1 ) -4 ) - x1 - 2);
y1n = real(-1 .* sqrt( -( x1 .* x1 ) - ( 6 .* x1 ) -4 ) - x1 - 2);

% Ellipse 2 (Eq. 2)

% Range for Eq. 2
x2 = -4.4145:pi/3000:-1.58497;
x2 = real(x2);

% Solving Eq. 2 for y gives us two Eq.'s:
y2 = real(3 .* sqrt( ( -2 .* ( x2 .* x2 ) ) - ( 12 .* x2 ) - 14 ));
y2n = real(-3 .* sqrt( ( -2 .* ( x2 .* x2 ) ) - ( 12 .* x2 ) - 14 ));


% Plotting

p = plot(x1,y1, 'r',x2, y2, 'b', x1, y1n, 'r', x2, y2n, 'b');
grid on;
axis equal;
title('Ellipses Task');
xlabel('X');
ylabel('Y');
legend({'(x + y + 2)^2 + (x + 3)^2 = 5','2(x + 3)^2 +(y/3)^2 = 4'}, 'Location', 'northeast', 'FontSize' ,8);


% Convert Eqations into f(x) and f'(x)

% Eq.(y1 - y2) has two solutions, so we give it two different Xo to get both
% solutions.
f1 = @(x) sqrt( -( x .^ 2 ) - ( 6 .* x ) -4 ) - x - 2 - 3 .* sqrt( ( -2 .* ( x .* x ) ) - ( 12 .* x ) - 14 );
d1 = @(x) - ( x + 3 / ( sqrt( - ( x .^ 2 ) - ( 6 .* x ) - 4) ) ) + (1 .* ((6 .* (x+3))/(sqrt(-2 .* (x .* x) - 12 .* x - 14)))) - 1;

% Eq.(y1 - y2n) has no solution!
f2 = @(x) sqrt( -( x .^ 2 ) - ( 6 .* x ) -4 ) - x - 2 + 3 .* sqrt( ( -2 .* ( x .* x ) ) - ( 12 .* x ) - 14 );
d2 = @(x) - ( x + 3 / ( sqrt( - ( x .^ 2 ) - ( 6 .* x ) - 4) ) ) + (- ((6 .* (x+3))/(sqrt(-2 .* (x .* x) - 12 .* x - 14)))) - 1;

% Eq.(y1n - y2) has one solution
f3 = @(x) -1 .* sqrt( -( x .* x ) - ( 6 .* x ) -4 ) - x - 2 - 3 .* sqrt( ( -2 .* ( x .* x ) ) - ( 12 .* x ) - 14 );
d3 = @(x) ((x+3) / sqrt(-1 .* (x.*x) - 6 .* x - 4)) + ((6 .* (x+3))/(sqrt(-2 .* (x .* x) - 12 .* x - 14))) - 1;

% Eq.(y1n - y2n) has one solution
f4 = @(x) -1 .* sqrt( -( x .* x ) - ( 6 .* x ) -4 ) - x - 2 + 3 .* sqrt( ( -2 .* ( x .* x ) ) - ( 12 .* x ) - 14 );
d4 = @(x) ((x+3) / sqrt(-1 .* (x.*x) - 6 .* x - 4)) - ( ( 6 .* (x + 3) ) / ( sqrt(-2 .* (x .* x) - 12 .* x - 14) ) ) - 1;


% Newton's Method

Xo = 1;
intersection1 = 0;
for i=1:100
    Xi = Xo - (f1(Xo) / d1(Xo));
   if abs(Xi - Xo) <= 0.001
       intersection1 = Xi;
       break
   end
   Xo = Xi;
end
intersection1 = [real(intersection1), real(sqrt( -( intersection1 .* intersection1 ) - ( 6 .* intersection1 ) -4 ) - intersection1 - 2)];

Xo = -4;
intersection2 = 0;
for i=1:100
    Xi = Xo - (f1(Xo) / d1(Xo));
   if abs(Xi - Xo) <= 0.001
       intersection2 = Xi;
       break
   end
   Xo = Xi;
end
intersection2 = [real(intersection2), real(sqrt( -( intersection2 .* intersection2 ) - ( 6 .* intersection2 ) -4 ) - intersection2 - 2)];


Xo = 1;
intersection3 = 0;
for i=1:100
    Xi = Xo - (f3(Xo) / d3(Xo));
   if abs(Xi - Xo) <= 0.001
       intersection3 = Xi;
       break
   end
   Xo = Xi;
end
intersection3 = [real(intersection3), real(3 .* sqrt( ( -2 .* ( intersection3 .* intersection3 ) ) - ( 12 .* intersection3 ) - 14 ))];

Xo = 1;
intersection4 = 0;
for i=1:100
    Xi = Xo - (f4(Xo) / d4(Xo));
   if abs(Xi - Xo) <= 0.001
       intersection4 = Xi;
       break
   end
   Xo = Xi;
end
intersection4 = [real(intersection4), real(-3 .* sqrt( ( -2 .* ( intersection4 .* intersection4 ) ) - ( 12 .* intersection4 ) - 14 ))];

% Printing the intersections as pairs X , Y

intersection1, intersection2, intersection3, intersection4

datatip(p(1), intersection1(1), intersection1(2), Location='northeast', FontSize=8);
datatip(p(1), intersection2(1), intersection2(2), Location='northwest', FontSize=8);
datatip(p(3), intersection3(1), intersection3(2), Location='southwest', FontSize=8);
datatip(p(4), intersection4(1), intersection4(2), Location='southeast', FontSize=8);

