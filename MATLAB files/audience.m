%%
clear
close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0314_max.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

for i=1:28
    for j=1:360
        if X.flows_vph(i,j)==0
            X.speed_kph(i,j)=120
        end
    end
end

       



density=X.vehs./(link_lengths(1:28)'*ones(1,361));
for i=1:28
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end



padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
subplot(2,1,1);
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with Maximum Flow')
ylabel('Link IDs')
xlabel('Time (seconds)')






tvh=sum(sum(X.vehs))
tvm=sum(sum(X.flows_vph))

%%


configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0412_min.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();



for i=1:28
    for j=1:360
        if X.flows_vph(i,j)==0
            X.speed_kph(i,j)=120
        end
    end
end

       



density=X.vehs./(link_lengths(1:28)'*ones(1,361));
for i=1:28
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end



padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
subplot(2,1,2);
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with Minimal Flow')
ylabel('Link IDs')
xlabel('Time (seconds)')






tvh=sum(sum(X.vehs))
tvm=sum(sum(X.flows_vph))
