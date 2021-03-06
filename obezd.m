function rul = obezd(agent, target, speed, R, a, A, vMax, k)
    delta = target - agent.z;
    dist = sqrt((agent.x - target(1))^2 + (agent.y - target(2))^2);
   
    if(a < 0)
        alpha = asin(R / dist); 
    else
        alpha = -asin(R / dist); 
    end 
    
    dx = delta(1) * cos(alpha) - delta(2) * sin(alpha);
    dy = delta(1) * sin(alpha) + delta(2) * cos(alpha); 
    
    rul = goToPointToo(agent, agent.z+[dx, dy], smoothlyMoving(agent, target, A, vMax, k));
end