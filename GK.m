function [ rul ] =  GK(agent, target, pk, speed, A, vMax, k)
    minBallDist = 7;
    persistent targetHist;
   
    if isempty(targetHist)
        targetHist = [target(1); target(2)];
    end
    
    rul2 = rotateToAngle(agent,[agent.x, agent.y + 10], pk);
    SpeedR = rul2.SpeedR;
    
    targetHist = [targetHist, [target(1); target(2)]];
    
    if(length(targetHist) > 7)
       targetHist = targetHist(:, 2:length(targetHist));
    end
    
    if(abs(norm(target - targetHist(:, 1)')) > minBallDist) 
      p = polyfit(targetHist(1,:), targetHist(2,:), 1);
      K = p(1);
      B = p(2);
      Y = (K * (agent.x)) + B;
    else
        if(target(2) < -500)
          Y = -350;
        elseif(target(2) > 500)
          Y = 350; 
        else
          Y = 0;  
        end
    end

    if(Y < -500)
        Y = -500;
    elseif(Y > 500)
        Y = 500;
    end
    
    if(abs(agent.y - Y) > 65)
        rul1 = goToPointToo(agent, [-250, Y], smoothlyMoving(agent, target, A, vMax, k));
        SpeedY = rul1.SpeedY;
        SpeedX = rul1.SpeedX;
    else
        rul2 = rotateToAngle(agent, target, pk);
        SpeedR = rul2.SpeedR;
        SpeedY = 0;
        SpeedX = 0;
    end
    
    rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);
end