function rul = PassTo(setter, receiver, p)


    rul2 = rotateToAngle(setter, receiver.z, p);
    SpeedR = rul2.SpeedR; 
    if(abs(SpeedR) < 5)
        rul = Crul(0, 0, 1, 0, 0);
    else 
        rul = Crul(0, 0, 0, SpeedR, 0);
    end

end