function [point] = avgPoint(Points,CrossZone)
%     if  Points(1,3) > -CrossZone && Points(1,3) < CrossZone && Points(2,3) < CrossZone  && Points(2,3) > -CrossZone && numel(find(Points(:,1))) > 1
            d1 =  Points(1,3) + CrossZone;
            d2 =  CrossZone - Points(2,3);

            P1x = Points(1,2)* d1;
            P2x = Points(2,2)* d2;
            P1y = Points(1,3)* d1;
            P2y = Points(2,3)* d2;

           point(1) = (P1x + P2x)/(d1 + d2);
% %            disp(P1x + P2x);
           point(2) = (P1y + P2y)/(d1 + d2);   
        if Points(1,2) < -CrossZone 
          point = Points(1,2:3);
        elseif Points(2,2) > CrossZone 
          point = Points(2,2:3);
        end
           %disp(d1 + d2);
%     else
%         point = [0 0];
%     end
    %disp(Points);
    
end
