function [ball] = getPosBalls(Balls,oldBallPos)
    ballFindingZone = 500;
    ball = [0,0,0;0,0,0;0,0,0;0,0,0];
    Dmin = [111488,222228,331337,404404];

    for k = 1:numel(Balls)/3
        dist = norm(oldBallPos - Balls(k,2:3));
        if Balls(k,1) ~= 0 && Dmin(Balls(k,1)) >= dist && ballFindingZone > dist  
            Dmin(Balls(k,1)) = dist;
            ball(Balls(k,1),:) =  Balls(k,1:3);
        end
    end
end