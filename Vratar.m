function rul = Vratar(agent, ball, speed)
    MinBallDist = 10;
    persistent BallHist;

    if isempty(BallHist)
        BallHist = [ball(1); ball(2)];
    end
        
    %sz = size(BallHist);
    if(MinBallDist < norm(ball - BallHist(:, numel(BallHist)/2)'))
        BallHist = [BallHist, [ball(1); ball(2)]];
    end
    
    if(length(BallHist) > 8)
       BallHist = BallHist(:, 2:length(BallHist));
    end

    if(numel(BallHist) > 3)

        p = polyfit(BallHist(1,:), BallHist(2,:), 1);
        K = p(1);
        B = p(2);
        
        Y = (K * 3000)*(2-1) + B;

        rul = GoToPoint(agent, [agent.x, Y], speed);
    else
        rul = Crul(0, 0, 0, 0, 0);
    end
end