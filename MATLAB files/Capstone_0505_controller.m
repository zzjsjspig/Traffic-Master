%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0505_7500_controller.xml';
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
%savefig('Flow_7500_controller.fig')
%saveas(gcf,'Flow_7500_controller.png')

tvh_7500_z=sum(sum(X.vehs))
P_7500_z=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
P_7500_z.time = X.time;
P_7500_z.vehs = X.vehs;
P_7500_z.flows_vph = X.flows_vph;
P_7500_z.speed_kph = X.speed_kph;
P_7500_z.link_ids = X.link_ids;

%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0505_8000_controller.xml';
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
savefig('Flow_8000_controller.fig')
saveas(gcf,'Flow_8000_controller.png')

tvh_8000_z=sum(sum(X.vehs))
P_8000_z=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
P_8000_z.time = X.time;
P_8000_z.vehs = X.vehs;
P_8000_z.flows_vph = X.flows_vph;
P_8000_z.speed_kph = X.speed_kph;
P_8000_z.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0505_8500_controller.xml';
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
savefig('Flow_8500.fig')
saveas(gcf,'Flow_8500.png')

tvh_8500_z=sum(sum(X.vehs))
P_8500_z=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
P_8500_z.time = X.time;
P_8500_z.vehs = X.vehs;
P_8500_z.flows_vph = X.flows_vph;
P_8500_z.speed_kph = X.speed_kph;
P_8500_z.link_ids = X.link_ids;

%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0505_9000_controller.xml';
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
savefig('Flow_9000.fig')
saveas(gcf,'Flow_9000.png')

tvh_9000_z=sum(sum(X.vehs))
P_9000_z=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
P_9000_z.time = X.time;
P_9000_z.vehs = X.vehs;
P_9000_z.flows_vph = X.flows_vph;
P_9000_z.speed_kph = X.speed_kph;
P_9000_z.link_ids = X.link_ids;
%%
tvh_0426_z=[tvh_7500_z,tvh_8000_z,tvh_8500_z,tvh_9000_z]
X_values=[7500:500:9000]
for i=1:4
    J(i)=-100*(tvh_0426_z(i)-tvh_0426(i))/(tvh_0426(i))
end
plot(X_values,J,"-x")
xlabel('Different Values of Demand Flow (Number of Cars Per Lane Per Hour)') 
ylabel('TVH Improvement Percentage (%)') 
title("The Dependence of Total Delay on Controller Presence")
