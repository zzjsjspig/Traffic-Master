%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/n_Capstone_0426_7500_controller.xml';
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
savefig('n_Flow_7500_controller.fig')
saveas(gcf,'n_Flow_7500_controller.png')

n_tvh_7500_c=sum(sum(X.vehs))
n_P_7500=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
n_P_7500.time = X.time;
n_P_7500.vehs = X.vehs;
n_P_7500.flows_vph = X.flows_vph;
n_P_7500.speed_kph = X.speed_kph;
n_P_7500.link_ids = X.link_ids;

%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/n_Capstone_0426_8000_controller.xml';
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
savefig('n_Flow_8000_controller.fig')
saveas(gcf,'n_Flow_8000_controller.png')

n_tvh_8000_c=sum(sum(X.vehs))
n_P_8000=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
n_P_8000.time = X.time;
n_P_8000.vehs = X.vehs;
n_P_8000.flows_vph = X.flows_vph;
n_P_8000.speed_kph = X.speed_kph;
n_P_8000.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/n_Capstone_0426_8500_controller.xml';
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
savefig('n_Flow_8500.fig')
saveas(gcf,'n_Flow_8500.png')

n_tvh_8500_c=sum(sum(X.vehs))
n_P_8500=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
n_P_8500.time = X.time;
n_P_8500.vehs = X.vehs;
n_P_8500.flows_vph = X.flows_vph;
n_P_8500.speed_kph = X.speed_kph;
n_P_8500.link_ids = X.link_ids;

%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/n_Capstone_0426_9000_controller.xml';
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
savefig('n_Flow_9000.fig')
saveas(gcf,'n_Flow_9000.png')

n_tvh_9000_c=sum(sum(X.vehs))
n_P_9000=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
n_P_9000.time = X.time;
n_P_9000.vehs = X.vehs;
n_P_9000.flows_vph = X.flows_vph;
n_P_9000.speed_kph = X.speed_kph;
n_P_9000.link_ids = X.link_ids;
%%
n_tvh_0426_c=[n_tvh_7500_c,n_tvh_8000_c,n_tvh_8500_c,n_tvh_9000_c]
X_values=[7500:500:9000]
for i=1:4
    n_J(i)=-100*(n_tvh_0426_c(i)-n_tvh_0426(i))/(n_tvh_0426(i))
end
plot(X_values,n_J,"-x")
xlabel('Different Values of Demand Flow (Number of Cars Per Lane Per Hour)') 
ylabel('TVH Improvement Percentage (%)') 
title("The Dependence of Total Delay on Controller Presence")
