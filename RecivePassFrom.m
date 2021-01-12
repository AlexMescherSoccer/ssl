function rul = RecivePassFrom(setter, receiver, p)

    rul2 = rotateToAngle(receiver, setter.z, p);
    SpeedR = rul2.SpeedR; 
    if(abs(SpeedR) < 5)
        rul = Crul(0, 0, 0, 0, 0);
    else 
      rul = Crul(0, 0, 0, SpeedR, 0);
    end

end