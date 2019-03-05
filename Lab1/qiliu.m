clear;
clc;

total_T = 0;
time_rec=[];
for i = 1:100
    count = [1];
    Door = [];
    newDoor = randi([1,3]);
    [d2, d3] = deal(0);
    Door = [Door newDoor];
    if(newDoor == 3) d3 = d3 + 1; 
    elseif(newDoor == 2) d2 = d2 + 1; end
    while newDoor ~= 1
        newDoor = randi([1,3]);
        if(newDoor == 3) d3 = d3 + 1; 
        elseif(newDoor == 2) d2 = d2 + 1; end
        Door = [Door newDoor];
        count = [count length(count)+1];
    end
    time = d3.*7+d2.*5+3;
    total_T = total_T + time;
    average = total_T/i;
    time_rec = [time_rec time];
    subplot(221), scatter(i, time, 8, 'g'), axis([0, 100, 0, 70]), hold on 
    subplot(222), plot(count, Door, 'LineWidth', 5), axis([1, 12, 0.5, 3.5]), hold off
    subplot(223), scatter(i, average, 8, 'b'), axis([0, 100, 0, 30]), hold on
    subplot(224), hist(time_rec, 100), hold on
end

