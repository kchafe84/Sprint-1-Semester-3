


//----------------------------------------------
const Pool = require("pg").Pool;

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "sprint1db",
  password: "Keyin2021",
  port: 5432,
});

const getAircrafts = (request, response) => {
  pool.query("SELECT * FROM aircraft ORDER BY id ASC", (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

//--------------------------------------------------------------

const createAircraft = (request, response) => {
  const { id, type, airline_name, weight_kg, number_of_passenger } =
    request.body;

  pool.query(
    "INSERT INTO aircraft (id, type, airline_name, weight_kg, number_of_passenger) VALUES ($1, $2, $3, $4, $5)",
    [id, type, airline_name, weight_kg, number_of_passenger],
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(201).send(`Aircraft added with ID: ${results.insertId}`);
    }
  );
};

//------------------------------------------------------------

const deleteAircraft = (request, response) => {
  const id = parseInt(request.params.id);

  pool.query("DELETE FROM aircraft WHERE id = $1", [id], (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).send(`Aircraft deleted with ID: ${id}`);
  });
};

//------------------------------------------------------------

const updateAircraft = (request, response) => {
  const id = parseInt(request.params.id);
  const { type, airline_name, weight_kg, number_of_passenger } = request.body;

  pool.query(
    "UPDATE aircraft SET type = $1, airline_name = $2, weight_kg = $3, number_of_passenger = $4 WHERE id = $5",
    [type, airline_name, weight_kg, number_of_passenger, id],
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).send(`Aircraft modified with ID: ${id}`);
    }
  );
};

// Airports in What City

const airportsCities = (request, response) => {
  pool.query(
    "SELECT * FROM city, airport WHERE city.id = airport.city_id",
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};


// Airports in What City by ID

const airportsCitiesByid = (request, response) => {
  const id = parseInt(request.params.id);

  pool.query(
    `SELECT * FROM city, airport WHERE city.id = airport.city_id AND city.id = ${id}`,
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

const aircraftPassengers = (request, response) => {
  pool.query(
    `SELECT aircraft.type, passenger.first_name, passenger.last_name  FROM aircraft, passenger, passenger_aircraft
    where passenger_aircraft.passenger_id = passenger.id
    AND passenger_aircraft.aircraft_id = aircraft.id`,
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

const aircraftPassengersByid = (request, response) => {
  const id = parseInt(request.params.id);

  pool.query(
    `SELECT aircraft.type, passenger.first_name, passenger.last_name  FROM aircraft, passenger, passenger_aircraft
    where passenger_aircraft.passenger_id = passenger.id
    AND passenger_aircraft.aircraft_id = aircraft.id 
    AND passenger.id = ${id}`,
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

const aircraftAirports = (request, response) => {
  pool.query(
    `SELECT aircraft.type, airport.airport_name from aircraft, airport, aircraft_takeoff_land
WHERE aircraft_takeoff_land.aircraft_id = aircraft.id
AND aircraft_takeoff_land.airport_id = airport.id`,
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

const aircraftAirportsBYid = (request, response) => {
  const id = parseInt(request.params.id);

  pool.query(
    `SELECT aircraft.type, airport.airport_name from aircraft, airport, aircraft_takeoff_land
WHERE aircraft_takeoff_land.aircraft_id = aircraft.id
AND aircraft_takeoff_land.airport_id = airport.id
AND aircraft.id = ${id}`,
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

const airportsPassengers = (request, response) => {
  pool.query(
    `SELECT passenger.first_name, passenger.last_name, airport.airport_name from passenger, airport, passenger_airport
WHERE passenger_airport.passenger_id = passenger.id
AND passenger_airport.airport_id = airport.id`,

    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

const airportsPassengersBYid = (request, response) => {
  const id = parseInt(request.params.id);

  pool.query(
    `SELECT passenger.first_name, passenger.last_name, airport.airport_name FROM passenger, airport, passenger_airport
WHERE passenger_airport.passenger_id = passenger.id
AND passenger_airport.airport_id = airport.id
AND passenger.id = ${id}` ,
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};
module.exports = {
  getAircrafts,
  createAircraft,
  deleteAircraft,
  updateAircraft,
  airportsCities,
  airportsCitiesByid,
  aircraftPassengers,
  aircraftPassengersByid,
  aircraftAirports,
  aircraftAirportsBYid,
  airportsPassengers,
  airportsPassengersBYid,
};
