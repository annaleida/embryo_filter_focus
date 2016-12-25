function [mask] = mask(sizeX, sizeY, index_)


if 1 == 0 % Hardcode for testing
    if index_ == 1 %A
        radius = 191; center = [270, 349];
    elseif index_ == 2 %0
        radius = 114; center = [255,392];
    elseif index_ == 3 %1
        radius = 62; center = [255,392];
    elseif index_ == 4 %A
        radius = 180; center = [756,363];
    elseif index_ == 5 %0
        radius = 107; center = [768, 382];
    elseif index_ == 6 %1
        radius = 53; center = [768, 382];
    elseif index_ == 7 %A
        radius = 197; center = [1262, 365];
    elseif index_ == 8 %0
        radius = 100; center = [1225,455];
    elseif index_ == 9 %1
        radius = 50; center = [1225,455];
    end;
else
    pos = ginput(2);
diff = (pos(2,:) - pos(1,:))/2;
radius = sqrt(dot(diff,diff))
center = pos(1,:) + diff
end;
[X,Y] = ndgrid((1:sizeY) - center(2),(1:sizeX) - center(1) );
mask = (X.^2 + Y.^2)>radius^2;