function [ rul ] = kickBallToPoint(agent, gk, target, Point, R, p, A, vMax, k)

%     if(gk.y > 0)
%         Point(2) = Point(2) - 150;
%     else
%         Point(2) = Point(2) + 150;
%     end

    %a = (Point(1) - agent.x)  * (Point(2) - target(2)) - (Point(2) - agent.y) * (Point(1) - target(1));
    
    kick = 0;
    
    if(norm([agent.z, target]) > R + 800)
        rul1 = goToPointToo(agent, target, smoothlyMoving(agent, target, A, vMax, k));
        rul2 = rotateToAngle(agent, target, p);
        SpeedX = rul1.SpeedX;
        SpeedY = rul1.SpeedY;
        SpeedR = rul2.SpeedR;
    else
        B = -(Point(1) - target(1));
        Aa = (Point(2) - target(2));
        D = abs(Aa*(agent.x - target(1)) + B*(agent.y - target(2))) / sqrt(Aa^2 + B^2);
        if( D < 20 && scalarMult(Point-agent.z, Point-target) > 0)
            rul1 = goToPointToo(agent, target, smoothlyMoving(agent, target, A, vMax, k));
            SpeedX = rul1.SpeedX;
            SpeedY = rul1.SpeedY;
            rul2 = rotateToAngle(agent, Point, p);
            SpeedR = rul2.SpeedR;

            if(SpeedR < 5 && agent.isBallInside)
              kick = 1;
            end

        else
            rul1 = speenAroundPoint(agent, target, smoothlyMoving(agent, target, A, vMax, k));
            SpeedX = rul1.SpeedX;
            SpeedY = rul1.SpeedY;
            SpeedR = rul1.SpeedR;

        end
    end
    
    if(((target(2) < 1000 && target(2) > -1000) && (target(1) < -4000 || target(1) > -500)) || (target(2) > 2500 || target(2) < -2500 || target(1) < -4500 || target(1) > 0))
      SpeedX = 0;
      SpeedY = 0;
      SpeedR = 0;
    end
    
    rul = Crul(SpeedX, SpeedY, kick, SpeedR, 0);
end