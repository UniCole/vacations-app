import express, { Request, Response, NextFunction } from "express";
import VacationModel from "../4-models/vacation-model";
import vacationsLogic from "../5-logic/vacations-logic";

const router = express.Router();

// GET http://localhost:3001/api/vacations
router.get("/vacations", async (request: Request, response: Response, next: NextFunction) => {
    try {
        const vacations = await vacationsLogic.getAllVacations();
        response.json(vacations);
    }
    catch (err: any) {
        next(err);
    }
});

// // POST http://localhost:3001/api/vacations
// router.post("/vacations", async (request: Request, response: Response, next: NextFunction) => {
//     try {
//         const vacation = new VacationModel(request.body);
//         const addedVacation = await vacationsLogic.addVacation(vacation);
//         response.status(201).json(addedVacation);
//     }
//     catch (err: any) {
//         next(err);
//     }
// });

// // DELETE http://localhost:3001/api/vacations/:storeId
// router.delete("/vacations/:storeId", async (request: Request, response: Response, next: NextFunction) => {
//     try {
//         const vacationId = +request.params.vacationId;
//         await vacationsLogic.deleteVacation(vacationId);
//         response.sendStatus(204);
//     }
//     catch (err: any) {
//         next(err);
//     }
// });


export default router;