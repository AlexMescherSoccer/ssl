  function rul = Vratar2(agent, ball, speed)

    MinBallDist = 50;
    persistent BallHist;
     
    if isempty(BallHist)
        BallHist = [ball(1); ball(2)];
    end

    BallHist = [BallHist, [ball(1); ball(2)]];
        
        
    if(length(BallHist) > 8)
       BallHist = BallHist(:, 2:length(BallHist));
    end
  
     if(numel(BallHist) > 3 && MinBallDist < norm(ball' - BallHist(:, 1)))
 
        p = polyfit(BallHist(1,:), BallHist(2,:), 1);

        Point = CatchBall(agent, ball, p, 0);
        
        disp(Point);
        
        rul = goToPointToo(agent, Point, smoothlyMoving(agent, Point, 2, 1, 2.3));
              
     else
         
         rul = Crul(0, 0, 0, 0, 0);
    end
end