class Atlas_Respawn_Vehicles
{
	class Vehicles
	{
		class BaseVehicle
		{
			maxCapacity = 3;
			spawnpoint = 0;
			seatCount = 1; //forget this and just pull from vehicle config
			
			
		}
		

		class BaseTruck : BaseVehicle
		{
			spawnpoint = 1;
		}
		
		class B_Truck_01_transport_F : BaseTruck
		{
			maxCapacity = 15;
		}
		class B_Truck_01_covered_F : B_Truck_01_transport_F
		{

		}

		class O_Truck_03_transport_F : BaseTruck
		{
			maxCapacity = 12;
		}
		class O_Truck_03_covered_F : O_Truck_03_transport_F
		{

		}

	}

	
	
	
	class x 
	{
		class y
		{
			pointArray[] = {0.0,0.5,1.0};
		}
		

	
	}
	
	
	
	
	
	
}