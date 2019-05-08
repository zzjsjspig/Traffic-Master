clear
close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_450.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 450')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('Flow_450_23.fig')
saveas(gcf,'Flow_450_23.png')

tvh_0=sum(sum(X.vehs))
Y_450=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_450.time = X.time;
Y_450.vehs = X.vehs;
Y_450.flows_vph = X.flows_vph;
Y_450.speed_kph = X.speed_kph;
Y_450.link_ids = X.link_ids;
%%
clear
close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_0.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 450')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('Flow_450_23.fig')
saveas(gcf,'Flow_450_23.png')

tvh_0=sum(sum(X.vehs))
Y_0=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_0.time = X.time;
Y_0.vehs = X.vehs;
Y_0.flows_vph = X.flows_vph;
Y_0.speed_kph = X.speed_kph;
Y_0.link_ids = X.link_ids;