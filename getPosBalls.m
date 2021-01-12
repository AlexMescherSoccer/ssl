function [ball] = getPosBalls(Balls,oldBallPos)
ballFindingZone = 500;
ball = [0,0,0;0,0,0;0,0,0;0,0,0];
Dmin = [100000,100000,100000,100000];

nonEmptyBalls = find(Balls(:,1));

if numel(nonEmptyBalls) == 1
    ball(Balls(nonEmptyBalls,1),:) = Balls(nonEmptyBalls,1:3);
else
    for k = nonEmptyBalls
      dist = norm(oldBallPos - Balls(k,2:3));
      if   Dmin(Balls(k,1)) >= dist && ballFindingZone > dist 
         Dmin(Balls(k,1)) = dist;
         ball(Balls(k,1),:) =  Balls(k,1:3);
      end
    end
end

end