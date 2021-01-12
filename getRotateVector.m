function [ rotateAngle ] = getRotateVector(agent, target, p)

u = [cos(agent.ang), sin(agent.ang)];
v = [target(1)-agent.x,  target(2)-agent.y];
rotateAngle = getRotateAngle(u, v);

end