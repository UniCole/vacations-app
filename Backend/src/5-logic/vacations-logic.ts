import { OkPacket } from "mysql";
import dal from "../2-utils/dal";
import { ResourceNotFoundErrorModel, ValidationErrorModel } from "../4-models/error-models";
import VacationModel from "../4-models/vacation-model";


// Get all vacations: 
async function getAllVacations(): Promise<VacationModel[]> {

    // select all vacations:
    const sql = `SELECT * FROM vacations`;

    // Execute:
    const vacations = await dal.execute(sql);

    // return all vacations:
    return vacations;
}

// // Add new vacation: 
// async function addVacation(vacation: VacationModel): Promise<VacationModel> {

//     // Validation: 
//     const error = vacation.validate();
//     if (error) throw new ValidationErrorModel(error);

//     // Query: 
//     const sql = `
//         INSERT INTO vacations VALUES(
//             DEFAULT,
//             '${vacation.description}',
//             '${vacation.destination}',
//             '${vacation.checkIn}',
//             '${vacation.checkOut}',
//             '${vacation.price})',
//             DEFAULT;`;

//     // Execute: 
//     const info: OkPacket = await dal.execute(sql);

//     // Set auto increment id back to vacation: 
//     vacation.vacationId = info.insertId;

//     // Return:
//     return vacation;
// }

// // DELETE vacation:
// async function deleteVacation(vacationId: number): Promise<void> {

//     // Query: 
//     const sql = `DELETE FROM vacations WHERE vacationId = ${vacationId}`;

//     // Execute: 
//     const info: OkPacket = await dal.execute(sql);

//     // If not exist:
//     if (info.affectedRows === 0) throw new ResourceNotFoundErrorModel(vacationId);
// }


export default {
    getAllVacations,
    // addVacation,
    // deleteVacation
};