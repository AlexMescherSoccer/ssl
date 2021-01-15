function [ rul ] = speenAroundPoint(agent, target, Point, R, p)
     
    rul1 = rotateToAngle(agent, target, p);
    SpeedR = rul1.SpeedR;
    D = norm(agent.z - target) - R;
    
    if (cosSimMult(agent.z - target, target - Point) > 0)
      SpeedY = getAngleFromVectors(agent.z - target, target - Point);
      if(SpeedY > 70)
        SpeedY = 70;
      end   
      if(SpeedY < 20)
        SpeedY = 20;
      end    
    else
      SpeedY = getAngleFromVectors(agent.z - target, target - Point);
      if(SpeedY < -70)
        SpeedY = -70;
      end
      if(SpeedY > -20)
        SpeedY = -20;
      end
    end
    
    SpeedX = D * 0.25;
    
    rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);

end