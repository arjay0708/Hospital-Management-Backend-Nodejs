const express = require('express');
const bodyParser = require('body-parser');
const patientRouter = require('./routes/patients');
const doctorRouter = require('./routes/doctors');
const medicationRouter = require('./routes/medications');
const prescriptionRequestRouter = require('./routes/prescriptionRequest');
const prescribedMedicationRouter = require('./routes/prescribedMedications');
const prescriptionRouter = require('./routes/prescriptions');
const patientRoutesRouter = require('./routes/patientRoutes');
const doctorRoutesRouter = require('./routes/doctorRoutes');

const app = express();
app.use(bodyParser.json());

// Mount patient, doctor, medication, prescription request, and prescribed medication routes
app.use('/patients', patientRouter);
app.use('/doctors', doctorRouter);
app.use('/medications', medicationRouter);
app.use('/prescription-requests', prescriptionRequestRouter);
app.use('/prescribed-medications', prescribedMedicationRouter);
app.use('/prescriptions', prescriptionRouter);
app.use('/patients', patientRoutesRouter);
app.use('/doctors', doctorRoutesRouter);

module.exports = app;
