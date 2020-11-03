function [ rul ] =  GK2(agent, target, p, speed)

    rul2 = rotateToAngle(agent,[agent.x + 10, agent.y], p);
    SpeedR = rul2.SpeedR;


     if (target(2) < agent.y && agent.y > 500) 
         SpeedY = speed;
     elseif (target(2) > agent.y && agent.y < -500) 
         SpeedY = -speed;
     elseif (abs(target(2)-agent.y) < 50) 
         SpeedY = 0;
     else
         SpeedY = 0;
     end

     if(agent.x > -4200)
         SpeedX = -speed;
     elseif(agent.x < -4400)
         SpeedX = speed;
     else
         SpeedX = 0;
     end
     rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);
end