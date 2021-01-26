function [ rul ] = defender(agent, target, frw, Point, R, p, A, vMax, k)
        
    B = -(Point(1) - target(1));
    Aa = (Point(2) - target(2));
    D = abs(Aa*(agent.x - target(1)) + B*(agent.y - target(2))) / sqrt(Aa^2 + B^2);
    if(D < 100 && scalarMult(target - agent.z, target - Point) < 0)
            rul1 = goToPointToo(agent, target, smoothlyMoving(agent, target, A, vMax, k));
            SpeedX = rul1.SpeedX; 
            SpeedY = rul1.SpeedY;
            rul2 = rotateToAngle(agent, target, p);
            SpeedR = rul2.SpeedR;
            if(norm(agent.z - target) < R)
               SpeedX = 0; 
               SpeedY = 0;
            end
    else
            v = Point - target;
            u = agent.z - target;            
            rul1 = goToPointToo(agent, v * (scalarMult(u, v) / (v * v')) + target, smoothlyMoving(agent, target, A, vMax, k));
            SpeedX = rul1.SpeedX; 
            SpeedY = rul1.SpeedY;
            rul2 = rotateToAngle(agent, target, p);
            SpeedR = rul2.SpeedR;
    end
    
    if(((target(2) < 1000 && target(2) > -1000) && (target(1) < -4000 || target(1) > -500)) || (target(2) > 2500 || target(2) < -2500 || target(1) < -4500 || target(1) > 0))
      SpeedX = 0;
      SpeedY = 0;
      SpeedR = 0;
    end
    
    rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);

end