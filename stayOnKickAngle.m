function [ rul ] = stayOnKickAngle(agent, target, point, pk, A, vMax, k)

persistent targetHist;

    minBallDist = 150;
    maxHistSize = 4;

if isempty(targetHist)
        targetHist = [target(1); target(2)];
end
    
    
    if(norm(target - targetHist(:, numel(targetHist)/2)') > 0)
      targetHist = [targetHist, [target(1); target(2)]];
    end

    if(length(targetHist) > maxHistSize)
       targetHist = targetHist(:, 2:length(targetHist));
    end
    
      p = polyfit(targetHist(1, :), targetHist(2, :), 1);
      K = p(1);
      B = p(2);
      X = (agent.y - B) / K;

      
    if(abs(agent.x - X) > 5 && norm(target - agent.z) < 15   00)
        rul1 = goToPointToo(agent, [X, agent.y], smoothlyMoving(agent, [X, agent.y], A, vMax, k));
        SpeedY = rul1.SpeedY;
        SpeedX = rul1.SpeedX;
    else
        SpeedY = 0;
        SpeedX = 0;
    end

vectorOnUs = target - agent.z ;
vectorFromUs = point - agent.z;
vectorOnUs = vectorOnUs / norm(vectorOnUs);
vectorFromUs = vectorFromUs / norm(vectorFromUs);
angleVector = vectorOnUs + vectorFromUs;
rul1 = rotateToAngle(agent, (agent.z + angleVector), pk);
SpeedR = rul1.SpeedR;
      
if(norm(target - agent.z) < 400)
  kick = 1;
else
  kick = 0;
end
rul = Crul(SpeedX, SpeedY, kick, SpeedR, 0);
end