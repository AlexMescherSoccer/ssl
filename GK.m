function [ rul ] =  GK(agent, target, goal, pk, speed, A, vMax, k, grn)
    minBallDist = 15;
    maxHistSize = 4;
    persistent targetHist;
    persistent Y;
    Point = [-2250, 0];
    kick = 0;
   
    if isempty(targetHist)
        targetHist = [target(1); target(2)];
    end
    
    if isempty(Y)
        Y = 0;
    end
    
    rul2 = rotateToAngle(agent,[agent.x, agent.y + 10], pk);
    SpeedR = rul2.SpeedR;
    
    if(norm(target - targetHist(:, numel(targetHist)/2)') > 0)
      targetHist = [targetHist, [target(1); target(2)]];
    end

    if(length(targetHist) > maxHistSize)
       targetHist = targetHist(:, 2:length(targetHist));
    end

    if(abs(norm(target - targetHist(:, 1)')) > minBallDist) 
      p = polyfit(targetHist(1, :), targetHist(2, :), 1);
      K = p(1);
      B = p(2);
      Y = K * goal(1) + B;
    else        
      Y = Y;
    end

    if(Y < -700)
        Y = 0;
    elseif(Y > 700)
        Y = 0;
    end
    
%     if(grn)
%         if(norm(target - targetHist(:, 1)') < (minBallDist + 500) && (target(1) < -3500 && target(2) < 1000 && target(2) > -1000))
%             B = -(Point(1) - target(1));
%             Aa = (Point(2) - target(2));
%             D = abs(Aa*(agent.x - target(1)) + B*(agent.y - target(2))) / sqrt(Aa^2 + B^2);
%             if(D < 40 && scalarMult(target - agent.z, target - Point) < 0)
%                 rul1 = goToPointToo(agent, target, 20);
%                 SpeedX = rul1.SpeedX; 
%                 SpeedY = rul1.SpeedY;
%                 rul2 = rotateToAngle(agent, Point, pk);
%                 SpeedR = rul2.SpeedR;
%                 if(agent.isBallInside && abs(SpeedR) < 1)
%                     kick = 1;
%                 end
%             else
%                 rul1 = speenAroundPoint(agent, target, Point, 300, pk);
%                 SpeedX = rul1.SpeedX;
%                 SpeedY = rul1.SpeedY;
%                 SpeedR = rul1.SpeedR;
%             end
%         else
%     
%             if(abs(agent.y - Y) > 5)
%                 rul1 = goToPointToo(agent, [goal(1), Y], smoothlyMoving(agent, [goal(1), Y], A, vMax, k));
%                 SpeedY = rul1.SpeedY;
%                 SpeedX = rul1.SpeedX;
%             else
%                 rul2 = rotateToAngle(agent, target, pk);
%                 SpeedR = rul2.SpeedR;
%                 SpeedY = 0;
%                 SpeedX = 0;
%             end
%         end
%     else
%         if(norm(target - targetHist(:, 1)') < (minBallDist + 500) && target(1) > -1000 && target(2) < 1000 && target(2) > -1000)
%             B = -(Point(1) - target(1));
%             Aa = (Point(2) - target(2));
%             D = abs(Aa*(agent.x - target(1)) + B*(agent.y - target(2))) / sqrt(Aa^2 + B^2);
%             if(D < 40 && scalarMult(target - agent.z, target - Point) < 0)
%                 rul1 = goToPointToo(agent, target, 20);
%                 SpeedX = rul1.SpeedX; 
%                 SpeedY = rul1.SpeedY;
%                 rul2 = rotateToAngle(agent, Point, pk);
%                 SpeedR = rul2.SpeedR;
%                 if(agent.isBallInside && abs(SpeedR) < 1)
%                     kick = 1;
%                 end
%             else
%                 rul1 = speenAroundPoint(agent, target, Point, 150, pk);
%                 SpeedX = rul1.SpeedX;
%                 SpeedY = rul1.SpeedY;
%                 SpeedR = rul1.SpeedR;
%             end
%         else
%             if(abs(agent.y - Y) > 5)
%                 rul1 = goToPointToo(agent, [goal(1), Y], smoothlyMoving(agent, [goal(1), Y], A, vMax, k));
%                 SpeedY = rul1.SpeedY;
%                 SpeedX = rul1.SpeedX;
%             else
%                 rul2 = rotateToAngle(agent, target, pk);
%                 SpeedR = rul2.SpeedR;
%                 SpeedY = 0;
%                 SpeedX = 0;
%             end
%         end
%     end
    
            if(abs(agent.y - Y) > 5)
                rul1 = goToPointToo(agent, [goal(1), Y], smoothlyMoving(agent, [goal(1), Y], A, vMax, k));
                SpeedY = rul1.SpeedY;
                SpeedX = rul1.SpeedX;
            else
                rul2 = rotateToAngle(agent, target, pk);
                SpeedR = rul2.SpeedR;
                SpeedY = 0;
                SpeedX = 0;
            end
      
    rul = Crul(SpeedX, SpeedY, 0, SpeedR, kick);
end