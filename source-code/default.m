function [f,xx,yy,zz] = default(app,lattice_prop)

drawnow;
if app.stopFlag
    return
end

dim = lattice_prop.dim;
cell_len = lattice_prop.cell_len;
gridpoints = lattice_prop.gridpoints;
lattice_type = lattice_prop.lattice_type;

period = [dim(1)/cell_len(1),dim(2)/cell_len(2),dim(3)/cell_len(3)];
if strcmp(lattice_type,'Curved Strut') %Curved Strut    
    if all(period == 1)
        f = getCurvedFunction(lattice_prop);
    else
        f1 = getCurvedFunction(lattice_prop);
        px = mod(period(1),1); py = mod(period(2),1); pz = mod(period(3),1);
        f = repmat(f1,period(2)-py,period(1)-px,period(3)-pz);
        if px ~= 0
            fendx = f(:,1:round(px*size(f1,1)),:); f(:,end+1:end+round(px*size(f1,1)),:) = fendx;
        end
        if py ~= 0
            fendy = f(1:round(py*size(f1,2)),:,:); f(end+1:end+round(py*size(f1,2)),:,:) = fendy;
        end 
        if pz ~= 0
            fendz = f(:,:,1:round(pz*size(f1,3))); f(:,:,end+1:end+round(pz*size(f1,3))) = fendz;
        end
    
    end

elseif strcmp(lattice_type,'Straight Strut') %Straight Strut
    if all(period == 1)
        f = getStraightFunction(lattice_prop);
    else
        f1 = getStraightFunction(lattice_prop);
        px = mod(period(1),1); py = mod(period(2),1); pz = mod(period(3),1);
        f = repmat(f1,period(2)-py,period(1)-px,period(3)-pz);
        if px ~= 0
            fendx = f(:,1:round(px*size(f1,1)),:); f(:,end+1:end+round(px*size(f1,1)),:) = fendx;
        end
        if py ~= 0
            fendy = f(1:round(py*size(f1,2)),:,:); f(end+1:end+round(py*size(f1,2)),:,:) = fendy;
        end 
        if pz ~= 0
            fendz = f(:,:,1:round(pz*size(f1,3))); f(:,:,end+1:end+round(pz*size(f1,3))) = fendz;
        end
    end 
else
    if all(period == 1)
        f = solidDomain(lattice_prop);
    else
        f1 = solidDomain(lattice_prop);
        px = mod(period(1),1); py = mod(period(2),1); pz = mod(period(3),1);
        f = repmat(f1,period(2)-py,period(1)-px,period(3)-pz);
        if px ~= 0
            fendx = f(:,1:round(px*size(f1,1)),:); f(:,end+1:end+round(px*size(f1,1)),:) = fendx;
        end
        if py ~= 0
            fendy = f(1:round(py*size(f1,2)),:,:); f(end+1:end+round(py*size(f1,2)),:,:) = fendy;
        end 
        if pz ~= 0
            fendz = f(:,:,1:round(pz*size(f1,3))); f(:,:,end+1:end+round(pz*size(f1,3))) = fendz;
        end
    end 
end

X = linspace(0, period(1), round(period(1)*gridpoints));
Y = linspace(0, period(2), round(period(2)*gridpoints));
Z = linspace(0, period(3), round(period(3)*gridpoints));
[xx,yy,zz] = meshgrid(X,Y,Z);

end
