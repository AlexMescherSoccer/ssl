function rul = RotateToPoint(agent, point, speed)
vAng = 0;

vAng = atan2(norm([agent.x - point(1)]) * norm([agent.y - point(2)]) * sin(agent.a), norm([]) * norm([]) * cos(agent.a));

rul = Crul(0, 0, 0, vAng, 0);
end