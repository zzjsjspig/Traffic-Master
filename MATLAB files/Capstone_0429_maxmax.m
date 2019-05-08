close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0426_9000.xml';
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
for i=1:18
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end


padded_speed = [X.speed_kph; X.speed_kph(end,:)];
figure;
subplot(211)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with Maximum On-Ramp and Mainline Demand Flows')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_9000_0429.fig')
saveas(gcf,'Flow_9000_0429.png')

tvh_9000_0427=sum(sum(X.vehs))
J_9000_0427=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
J_9000_0427.time = X.time;
J_9000_0427.vehs = X.vehs;
J_9000_0427.flows_vph = X.flows_vph;
J_9000_0427.speed_kph = X.speed_kph;
J_9000_0427.link_ids = X.link_ids;
%%

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0426_9000_controller.xml';
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
for i=1:18
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end

padded_speed = [X.speed_kph; X.speed_kph(end,:)];

subplot(212)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with Maximum On-Ramp and Mainline Demand Flows with Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_9000_0429_c.fig')
saveas(gcf,'Flow_9000_0429_c.png')

tvh_9000_0427_c=sum(sum(X.vehs))
J_9000_0427_c=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
J_9000_0427_c.time = X.time;
J_9000_0427_c.vehs = X.vehs;
J_9000_0427_c.flows_vph = X.flows_vph;
J_9000_0427_c.speed_kph = X.speed_kph;
J_9000_0427_c.link_ids = X.link_ids;