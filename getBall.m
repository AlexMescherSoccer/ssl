function [ball,oldBallPos] = getBall(Balls,oldBallPos)
    CrossZone = 250;
    one = 0;
    two = 0;
    three = 0;
    four = 0;
    nonEmptyBalls = find(Balls(:,1));
    for k = 1:(numel(nonEmptyBalls) + 1) 
       if Balls(k,1) == 1
           one = one + 1;
       end
       if Balls(k,1) == 2
           two = two + 1;
       end
       if Balls(k,1) == 3
           three = three + 1;
       end
       if Balls(k,1) == 4
           four = four + 1;
       end
    end
    if numel(nonEmptyBalls) == 1
        ball = Balls(nonEmptyBalls, 2:3);
    elseif numel(nonEmptyBalls) == 0
        ball = oldBallPos;
% % % % %     elseif one < 2 && two < 2 && three < 2 && four < 2  && Balls(nonEmptyBalls(1)) - Balls(nonEmptyBalls(2)) < CrossZone 
% % % % %         disp('33333333333333333333333333333333333333');
% % % % %         balls = getPosBalls(Balls(nonEmptyBalls, 1:3),Balls(nonEmptyBalls(1)));
% % % % %         ball = avgBall(balls,CrossZone);
% % % % %         ff = find(balls(:,1));
% % % % %         if numel(ff) == 1
% % % % %             ball = balls(ff,2:3);
% % % % %         end
    else
        balls = getPosBalls(Balls(nonEmptyBalls, 1:3),oldBallPos);
        ball = avgBall(balls,CrossZone);
    end
    oldBallPos = ball;
end