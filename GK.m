function [ rul ] =  GK(agent, target, pk, speed, A, vMax, k)
    minBallDist = 150;
    maxHistSize = 4;
    persistent targetHist;
   
    if isempty(targetHist)
        targetHist = [target(1); target(2)];
    end
    
    rul2 = rotateToAngle(agent,[agent.x, agent.y + 10], pk);
    SpeedR = rul2.SpeedR;
    
    if(norm(target - targetHist(:, numel(targetHist)/2)') > 0)
      targetHist = [targetHist, [target(1); target(2)]];
    end

    if(length(targetHist) > maxHistSize)
       targetHist = targetHist(:, 2:length(targetHist));
    end
    disp(norm(target - targetHist(:, 1)'));
    if(abs(norm(target - targetHist(:, 1)')) > minBallDist) 
      p = polyfit(targetHist(1, :), targetHist(2, :), 1);
      K = p(1);
      B = p(2);
      Y = (K * (-250)) + B;
      disp('ggggggggg')
    else
        
        if(target(2) < -500)
          Y = 0;
        elseif(target(2) > 500)
          Y = 0; 
        else
          Y = 0;  
        end
        disp('fffffff');
    end

    if(Y < -500)
        Y = -300;
    elseif(Y > 500)
        Y = 300;
    end
    
    if(norm(target - [0,0]) > norm(targetHist(:, numel(targetHist)/2)' - [0,0]))
        Y = 0;
    end
    
    if(abs(agent.y - Y) > 5)
        rul1 = goToPointToo(agent, [-250, Y], smoothlyMoving(agent, [-250, Y], A, vMax, k));
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