
import inet.common.lifecycle.LifecycleController;
import inet.common.scenario.ScenarioManager;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.physicallayer.contract.packetlevel.IRadioMedium;

import org.car2x.veins.base.connectionManager.ConnectionManager;
import org.car2x.veins.base.modules.BaseWorldUtility;
import org.car2x.veins.modules.mobility.traci.TraCIScenarioManagerForker;
import org.car2x.veins.modules.mobility.traci.TraCIScenarioManagerLaunchd;
import org.car2x.veins.modules.obstacle.ObstacleControl;
import org.car2x.veins.nodes.AODVRSU;

import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;


network AODVSim
{
    parameters:
        int numberOfRSU;
        string radioMediumType;
        @display("bgb=432,293");
    submodules:
        radioMedium: <radioMediumType> like IRadioMedium {
            parameters:
                @display("p=50,50");
        }
        configurator: IPv4NetworkConfigurator {
            parameters:
                config = xml("<config><interface hosts='*' address='145.236.x.x' netmask='255.255.0.0'/></config>");
                @display("p=50,100");
        }
        routingTableRecorder: RoutingTableRecorder {
            parameters:
                @display("p=50,150");
        }
        lifecycleController: LifecycleController {
            parameters:
                @display("p=50,200");
        }
        rsu[numberOfRSU]: AODVRSU {
            @display("p=187,200;b=10,10,oval");
        }

        baseWorldUtility: BaseWorldUtility {
            @display("p=169,36");
        }
        obstacleControl: ObstacleControl {
            @display("p=310,80");
        }
        connectionManager: ConnectionManager {
            @display("p=287,149");
        }
}
