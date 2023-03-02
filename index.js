const express = require("express");
const bodyParser = require("body-parser");
const restAPP = express();
const pgDBAccessLayer = require("./db");
const port = 3000;

//-----------------------------------------------

restAPP.use(bodyParser.json());
restAPP.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

//------------------------------------------

restAPP.get("/", (request, response) => {
  response.json({ info: "Node.js, Express, and Postgres API" });
});

//--------------------------------------------------------------

restAPP.get("/aircrafts", pgDBAccessLayer.getAircrafts);

//--------------------------------------------------------------

restAPP.post("/aircraft", pgDBAccessLayer.createAircraft);

//---------------------------------------------------------------

restAPP.delete("/aircraft/:id", pgDBAccessLayer.deleteAircraft);

//---------------------------------------------------------------

restAPP.put("/aircraft/:id", pgDBAccessLayer.updateAircraft);

//---------------------------------------------------------------

restAPP.get("/airport/city", pgDBAccessLayer.airportsCities);

restAPP.get("/airport/city/:id", pgDBAccessLayer.airportsCitiesByid);

restAPP.get("/aircraft/passengers", pgDBAccessLayer.aircraftPassengers)

restAPP.get("/aircraft/passengers/:id", pgDBAccessLayer.aircraftPassengersByid);

restAPP.get("/aircraft/airport", pgDBAccessLayer.aircraftAirports);

restAPP.get("/aircraft/airport/:id", pgDBAccessLayer.aircraftAirportsBYid);

restAPP.get("/airport/passengers", pgDBAccessLayer.airportsPassengers);

restAPP.get("/airport/passengers/:id", pgDBAccessLayer.airportsPassengersBYid);


restAPP.listen(port, () => {
  console.log(`App running on port ${port}.`);
});

