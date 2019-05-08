clear
close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0314_max.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);


otm.run_simple(0,duration,link_ids(1:44),out_dt)
X = otm.get_state_trajectory();

on_ramp_links=[30,32,33,36.39,41,42,44]



figure
subplot(311)
plot(X.time,X.vehs,'LineWidth',2)
ylabel('number of vehicles')
xlabel('Time (seconds)')
grid on
subplot(312)
plot(X.time(2:end),X.flows_vph,'LineWidth',2)
ylabel('flow [vph]')
xlabel('Time (seconds)')
grid


for i=1:8
    for j=1:360
        if X.flows_vph(i,j)==0
            X.speed_kph(i,j)=120
        end
    end
end

       



density=X.vehs./(link_lengths(on_ramp_links)'*ones(1,361));
for i=1:8
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end
subplot(313)
plot(X.time(2:end),X.speed_kph,'LineWidth',2)
ylabel('speed [kph]')
xlabel('Time (seconds)')
grid
lgd=legend(num2str(X.link_ids'))
lgd.FontSize = 4;
lgd.NumColumns = 3
lgd.Location='southeastoutside'



