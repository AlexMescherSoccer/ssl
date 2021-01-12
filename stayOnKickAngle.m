function [ rul ] = stayOnKickAngle(agent, target, point, p)

vectorOnUs = target - agent.z ;
vectorFromUs = point - agent.z;
vectorOnUs = vectorOnUs / norm(vectorOnUs);
vectorFromUs = vectorFromUs / norm(vectorFromUs);
angleVector = vectorOnUs + vectorFromUs;
rul = rotateToAngle(agent, (agent.z + angleVector), p);

end