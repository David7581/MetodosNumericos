% Metodo de Runge Kutta segundo orden
% Autores
% Jonathan Ramon David Tello
% Fecha de implementacion: 17/12/2021
% Parametros de entrada
% f: funcion a evaluar
% x: punto inicial de x
% y: punto inicial de y
% h: tamano de paso
% xf: punto final de x
% Parametros de salida
% X: Puntos de x
% Y: Puntos de y
function [X,Y] = rungekutta(fxy, x_0, y_0, h, x_f)
syms x y; % Inicializacion de variables
X = x_0:h:x_f; % Creacion de matriz con valores de x
Y = (1:length(X)); % Creacion de array vacio para valores calculados de y
Y(1, 1) = y_0;
for i = 1:length(X) - 1
    k_1 = subs(fxy, {x y}, {X(i) y_0});
    k_2 = subs(fxy, {x y}, {(X(i) + 1/2 * h) (y_0 + 1/2 * k_1 * h)});
    y_1 = y_0 + k_2 * h; % Cálculo de y
    Y(1, i + 1) = y_1; % Se agrega los valores calculados de y a la matriz
    y_0 = y_1; % Se actualiza el valor de y_0
end

