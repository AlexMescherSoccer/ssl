function [ rul ] = speenAroundPoint(agent, Point, R)
     
    rul1 = rotateToAngle(agent, Point, p);
    SpeedR = rul1.SpeedR;
    D = norm([agent.z, target]) - R;
    SpeedX = D * 4;
    SpeedY = 30;
    
    rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);
    
end