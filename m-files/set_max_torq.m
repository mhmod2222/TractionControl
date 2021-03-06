vrep = remApi('remoteApi');
vrep.simxFinish(-1);

clientID = vrep.simxStart('127.0.0.1', 19999, true, true, 5000, 5);

if (clientID>-1)
    disp('connected')
    [returnCode,rear_left]=vrep.simxGetObjectHandle(clientID,'nakedCar_motorLeft',vrep.simx_opmode_blocking);
    [returnCode,rear_right]=vrep.simxGetObjectHandle(clientID,'nakedCar_motorRight',vrep.simx_opmode_blocking);
    
    while (1)
        [returnCode]=vrep.simxSetJointForce(clientID,rear_left,100,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointForce(clientID,rear_right,1000,vrep.simx_opmode_oneshot);
    end
    
    vrep.simxFinish(-1);
end