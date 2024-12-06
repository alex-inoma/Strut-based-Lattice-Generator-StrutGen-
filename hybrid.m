function f = hybrid(f,lattice_prop)

    if lattice_prop.i == 0
        lattice_prop.i = lattice_prop.i+1;
        
        if strcmp(lattice_prop.lattice_type,"Straight Strut")
            f2 = getStraightFunction(lattice_prop); 
        elseif strcmp(lattice_prop.lattice_type,"Curved Strut")
            f2 = getCurvedFunction(lattice_prop);
        end
        
        f = min(f,f2);
    end

end

