function newInertiaWeight = UpdateInertiaWeight(inertiaWeight, beta, minInertiaWeight)

    newInertiaWeight = 0;
    
    if inertiaWeight == minInertiaWeight
        return
    end
    
    newInertiaWeight = max(beta * inertiaWeight, minInertiaWeight);

end