function [f] = solidDomain(lattice_prop)

gridpoints = lattice_prop.gridpoints;


x = linspace(-1, 1, gridpoints); 
y = linspace(-1, 1, gridpoints); 
z = linspace(-1, 1, gridpoints); 
[x1,y1,z1] = meshgrid(x,y,z);

f = max(abs(x1) - 0.5, max(abs(y1) - 0.5, abs(z1) - 0.5));

