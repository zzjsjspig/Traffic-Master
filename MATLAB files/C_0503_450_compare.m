
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0423_450_alinea.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids,out_dt)
X = otm.get_state_trajectory();

for i=1:44
    for j=1:360
        if X.flows_vph(i,j)==0
            X.speed_kph(i,j)=120
        end
    end
end

density=X.vehs./(link_lengths'*ones(1,361));
for i=1:44
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end


padded_speed = [X.speed_kph; X.speed_kph(end,:)];
figure;
subplot(211)
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with Maximum On-Ramp and Mainline Demand Flows')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_450_0503.fig')
saveas(gcf,'Flow_450_0503.png')

aah=sum(sum(X.vehs))
J_450=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
J_450.time = X.time;
J_450.vehs = X.vehs;
J_450.flows_vph = X.flows_vph;
J_450.speed_kph = X.speed_kph;
J_450.link_ids = X.link_ids;
%%


configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_450.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids,out_dt)
X = otm.get_state_trajectory();

for i=1:44
    for j=1:360
        if X.flows_vph(i,j)==0
            X.speed_kph(i,j)=120
        end
    end
end

density=X.vehs./(link_lengths'*ones(1,361));
for i=1:44
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end


padded_speed = [X.speed_kph; X.speed_kph(end,:)];

subplot(212)
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with Maximum On-Ramp and Mainline Demand Flows')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_9000_0429.fig')
saveas(gcf,'Flow_9000_0429.png')

ah=sum(sum(X.vehs))
J_450_no=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
J_450_no.time = X.time;
J_450_no.vehs = X.vehs;
J_450_no.flows_vph = X.flows_vph;
J_450_no.speed_kph = X.speed_kph;
J_450_no.link_ids = X.link_ids;
%%

aaaa=100*(ah-aah)/(ah)

