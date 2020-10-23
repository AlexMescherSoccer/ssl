function rul = GoToPoint(agent, point, speed)
vX = 0;
vY = 0;


rX = (point(1) - agent.x) * cos(agent.ang) + (point(2) - agent.y) * sin(agent.ang);
rY = (point(1) - agent.x) * sin(agent.ang) - (point(2) - agent.y) * cos(agent.ang);

vX = rX / norm([rX, rY]) * speed;
vY = rY / norm([rX, rY]) * speed;

rul = Crul(vX, vY, 0, 0, 0);
end