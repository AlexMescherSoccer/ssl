function [ball,oldBallPos] = getBall(Balls,oldBallPos)
    CrossZone = 250;
    nonEmptyBalls = find(Balls(:,1));
    if numel(nonEmptyBalls) == 1
        ball = Balls(nonEmptyBalls, 2:3);
    elseif numel(nonEmptyBalls) == 0
        ball = oldBallPos;
    else
        balls = getPosBalls(Balls(nonEmptyBalls, 1:3),oldBallPos);
        ball = avgBall(balls,CrossZone);
    end
    oldBallPos = ball;
end