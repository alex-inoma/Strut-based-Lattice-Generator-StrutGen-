function [isovalue,isovalue_ext,isovalue_int] = strut_grading(app,equation_type,m1,m2,m3,m4,thickness,thickness2,dim,cell_len,xx,yy,zz,posX,posY,posZ,Inner,Outer,Inner2,Outer2)


drawnow;
if app.stopFlag
    return
end
%positionX = dim(1)/2; positionY = dim(2)/2; positionZ = dim(3)/2; %reference position 
%positionX = dim(1); positionY = dim(2); positionZ = dim(3); %reference position 
positionX = posX; positionY = posY; positionZ = posZ; %reference position 
rr = 5;
       
    xx = xx-positionX/cell_len(1); yy = yy-positionY/cell_len(2); zz = zz-positionZ/cell_len(3);     %define the reference frame
    xyz_max = max([max(xx(:)) max(yy(:)) max(zz(:))]);                          %obtain the maximum dimension
    xx = xx/xyz_max; yy = yy/xyz_max; zz = zz/xyz_max;  %xx1,yy1,zz1            %normalize with the maximum dimension
    
    if strcmp(equation_type,'Linear')                                           %for linear grading
        is_f = abs(m1+m2*xx+m3*yy+m4*zz);
    elseif strcmp(equation_type,'Quadratic')                                    %quadratic grading
        is_f = abs(m1+m2*xx.^2+m3*yy.^2+m4*zz.^2);
    elseif strcmp(equation_type,'Cubic')                                        %cubic grading
        is_f = abs(m1+m2*xx.^3+m3*yy.^3+m4*zz.^3);
    elseif strcmp(equation_type,'Circular')                                     %for circular grading patterns
        rr = rr/max(max([cell_len_x cell_len_y cell_len_z]).*xyz_max);
        is_f = abs(sqrt(m1.*xx.^2+m2.*yy.^2+m3.*zz.^2)-rr);
    elseif strcmp(equation_type,'Exponential')
        is_f = abs(exp(m1*xx)+exp(m2*yy)+exp(m3*zz));
    elseif strcmp(equation_type, 'Trigonometric - Sin')
        is_f = abs(sin(m1*xx)+sin(m2*yy)+sin(m3*zz));
    elseif strcmp(equation_type, 'Trigonometric - Cosine')
        is_f = abs(cos(m1*xx)+cos(m2*yy)+cos(m3*zz));
    end
    

    isovalue = (thickness+is_f*(thickness2-thickness))/2;                       %interpolation function to obtain new and unique isovalues
   
    %% Hollow
    isovalue_ext = (Outer+is_f*(Outer2-Outer))/2;                           
    isovalue_int = (Inner+is_f*(Inner2-Inner))/2;
    
