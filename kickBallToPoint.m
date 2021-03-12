function [ rul ] = kickBallToPoint(agent, gk, enm, target, Point, R, p, A, vMax, k)
    


% % %     persistent  BotHist
% % %     if isempty(BotHist)  
% % %         BotHist = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
% % %     end
% % %     BotHist(1,3:4) = agent;


    
    
    if(gk.y > 50)
        Point(2) = Point(2) - 250;
    elseif(gk.y <= 50)
        Point(2) = Point(2) + 250;
    else
        Point(2) = Point(2) - 250;  
    end

    %a = (Point(1) - agent.x)  * (Point(2) - target(2)) - (Point(2) - agent.y) * (Point(1) - target(1));
    
    kick = 0;
    kick2 = 0;
    
    if(norm(agent.z - target) > R + 400)
        %disp(target);
        disp([1, norm(agent.z - target)-R]);
        rul1 = goToPointToo(agent, target, smoothlyMoving(agent, target, A, vMax, k));
        rul2 = rotateToAngle(agent, target, p);
        SpeedX = rul1.SpeedX;
        SpeedY = rul1.SpeedY;
        SpeedR = rul2.SpeedR;
    else
        disp('2');
        B = -(Point(1) - target(1));
        Aa = (Point(2) - target(2));
        D = abs(Aa*(agent.x - target(1)) + B*(agent.y - target(2))) / sqrt(Aa^2 + B^2);
        if(D < 10 && scalarMult(target - agent.z, target - Point) < 0)
            
            disp('3');
            rul1 = goToPointToo(agent, target, smoothlyMoving(agent, target, A / 2, vMax / 2, k));
            SpeedX = rul1.SpeedX; 
            SpeedY = rul1.SpeedY;
            rul2 = rotateToAngle(agent, Point, p);
            SpeedR = rul2.SpeedR;
            if(agent.isBallInside && abs(SpeedR) < 1)
              v = Point - target;
              u = enm - target;   
              ortBase = v * (scalarMult(u, v) / (v * v')) + target;  
              if(norm(ortBase - enm) < 50)
                if(norm(agent.z - enm) <  300)
                  kick = 0;
                  kick2 = 0;
                elseif(norm(agent.z - enm) <  500)
                  kick = 0;
                  kick2 = 1;  
                else
                  kick = 1;
                end
              else
                kick = 1;
                kick2 = 0;          
              end
            end
        else
            disp('6');
            rul1 = speenAroundPoint(agent, target, Point, R, p);
            SpeedX = rul1.SpeedX;
            SpeedY = rul1.SpeedY;
            SpeedR = rul1.SpeedR;
        end
    end
    
    if(((target(2) < 1000 && target(2) > -1000) && (target(1) < -3500 || target(1) > -1000)) || (target(2) > 2500 || target(2) < -2500 || target(1) < -4500 || target(1) > 0))
      SpeedX = 0;
      SpeedY = 0;
      SpeedR = 0;
    end
    rul = Crul(SpeedX, SpeedY, kick, SpeedR, kick2);
end