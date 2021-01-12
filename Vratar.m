  function rul = Vratar(agent, ball, speed)
    rul = Crul(0, 0, 0, 0, 0);
    Xv = 0;
    MinBallDist = 10;
    persistent BallHist;
    t = 1;
    told = 2;
    l = 0;
%     if(l == 0)
%     rul.SpeedX = 0;
% 
%     rul.SpeedX = 0;
%     
%     l = 1:
%     end
    disp(ball);
    
    if isempty(BallHist)
        BallHist = [ball(1); ball(2)];
    end
        
    %if(BallHist(:, numel(BallHist)/2) ~= ball')
        BallHist = [BallHist, [ball(1); ball(2)]];
        
        
    if(length(BallHist) > 8)
       BallHist = BallHist(:, 2:length(BallHist));
    end

    rul2 = rotateToAngle(agent, [Xv, 2000], 30);
        
    if(numel(BallHist) > 3 && MinBallDist < norm(ball' - BallHist(:, 1)))
 
        p = polyfit(BallHist(1,:), BallHist(2,:), 1);
        K = p(1);
        B = p(2);
        
        Y = (K * Xv) + B;
        
        if (Y > 500)
            Y = 500;
        end
        
        if (Y < -500)
            Y = -500;
        end
        
        

         
        
        %if(told - t > 1)
        
        %end
        rul = goToPointToo(agent, [ Xv, Y], smoothlyMoving(agent , [ Xv, Y], 2, 2, 2.6));
        rul = Crul(rul.SpeedX, rul.SpeedY, 0, rul2.SpeedR, 0);
         
%         if(rul.SpeedY < 10)
%              rul3 = rotateToAngle(agent, [ball(1); ball(2)], 30);
%              rul = Crul(rul.SpeedX, rul.SpeedY, 0, rul3.SpeedR, 0);
            %rul = rotateToAngle(agent, [ball(1); ball(2)], 30);
            
%         end
              
    else
        
        %rul = GoToPoint(agent, [X, 0], 30
        rul = goToPointToo(agent, [ Xv, 0], smoothlyMoving(agent , [ Xv, 0], 2, 1, 2.3));
        rul = Crul(rul.SpeedX, rul.SpeedY, 0, rul2.SpeedR, 0);
        
        
%         disp('stop');
    end
    %end
end