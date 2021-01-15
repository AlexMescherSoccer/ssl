function [ rul ] = defender(agent, target, frw, Point, R, p, A, vMax, k)
     
    rul1 = rotateToAngle(agent, target, p);
    SpeedR = rul1.SpeedR;
    
    rul2 = goToPointToo(agent, frw.z + [R, 0], smoothlyMoving(agent, target, A, vMax, k));
    SpeedX = rul2.SpeedX;
    SpeedY = rul2.SpeedY;
    
    if(((target(2) < 1000 && target(2) > -1000) && (target(1) < -4000 || target(1) > -500)) || (target(2) > 2500 || target(2) < -2500 || target(1) < -4500 || target(1) > 0))
      SpeedX = 0;
      SpeedY = 0;
      SpeedR = 0;
    end
    
    rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);

end