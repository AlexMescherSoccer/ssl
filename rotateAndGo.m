function rul = rotateAndGo(agent, target, a, vMax, k, p)

    rul1 = goToPointToo(agent, target, smoothlyMoving(agent, target, a, vMax, k));
    SpeedX = rul1.SpeedX;
    SpeedY = rul1.SpeedY;

    if(norm(target-agent.z) < 50)
      SpeedR = 0;
    else 
      rul2 = rotateToAngle(agent, target, p);
      SpeedR = rul2.SpeedR; 
    end
    
    rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);
      
end