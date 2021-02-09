function rul = goToPointToo(agent, target, speed)
    delta = target - agent.z;
    alpha = agent.ang - pi / 2;
    
    cosA = cos(alpha);
    sinA = sin(alpha);
    
    dx = delta(2) * cosA - delta(1) * sinA;
    dy = delta(2) * sinA + delta(1) * cosA; 
    
    size = sqrt(dx * dx + dy * dy);
    factor = speed / size;
    rul = Crul(dx * factor, dy * factor, 0, 0, 0);
end