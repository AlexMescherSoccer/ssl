function [ rul ] =  GK(agent, target, p, speed)
    minBallDist = 15;
    persistent targetHist;
   
    if isempty(targetHist)
        targetHist = [target(1); target(2)];
    end
    
    rul2 = rotateToAngle(agent,[agent.x - 10, agent.y], p);
    SpeedR = rul2.SpeedR;
        
    if(norm(target - targetHist(:, numel(targetHist)/2)') > minBallDist)
        targetHist = [targetHist, [target(1); target(2)]];
    end
    
    if(length(targetHist) > 8)
       targetHist = targetHist(:, 2:length(targetHist));
    end
    

    if(numel(targetHist) > 3)

        p = polyfit(targetHist(1,:), targetHist(2,:), 1);
        K = p(1);
        B = p(2);
        
        Y = (K * (agent.x)) + B;
        
        if(Y < -500)
            rul1 = GoToPoint(agent, [agent.x, -500], speed);
        elseif(Y > 500)
            rul1 = GoToPoint(agent, [agent.x, 500], speed);
        else
            rul1 = GoToPoint(agent, [agent.x, Y], speed);
        end
        SpeedY = rul1.SpeedY;
        SpeedX = rul1.SpeedX;
        if(agent.x < -500)
         SpeedX = -speed;
        elseif(agent.x > -100)
         SpeedX = speed;
        end
        rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);
    else
        rul = Crul(0, 0, 0, SpeedR, 0);
    end
end