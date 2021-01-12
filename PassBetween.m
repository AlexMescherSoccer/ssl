function [rul1, rul2] = PassBetween(setter, receiver, p)

    rul2 = RecivePassFrom(setter, receiver, p);
    rul1 = PassTo(setter, receiver, p);

end