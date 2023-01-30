import { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import { useNavigate, useParams } from "react-router-dom";
import VacationModel from "../../../Models/VacationModel";
import "./EditVacation.css";
import swal from "sweetalert";
import vacationsService from "../../../Services/VacationsService";
import useVerifyLoggedIn from "../../../Utils/useVerifyLoggedIn";

function EditVacation(): JSX.Element {

    useVerifyLoggedIn();

    const { register, handleSubmit, formState, setValue } = useForm<VacationModel>();

    // Function redirect to another page:
    const navigate = useNavigate();

    // Extract info from route:
    const params = useParams();

    // useEffect performing once - perform once when component is ready for use:
    useEffect(() => {

        const vacationId = +params.vacationId; // Same name as router parameter.

        // Get one vacation:
        vacationsService.getOneVacation(vacationId)
            .then(vacation => {
                setValue("vacationId", vacation.vacationId)
                setValue("description", vacation.description);
                setValue("destination", vacation.destination);
                setValue("checkIn", new Date(vacation.checkIn).toISOString().split('T')[0]);
                setValue("checkOut", new Date(vacation.checkOut).toISOString().split('T')[0]);
                setValue("price", vacation.price);
                setValue("image", vacation.image);
            })
            .catch(err => swal({
                title: err,
                icon: "error"
            }));

    }, [])

    async function send(vacation: VacationModel) {
        // Check if dates is legal:
        if (new Date(vacation.checkIn) > new Date(vacation.checkOut)) {
            return swal({
                title: "Check In can't be in the past!",
                icon: "error"
            });
        }
        try {
            await vacationsService.updateVacation(vacation);
            swal({
                title: "Vacation has been successfully updated",
                icon: "success"
            });
            // Function redirect to another page:
            navigate("/vacations");
        }
        catch (err: any) {
            swal({
                title: err,
                icon: "error"
            });
        }

    }

    const [file, setFile] = useState<File>(null);
    const changeHandler = (e: any) => {
        const file1 = e.target.files[0];
        setFile(file1);
    }

    return (
        <div className="EditVacation">
            <form onSubmit={handleSubmit(send)}>

                <h2>Edit vacation</h2><br />

                <label>Description: </label>
                <textarea rows={3} autoComplete="off" placeholder="Description" className="Input" {...register("description", VacationModel.descriptionValidation)} required />
                <span className="Error">{formState.errors.description?.message}</span>
                <br />

                <label>Destination: </label>
                <input type="text" placeholder="Destination" className="Input" {...register("destination", VacationModel.destinationValidation)} required />
                <span className="Error">{formState.errors.destination?.message}</span>

                <label>Check in: </label>
                <input type="date" placeholder="checkIn" className="Input" {...register("checkIn", VacationModel.checkInValidation)} required min="0" />
                <span className="Error">{formState.errors.checkIn?.message}</span>

                <label>Check out: </label>
                <input type="date" placeholder="checkOut" className="Input" {...register("checkOut", VacationModel.checkOutValidation)} required min="0" />
                <span className="Error">{formState.errors.checkOut?.message}</span>

                <label>Price: </label>
                <input type="number" placeholder="price" className="Input" {...register("price", VacationModel.priceValidation)} required min="0" />
                <span className="Error">{formState.errors.price?.message}</span>

                <label>Image: </label>
                <input type="file" className="Input" onChangeCapture={changeHandler} accept="image/*" {...register("image")} required />
                {file && <img src={URL.createObjectURL(file)} />}

                <button> Edit </button>

            </form>
        </div>
    );
}

export default EditVacation;