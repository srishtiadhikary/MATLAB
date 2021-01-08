function prandtlmeyer=prandtlmeyer(m)
% for gamma=1.4
prandtlmeyer=2.449489*atan(sqrt(0.166667*(m*m -1)))-atan(sqrt(m*m -1));