function newSpeed = changeSpeed(agentid, goalSpeed)
    step = [10, 10, 3];
    persistent oldSpeed;
    if isempty(oldSpeed)
       oldSpeed = zeros(12, 3);
    end
    
    newSpeed = oldSpeed(agentid, :);
    for k = 1:3
        newSpeed(k) = exStep(oldSpeed(agentid, k), goalSpeed(k), step(1));
    end
    
    oldSpeed(agentid, :) = newSpeed;
end

function res = exStep(cur, goal, step)
    res = cur+getMinStep(goal-cur, step*sign(goal-cur));
end

function res = getMinStep(step1, step2)
    if abs(step1) < abs(step2)
        res = step1;
    else
        res = step2;
    end
end