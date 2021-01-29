function [ rul ] = defender(agent, target, frw, Point, R, p, A, vMax, k)
        
    v = Point - target;
    u = agent.z - target;   
    ortBase = v * (scalarMult(u, v) / (v * v')) + target;
    disp(norm(ortBase - agent.z));
    disp(scalarMult(target - agent.z, target - Point));
    if(norm(ortBase - agent.z) < 150 && scalarMult(target - agent.z, target - Point) > 0)
            rul1 = goToPointToo(agent, target, smoothlyMoving(agent, target, A, vMax, k));
            SpeedX = rul1.SpeedX; 
            SpeedY = rul1.SpeedY;
            if(norm(agent.z - target) < R && norm(Point - target) > norm(Point - agent.z))
               SpeedX = 0; 
               SpeedY = 0;
            end
    else         
            rul1 = goToPointToo(agent, ortBase, smoothlyMoving(agent, ortBase, A, vMax, k));
            SpeedX = rul1.SpeedX; 
            SpeedY = rul1.SpeedY;
    end
    
    rul2 = rotateToAngle(agent, target, p);
    SpeedR = rul2.SpeedR;
    
    if(((target(2) < 1000 && target(2) > -1000) && (target(1) < -4000 || target(1) > -500)) || (target(2) > 2500 || target(2) < -2500 || target(1) < -4500 || target(1) > 0))
      SpeedX = 0;
      SpeedY = 0;
      SpeedR = 0;
    end
    rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);

end