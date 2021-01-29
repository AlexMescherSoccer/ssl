function [ball] = avgBall(Ball,CrossZone)
    ball = [0 0];

    if  Ball(1,3) > -CrossZone && Ball(1,3) < CrossZone && Ball(2,3) < CrossZone  && Ball(2,3) > -CrossZone
            d1 = 1 / abs(Ball(1,3) + CrossZone);
            d2 = 1 / abs(CrossZone - Ball(2,3));

            P1x = Ball(1,2) * d1;
            P2x = Ball(2,2) * d2;
            P1y = Ball(1,3) * d1;
            P2y = Ball(2,3) * d2;

            ball(1) = (P1x + P2x)/(d1 + d2);
            ball(2) = (P1y + P2y)/(d1 + d2);
    elseif Ball(1,3) < 0
            ball = Ball(1,2:3);
    elseif Ball(2,3) > 0
            ball = Ball(2,2:3);
    end
end
