function [ball] = avgBall(Balls,CrossZone)
%     if  Balls(1,3) > -CrossZone && Balls(1,3) < CrossZone && Balls(2,3) < CrossZone  && Balls(2,3) > -CrossZone && numel(find(Balls(:,1))) > 1
            d1 = 1 / abs(Balls(1,3) + CrossZone);
            d2 = 1 / abs(CrossZone - Balls(2,3));

            P1x = Balls(1,2)* d1;
            P2x = Balls(2,2)* d2;
            P1y = Balls(1,3)* d1;
            P2y = Balls(2,3)* d2;

           ball(1) = (P1x + P2x)/(d1 + d2);
           disp(P1x + P2x);
           ball(2) = (P1y + P2y)/(d1 + d2);   
           %disp(d1 + d2);
%     else
%         ball = [0 0];
%     end
    %disp(Balls);
    
end
