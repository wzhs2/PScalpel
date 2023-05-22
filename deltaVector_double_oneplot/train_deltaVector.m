function [net, adaptive_var, gI] = train_deltaVector(net, parameter, adaptive_var, Y, g, global_step)
    L = size(net,2);
    n_size = size(g,2);
    seq_dim = net{L}.seq_dim;
    gI = zeros(seq_dim,n_size);
    %% 对GATlayer进行训练
    for i=L:-1:2
        gI = gI + g((i-2)*seq_dim+1:(i-1)*seq_dim);
        % [attentionLayer, adaptive_var, gI] = train_selfAttention(attentionLayer, parameter, adaptive_var, Y, g, global_step, n_size)
        [net{i}, adaptive_var{i}, gI] = train_selfAttention(net{i}, parameter, adaptive_var{i}, Y{i}.Y, gI, global_step, n_size);

    end
    %% 对FNN进行训练
    %[dnn, adaptive_var, gI] = train_FNN(dnn, parameter, adaptive_var, Y, g, global_step)
    [net{1}, adaptive_var{1}, gI] = train_FNN(net{1}, parameter, adaptive_var{1}, Y{1}.Y, gI, global_step); 
end
