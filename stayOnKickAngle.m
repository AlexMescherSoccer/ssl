function [ rul ] = stayOnKickAngle(agent, target, point, p)

vectorOnUs = target - agent.z ;
vectorFromUs = point - agent.z;
vectorOnUs = vectorOnUs / norm(vectorOnUs);
vectorFromUs = vectorFromUs / norm(vectorFromUs);
angleVector = vectorOnUs + vectorFromUs;
rul1 = rotateToAngle(agent, (agent.z + angleVector), p);
SpeedR = rul1.SpeedR;

if(agent.isBallInside)
  rul = Crul(0, 0, 1, SpeedR, 0);
else
  rul = Crul(0, 0, 0, SpeedR, 0);
end

end