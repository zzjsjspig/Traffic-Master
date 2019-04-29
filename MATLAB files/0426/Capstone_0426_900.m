%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0426_7500.xml';
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
title('Speed at Different Links with On-Ramp Demand Flow of 900')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_7500_a.fig')
saveas(gcf,'Flow_7500_a.png')

tvh_7500=sum(sum(X.vehs))
J_7500=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
J_7500.time = X.time;
J_7500.vehs = X.vehs;
J_7500.flows_vph = X.flows_vph;
J_7500.speed_kph = X.speed_kph;
J_7500.link_ids = X.link_ids;

%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0426_8000.xml';
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
title('Speed at Different Links with On-Ramp Demand Flow of 900')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_8000_a.fig')
saveas(gcf,'Flow_8000_a.png')

tvh_8000=sum(sum(X.vehs))
J_8000=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
J_8000.time = X.time;
J_8000.vehs = X.vehs;
J_8000.flows_vph = X.flows_vph;
J_8000.speed_kph = X.speed_kph;
J_8000.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0426_8500.xml';
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
title('Speed at Different Links with On-Ramp Demand Flow of 900')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_8500_a.fig')
saveas(gcf,'Flow_8500_a.png')

tvh_8500=sum(sum(X.vehs))
J_8500=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
J_8500.time = X.time;
J_8500.vehs = X.vehs;
J_8500.flows_vph = X.flows_vph;
J_8500.speed_kph = X.speed_kph;
J_8500.link_ids = X.link_ids;

%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0426_9000.xml';
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
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 900 at Maximum Mainline Demand Flow')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_9000_a.fig')
saveas(gcf,'Flow_9000_a.png')

tvh_9000=sum(sum(X.vehs))
J_9000=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
J_9000.time = X.time;
J_9000.vehs = X.vehs;
J_9000.flows_vph = X.flows_vph;
J_9000.speed_kph = X.speed_kph;
J_9000.link_ids = X.link_ids;
%%
tvh_0426=[tvh_7500,tvh_8000,tvh_8500,tvh_9000]
