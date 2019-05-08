%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_0.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 0')
ylabel('Link IDs')
xlabel('Time (seconds)')


configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_0.xml';
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

subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 0 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub0.fig')
saveas(gcf,'sub0.png')



%%

close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_50.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 50')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_50.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 50 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub50.fig')
saveas(gcf,'sub50.png')

%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_100.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 100')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_100.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 100 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub100.fig')
saveas(gcf,'sub100.png')

%%

close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_150.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 150')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_150.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 150 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub150.fig')
saveas(gcf,'sub150.png')
%%
close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_200.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 200')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_200.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 200 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub200.fig')
saveas(gcf,'sub200.png')
%%

close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_250.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 250')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_250.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 250 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub250.fig')
saveas(gcf,'sub250.png')
%%

close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_300.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 300')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_300.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 300 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub300.fig')
saveas(gcf,'sub300.png')

%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_350.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 350')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_350.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 350 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub350.fig')
saveas(gcf,'sub350.png')
%%

close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_400.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 400')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_400.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 400 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub400.fig')
saveas(gcf,'sub400.png')
%%

close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_450.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 450')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_450.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 450 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub450.fig')
saveas(gcf,'sub450.png')
%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_500.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 500')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_500.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 500 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub500.fig')
saveas(gcf,'sub500.png')
%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_550.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 550')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_550.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 550 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub550.fig')
saveas(gcf,'sub550.png')
%%

close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_600.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 600')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_600.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 600 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub600.fig')
saveas(gcf,'sub600.png')
%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_650.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 650')
ylabel('Link IDs')
xlabel('Time (seconds)')
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_650.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 650 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub650.fig')
saveas(gcf,'sub650.png')
%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_700.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 700')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_700.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 700 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub700.fig')
saveas(gcf,'sub700.png')
%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_750.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 750')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_750.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 750 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub750.fig')
saveas(gcf,'sub750.png')
%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_800.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 800')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_800.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 800 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub800.fig')
saveas(gcf,'sub800.png')
%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_850.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 850')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_850.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 850 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub850.fig')
saveas(gcf,'sub850.png')
%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_900.xml';
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
figure;
subplot(2,1,1)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 900')
ylabel('Link IDs')
xlabel('Time (seconds)')

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_900.xml';
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
subplot(2,1,2)
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 900 With Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('sub900.fig')
saveas(gcf,'sub900.png')
