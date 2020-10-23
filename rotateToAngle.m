function [ rul ] = rotateToAngle(agent, target, p)

u = [cos(agent.ang), sin(agent.ang)];
v = [target(1)-agent.x,  target(2)-agent.y];
rotateAngle = getRotateAngle(u, v);
rul = Crul(0, 0, 0, (rotateAngle) * p, 0);

end