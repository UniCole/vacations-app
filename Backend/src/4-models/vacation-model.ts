import Joi from "joi";

class VacationModel {
    public vacationId: number;
    public description: string;
    public destination: string;
    // public image: FileList;
    public checkIn: string;
    public checkOut: string;
    public price: string;
    public followersAmount: number;

    public constructor(vacation: VacationModel) {
        this.vacationId = vacation.vacationId;
        this.description = vacation.description;
        this.destination = vacation.destination;
        // this.image = vacation.image;
        this.checkIn = vacation.checkIn;
        this.checkOut = vacation.checkOut;
        this.price = vacation.price;
        this.followersAmount = vacation.followersAmount;
    }

    public static validationSchema = Joi.object({
        vacationId: Joi.number().optional().integer().positive(),
        description: Joi.string().required().min(50).max(500),
        destination: Joi.string().required().min(2).max(100),
        // image: Joi.string().required()
        checkIn: Joi.string().required().min(10).max(10), 
        checkOut: Joi.string().required().min(10).max(10),
        price: Joi.string().required().min(3).max(15),
        followersAmount: Joi.number().optional().integer().positive().max(5)
    });

    public validate(): string {
        const result = VacationModel.validationSchema.validate(this);
        return result.error?.message
    }
}

export default VacationModel;