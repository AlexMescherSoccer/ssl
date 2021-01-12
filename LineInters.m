function Point = LineInters(line1, line2)

K = ballline(1);
%B = ballline(2);

VBall = [1, K];
VRobot = [K, -1];

Point = -cosSimMult([ball(1), ball(2)] - [agent.x, agent.y], VRobot ) / cosSimMult( VBall, VRobot ) * VBall + [ball(1), ball(2)];

end