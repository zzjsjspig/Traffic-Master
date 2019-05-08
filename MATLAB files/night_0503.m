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


padded_speed = [X.speed_kph; X.speed_kph(end,:)];
figure;
subplot(211)
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with Maximum On-Ramp and Mainline Demand Flows with Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_450_04233.fig')
saveas(gcf,'Flow_450_0423.png')

tvh_0423_450_A=sum(sum(X.vehs))
j_450=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
j_450.time = X.time;
j_450.vehs = X.vehs;
j_450.flows_vph = X.flows_vph;
j_450.speed_kph = X.speed_kph;
j_450.link_ids = X.link_ids;
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
savefig('Flow_0419_450.fig')
saveas(gcf,'Flow_0419_450.png')

tvh_0419_450=sum(sum(X.vehs))
j_450_no=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
j_450_no.time = X.time;
j_450_no.vehs = X.vehs;
j_450_no.flows_vph = X.flows_vph;
j_450_no.speed_kph = X.speed_kph;
j_450_no.link_ids = X.link_ids;
%%

aJ=100*(tvh_0419_450-tvh_0423_450_A)/(tvh_0419_450)

%plot(X_values,X_J,"-x")
%ylabel('TVH Improvement Percentage (%)') 
%title("The Dependence of Total Delay on Controller Presence")