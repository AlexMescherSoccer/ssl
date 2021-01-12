function Point = CatchBall(agent, ball, ballline, dist)

K = ballline(1);
%B = ballline(2);

VBall = [1, K];
VRobot = [K, -1];

t = -(cosSimMult((ball - agent.z), VRobot) / (cosSimMult(VBall, VRobot)));
Point = ball + t * VRobot;
%Point = -cosSimMult([ball(1), ball(2)] - [agent.x, agent.y], VRobot ) / cosSimMult( VBall, VRobot ) * VBall + [ball(1), ball(2)];

end
